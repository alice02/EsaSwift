import HTTPClient

protocol EsaClientProtocol {
    func send_get(path: String) -> EsaResponse?
    func send_post(path: String) -> EsaResponse?
    func send_put(path: String) -> EsaResponse?
    func send_delete(path: String) -> EsaResponse?
}

class EsaClient: EsaClientProtocol {

    var access_token: String?
    var current_team: String?
    let api_endpoint = URL(string: "https://api.esa.io")
    let auth_header: Headers?
    let client: Client?
    
    init(access_token: String? = nil, current_team: String? = nil) {
        self.access_token = access_token
        self.current_team = current_team
        self.auth_header = ["Authorization": "Bearer \(self.access_token!)"]
        do {
            self.client = try Client(url: api_endpoint!)
        } catch {
            self.client = nil
        }
    }
    
    func send_get(path: String) -> EsaResponse? {
        do {
            var response = try client!.get(path, headers: auth_header!)
            return EsaResponse(response: response)
        } catch {
            // TODO Error Handling
            return nil
        }
    }

    func send_post(path: String) -> EsaResponse? {
        do {
            var response = try client!.post(path, headers: auth_header!)
            return EsaResponse(response: response)
        } catch {
            // TODO Error Handling
            return nil
        }
    }

    func send_put(path: String) -> EsaResponse? {
        do {
            var response = try client!.put(path, headers: auth_header!)
            return EsaResponse(response: response)
        } catch {
            // TODO Error Handling
            return nil
        }
    }

    func send_delete(path: String) -> EsaResponse? {
        do {
            var response = try client!.delete(path, headers: auth_header!)
            return EsaResponse(response: response)
        } catch {
            // TODO Error Handling
            return nil
        }
    }

}
