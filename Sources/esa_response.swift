import HTTP
import Axis
import Foundation

struct EsaResponse {

    private var raw_body: Body?
    private var raw_headers: Headers?
    private var raw_status: Int?
    
    init(response: Response) {
        self.raw_body = response.body
        self.raw_headers = response.headers
        self.raw_status = response.statusCode
    }

    var body: Any {
        get {
            do {
                var body = self.raw_body!
                let buffer = try body.becomeBuffer(deadline: 3.second.fromNow())
                let data = Data(bytes: buffer.bytes)
                let json = try JSONSerialization.jsonObject(with: data)
                return json
            } catch {
                // TODO Error Handling
                return [:]
            }
        }
    }
    
    var headers: [String : String] {
        get {
            var headers_dict: [String: String] = [:]
            for (header, value) in self.raw_headers! {
                headers_dict[header.description] = value
            }
            return headers_dict
        }
    }
    
    var status: Int {
        get {
            return self.raw_status!
        }
    }
}
