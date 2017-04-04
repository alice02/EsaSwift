import XCTest
@testable import EsaSwift

class EsaClientTests: XCTestCase {

    func testCurrentTeam() {
        let token = "token"
        let team = "team"
        let client = EsaClient(access_token: token, current_team: team)

        XCTAssertEqual(client.current_team, team)
        XCTAssertEqual(client.access_token, token)
    }

    func testHeaders() {
        let token = "token"
        let team = "team"
        let client = EsaClient(access_token: token, current_team: team)

        XCTAssertEqual(client.header["Accept"], "application/json")
        XCTAssertEqual(client.header["Authorization"], "Bearer \(token)")
        XCTAssertEqual(client.header["Content-Type"], "application/json")
    }

    static var allTests : [(String, (EsaClientTests) -> () throws -> Void)] {
        return [
          ("testCurrentTeam", testCurrentTeam),
          ("testHeaders", testHeaders),
        ]
    }
}
