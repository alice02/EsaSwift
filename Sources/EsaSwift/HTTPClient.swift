import Foundation

enum HTTPClientError: Error {
    case HTTPRequest
}

class HTTPClient {
    let session: URLSession = URLSession(configuration: .default)
    var base_url: String

    enum HTTPMethod {
        case get
        case post
        case put
        case patch
        case delete
    }

    init(url: String) {
        self.base_url = url
    }

    func request(method: HTTPMethod, path: String, params: Dictionary<String, String>? = nil, headers: Dictionary<String, String>? = nil, body: Data? = nil) throws -> Response {
        var request: URLRequest
        var urlComponents = URLComponents(string: base_url)!
        urlComponents.path = path

        if let queryParams = params {
            var queryItems: [URLQueryItem] = []
            for (key, value) in queryParams {
                queryItems.append(URLQueryItem(name: key, value: value))
            }
            urlComponents.queryItems = queryItems
        }

        request = URLRequest(url: urlComponents.url!)
        if let headerItems = headers {
            for (key, value) in headerItems {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }

        if let httpBody = body {
            request.httpBody = httpBody
        }

        switch method {
        case .get:
            request.httpMethod = "GET"
        case .post:
            request.httpMethod = "POST"
        case .put:
            request.httpMethod = "PUT"
        case .patch:
            request.httpMethod = "PATCH"
        case .delete:
            request.httpMethod = "DELETE"
        }

        return try task(request: request)
    }

    func task(request: URLRequest) throws -> Response {
        var response: URLResponse?
        var data: Data?
        var error: Error?
        let condition = NSCondition()

        session.dataTask(with: request,
                         completionHandler: { (dat, res, err) in
                             data = dat
                             error = err
                             response = res
                             condition.broadcast()
                         }).resume()
        condition.wait()
        if error != nil {
            throw HTTPClientError.HTTPRequest
        }

        return Response(data: data, response: response)
    }
}

struct Response {

    private var raw_data: Data
    private var raw_response: HTTPURLResponse

    init(data: Data?, response: URLResponse?) {
        self.raw_data = data!
        self.raw_response = response! as! HTTPURLResponse
    }

    var body: Data? {
        get {
            return raw_data
        }
    }

    var headers: Any? {
        get {
            return raw_response.allHeaderFields
        }
    }

    var status: Int? {
        get {
            return self.raw_response.statusCode
        }
    }
}
