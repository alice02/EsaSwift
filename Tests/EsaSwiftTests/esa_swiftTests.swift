import XCTest
@testable import EsaSwift

class EsaSwiftTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(EsaSwift().text, "Hello, World!")
    }


    static var allTests : [(String, (EsaSwiftTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
