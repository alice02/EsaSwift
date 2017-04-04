# EsaSwift

[![Swift](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://swift.org)
[![Build Status](https://travis-ci.org/alice02/EsaSwift.svg?branch=master)](https://travis-ci.org/alice02/EsaSwift)

esa API client for Swift

# Installation
- via Swift Package Manager
```swift
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "https://github.com/alice02/EsaSwift.git"),
    ]
)
```

# Usage
## Example
```swift
import EsaSwift

let client = EsaClient(access_token: "<access_token>", current_team: "<current_team>")

print(client.user())
```

## Methods
### Authenticated User API
#### `client.user()`
- GET /v1/user


### Team API

#### `client.teams()`
- GET /v1/teams

#### `client.team(team_name: 'bar')`
- GET /v1/teams/bar

#### `client.stats()`
- GET /v1/teams/bar/stats

#### `client.members()`
- GET /v1/teams/bar/members


### Post API
#### `client.posts()`
- GET /v1/teams/foobar/posts

#### `client.posts(params: ['in':'help'])`
- GET /v1/teams/foobar/posts?q=in%3Ahelp

#### `client.post(post_number: 1)`
- GET /v1/teams/foobar/posts/1

#### `client.create_post(body: ["name": "foo"])`
- POST /v1/teams/foobar/posts

#### `client.update_post(post_number: 1, body: ["name": "bar"])`
- PATCH /v1/teams/foobar/posts/1

#### `client.delete_post(post_number: 1)`
- DELETE /v1/teams/foobar/posts/1


### Comment API
#### `client.comments(post_number: 1)`
- GET /v1/teams/foobar/posts/1/comments

#### `client.create_comment(post_number: 1, body: ["body_md": "baz"])`
- POST /v1/teams/foobar/posts/1/comments

#### `client.comment(comment_id: 123)`
- GET /v1/teams/foobar/comments/123

#### `client.update_comment(comment_id: 123, body: ["body_md": "bazbaz"])`
- PATCH /v1/teams/foobar/comments/123

#### `client.delete_comment(comment_id: 123)`
- DELETE /v1/teams/foobar/comments/123

#### `client.create_sharing(post_number: 1)`
- POST /v1/teams/foobar/posts/1/sharing

#### `client.delete_sharing(post_number: 1)`
- DELETE /v1/teams/foobar/posts/1/sharing


### Star API
#### `client.post_stargazers(post_number: 1)`
- GET /v1/teams/foobar/posts/1/stargazers

#### `client.add_post_star(post_number: 1)`
- POST /v1/teams/foobar/posts/1/star

#### `client.delete_post_star(post_number: 1)`
- DELETE /v1/teams/foobar/posts/1/star

#### `client.comment_stargazers(comment_id: 123)`
- GET /v1/teams/foobar/comments/123/stargazers

#### `client.add_comment_star(comment_id: 123)`
- POST /v1/teams/foobar/comments/123/star

#### `client.delete_comment_star(comment_id: 123)`
- DELETE /v1/teams/foobar/comments/123/star


### Watch API
#### `client.watchers(post_number: 1)`
- GET /v1/teams/foobar/posts/1/watchers

#### `client.add_watch(post_number: 1)`
- POST /v1/teams/foobar/posts/1/watch

#### `client.delete_watch(post_number: 1)`
- DELETE /v1/teams/foobar/posts/1/watch

### Categories API
#### `client.categories()`
- GET /v1/teams/foobar/categories

### Tags API
#### `client.tags()`
- GET /v1/teams/foobar/tags
