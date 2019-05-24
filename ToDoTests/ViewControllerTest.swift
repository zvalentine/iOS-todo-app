import XCTest
@testable import ToDo

class ViewControllerTest: XCTestCase {
    var vc: ViewController!
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        let mockService = MockToDoService()
        vc = ViewController(service: mockService)
        
        window.addSubview(vc.view)
    }
    
    override func tearDown() {
    }
    
    func testOnLoadGetsToDoItems() {
        XCTAssertTrue(vc.toDoItems.count == 3)
    }
    
}
