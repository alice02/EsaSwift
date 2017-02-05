import HTTP
import Axis

struct EsaResponse {

    private var raw_body: Body?
    private var raw_headers: Headers?
    private var raw_status: Response.Status?
    
    init(response: Response) {
        self.raw_body = response.body
        self.raw_headers = response.headers
        self.raw_status = response.status
    }

    var body: Map {
        get {
            do {
                var body = self.raw_body!
                let buffer = try body.becomeBuffer(deadline: 3.second.fromNow())
                let map = try JSONMapParser.parse(buffer)
                return map
            } catch {
                return nil
            }
        }
    }
    
    var headers: Headers {
        get {
            return self.raw_headers!
        }
    }
    
    var status: Int {
        get {
            return self.raw_status!.hashValue
        }
    }
}
