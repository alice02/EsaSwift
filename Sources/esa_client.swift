import Foundation

protocol EsaClientProtocol {
    func send_get(path: String, params: Dictionary<String, String>?) -> EsaResponse
    func send_post(path: String, body: Any) -> EsaResponse
    func send_patch(path: String, body: Any) -> EsaResponse
    func send_delete(path: String) -> EsaResponse
}

class EsaClient {

    var access_token: String?
    var current_team: String?
    var header = Dictionary<String, String>()
    let client = HTTPClient(url: "https://api.esa.io")
    
    init(access_token: String?, current_team: String? = nil) {
        self.access_token = access_token
        self.current_team = current_team
        self.set_default_header()
    }
    
    func send_get(path: String, params: Dictionary<String, String>? = nil) -> EsaResponse {
        let response = client.request(method: .get, path: path, params: params, headers: header)
        return EsaResponse(response: response)
    }

    func send_post(path: String, body: Any) -> EsaResponse {
        var bodyData: Data?
        do {
            bodyData = try JSONSerialization.data(withJSONObject: body,
                                                  options: .prettyPrinted)
        } catch {
            // TODO Error handling
            print("json serialization error")
        }

        let response =  client.request(method: .post, path: path,
                                  headers: header, body: bodyData)
        return EsaResponse(response: response)
    }

    func send_patch(path: String, body: Any) -> EsaResponse {
        var bodyData: Data?
        do {
            bodyData = try JSONSerialization.data(withJSONObject: body,
                                                  options: .prettyPrinted)
        } catch {
            // TODO Error handling
            print("json serialization error")
        }
        let response = client.request(method: .patch, path: path,
                                      headers: header, body: bodyData)
        return EsaResponse(response: response)
    }

    func send_delete(path: String) -> EsaResponse {
        let response = client.request(method: .delete, path: path, headers: header)
        return EsaResponse(response: response)
    }

    private func set_default_header() {
        header["Accept"] = "application/json"
        header["Authorization"] = "Bearer \(self.access_token!)"
        header["Content-Type"] = "application/json"        
    }

}
