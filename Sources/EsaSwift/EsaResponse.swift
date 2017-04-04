import Foundation

struct EsaResponse {
    var response: Response

    init(response: Response) {
        self.response = response
    }

    var body: Dictionary<String, String>? {
        get {
            do {
                let json = try JSONSerialization.jsonObject(with: response.body!,
                                                            options: .allowFragments) as? [String: Any]
                var jsonItems = Dictionary<String, String>()
                for (key, val) in json! {
                    jsonItems[key] = String(describing: val)
                }
                return jsonItems
            } catch {
                return ["Error":"EsaResponseError.JSONSerialization"]
            }
        }
    }

    var headers: Dictionary<String, String>? {
        get {
            return response.headers as? Dictionary<String, String>
        }
    }

    var status: Int? {
        get {
            return self.response.status!
        }
    }
}
