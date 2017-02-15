import XCTest
@testable import EsaSwift

class EsaClientTests: XCTestCase {

    func testCurrentTeam() {
        let token = "token"
        let team = "team"
        let client = EsaClient(access_token: token, current_team: team)
        
        XCTAssertEqual(client.current_team, team)
    }

    static var allTests : [(String, (EsaClientTests) -> () throws -> Void)] {
        return [
          ("testCurrentTeam", testCurrentTeam),
        ]
    }   
}
