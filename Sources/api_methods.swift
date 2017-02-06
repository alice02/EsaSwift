extension EsaClient {

    func user() -> EsaResponse? {
        return send_get(path: "/v1/user")
    }

    func teams() -> EsaResponse? {
        return send_get(path: "/v1/teams")
    }

    func team(team_name: String) -> EsaResponse? {
        return send_get(path: "/v1/teams/\(team_name)")
    }

    func stats() -> EsaResponse? {
        return send_get(path: "/v1/teams/\(self.current_team!)/stats")
    }

    func members() -> EsaResponse? {
        return send_get(path: "/v1/teams/\(self.current_team!)/members")
    }

    func posts(params: Dictionary<String, String>? = nil) -> EsaResponse? {
        return send_get(path: "/v1/teams/\(self.current_team!)/posts", params: params)
    }

    func post(post_number: Int) -> EsaResponse? {
        return send_get(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)")
    }

    func create_post(body: Any) -> EsaResponse? {
        let post_body = ["post": body]
        return send_post(path: "/v1/teams/\(self.current_team!)/posts", body: post_body)
    }

    func update_post(post_number: Int, body: Any) -> EsaResponse? {
        let post_body = ["post": body]
        return send_patch(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)", body: post_body)
    }

    func delete_post(post_number: Int) -> EsaResponse? {
        return send_delete(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)")
    }
    
    func comments(post_number: Int, params: Dictionary<String, String>? = nil) -> EsaResponse? {
        return send_get(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)/comments", params: params)
    }

    func comment(comment_id: Int, params: Dictionary<String, String>? = nil) -> EsaResponse? {
        return send_get(path: "/v1/teams/\(self.current_team!)/comments/\(comment_id)", params: params)
    }

    func create_comment(post_number: Int, body: Any) -> EsaResponse? {
        let comment_body = ["comment": body]
        return send_post(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)/comments", body: comment_body)
    }

    func update_comment(comment_id: Int, body: Any) -> EsaResponse? {
        let comment_body = ["comment": body]
        return send_patch(path: "/v1/teams/\(self.current_team!)/comments/\(comment_id)", body: comment_body)
    }

    func delete_comment(comment_id: Int) -> EsaResponse? {
        return send_delete(path: "/v1/teams/\(self.current_team!)/comments/\(comment_id)")
    }

    func create_sharing(post_number: Int) -> EsaResponse? {
        return send_post(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)/sharing", body: [:])
    }

    func delete_sharing(post_number: Int) -> EsaResponse? {
        return send_delete(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)/sharing")
    }

    func post_stargazers(post_number: Int) -> EsaResponse? {
        return send_get(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)/stargazers")
    }

    func add_post_star(post_number: Int) -> EsaResponse? {
        return send_post(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)/star", body: [:])
    }

    func delete_post_star(post_number: Int) -> EsaResponse? {
        return send_delete(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)/star")
    }

    func comment_stargazers(comment_id: Int) -> EsaResponse? {
        return send_get(path: "/v1/teams/\(self.current_team!)/comments/\(comment_id)/stargazers")
    }

    func add_comment_star(comment_id: Int) -> EsaResponse? {
        return send_post(path: "/v1/teams/\(self.current_team!)/comments/\(comment_id)/star", body: [:])
    }

    func delete_comment_star(comment_id: Int) -> EsaResponse? {
        return send_delete(path: "/v1/teams/\(self.current_team!)/comments/\(comment_id)/star")
    }

    func watchers(post_number: Int) -> EsaResponse? {
        return send_get(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)/watchers")
    }

    func add_watch(post_number: Int) -> EsaResponse? {
        return send_post(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)/watch", body: [:])
    }

    func delete_watch(post_number: Int) -> EsaResponse? {
        return send_delete(path: "/v1/teams/\(self.current_team!)/posts/\(post_number)/watch")
    }

    func categories() -> EsaResponse? {
      return send_get(path: "/v1/teams/\(self.current_team!)/categories")
    }

    func tags() -> EsaResponse? {
        return send_get(path: "/v1/teams/\(self.current_team!)/tags")
    }
}
