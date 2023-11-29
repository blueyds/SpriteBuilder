import XCTest
@testable import SpriteBuilder
struct sceneTest: SceneProtocol{
	var body: [Modifier] {
		Name(name: "test")
	}
}
final class SpriteBuilderTests: XCTestCase {
    func testExample() throws {
		let scene = GameScene(sceneTest())
		XCTAssert(scene.scene.name == "test")
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
}
