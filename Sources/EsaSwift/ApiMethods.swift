extension EsaClient {

    func user() throws -> EsaResponse? {
        return try send_get(path: "/v1/user")
    }

    func teams() throws -> EsaResponse? {
        return try send_get(path: "/v1/teams")
    }

    func team(team_name: String) throws -> EsaResponse? {
        return try send_get(path: "/v1/teams/\(team_name)")
    }

    func stats() throws -> EsaResponse? {
        return try send_get(path: "/v1/teams/\(self.current_team!)/stats")
    }

    func members() throws -> EsaResponse? {
        return try send_get(path: "/v1/teams/\(self.current_team!)/members")
    }

    func posts(params: Dictionary<String, String>? = nil) throws -> EsaResponse? {
        return try send_get(path: "/v1/teams/\(self.current_team!)/posts", params: params)
    }

    func post(post_number: Int) throws -> EsaResponse? {
        return try send_get(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)")
    }

    func create_post(body: Any) throws -> EsaResponse? {
        let post_body = ["post": body]
        return try send_post(path: "/v1/teams/\(self.current_team!)/posts", body: post_body)
    }

    func update_post(post_number: Int, body: Any) throws -> EsaResponse? {
        let post_body = ["post": body]
        return try send_patch(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)", body: post_body)
    }

    func delete_post(post_number: Int) throws -> EsaResponse? {
        return try send_delete(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)")
    }
    
    func comments(post_number: Int, params: Dictionary<String, String>? = nil) throws -> EsaResponse? {
        return try send_get(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)/comments", params: params)
    }

    func comment(comment_id: Int, params: Dictionary<String, String>? = nil) throws -> EsaResponse? {
        return try send_get(path: "/v1/teams/\(self.current_team!)/comments/\(comment_id)", params: params)
    }

    func create_comment(post_number: Int, body: Any) throws -> EsaResponse? {
        let comment_body = ["comment": body]
        return try send_post(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)/comments", body: comment_body)
    }

    func update_comment(comment_id: Int, body: Any) throws -> EsaResponse? {
        let comment_body = ["comment": body]
        return try send_patch(path: "/v1/teams/\(self.current_team!)/comments/\(comment_id)", body: comment_body)
    }

    func delete_comment(comment_id: Int) throws -> EsaResponse? {
        return try send_delete(path: "/v1/teams/\(self.current_team!)/comments/\(comment_id)")
    }

    func create_sharing(post_number: Int) throws -> EsaResponse? {
        return try send_post(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)/sharing", body: [:])
    }

    func delete_sharing(post_number: Int) throws -> EsaResponse? {
        return try send_delete(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)/sharing")
    }

    func post_stargazers(post_number: Int) throws -> EsaResponse? {
        return try send_get(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)/stargazers")
    }

    func add_post_star(post_number: Int) throws -> EsaResponse? {
        return try send_post(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)/star", body: [:])
    }

    func delete_post_star(post_number: Int) throws -> EsaResponse? {
        return try send_delete(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)/star")
    }

    func comment_stargazers(comment_id: Int) throws -> EsaResponse? {
        return try send_get(path: "/v1/teams/\(self.current_team!)/comments/\(comment_id)/stargazers")
    }

    func add_comment_star(comment_id: Int) throws -> EsaResponse? {
        return try send_post(path: "/v1/teams/\(self.current_team!)/comments/\(comment_id)/star", body: [:])
    }

    func delete_comment_star(comment_id: Int) throws -> EsaResponse? {
        return try send_delete(path: "/v1/teams/\(self.current_team!)/comments/\(comment_id)/star")
    }

    func watchers(post_number: Int) throws -> EsaResponse? {
        return try send_get(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)/watchers")
    }

    func add_watch(post_number: Int) throws -> EsaResponse? {
        return try send_post(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)/watch", body: [:])
    }

    func delete_watch(post_number: Int) throws -> EsaResponse? {
        return try send_delete(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)/watch")
    }

    func categories() throws -> EsaResponse? {
      return try send_get(path: "/v1/teams/\(self.current_team!)/categories")
    }

    func tags() throws -> EsaResponse? {
        return try send_get(path: "/v1/teams/\(self.current_team!)/tags")
    }
}
