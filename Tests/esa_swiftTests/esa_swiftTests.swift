import XCTest
@testable import esa_swift

class esa_swiftTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(esa_swift().text, "Hello, World!")
    }


    static var allTests : [(String, (esa_swiftTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
