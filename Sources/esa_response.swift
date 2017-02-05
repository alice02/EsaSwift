import Foundation

struct EsaResponse {

    private var raw_data: Data
    private var raw_response: HTTPURLResponse
    
    init(data: Data?, response: URLResponse?) {
        self.raw_data = data!
        self.raw_response = response! as! HTTPURLResponse
    }

    var body: Any {
        get {
            do {
                let json = try JSONSerialization.jsonObject(with: raw_data, options: .allowFragments)
                return json
            } catch {
                // TODO Error Handling
                return [:]
            }
        }
    }
    
    var headers: Any {
        get {
            return raw_response.allHeaderFields
        }
    }
    
    var status: Int {
        get {
            return self.raw_response.statusCode
        }
    }
}
