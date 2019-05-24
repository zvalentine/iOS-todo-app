import XCTest
@testable import ToDo

class ViewControllerTest: XCTestCase {
    var controller: ViewController!
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        let mockService = MockToDoService()
        
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: Bundle.main)
        controller = storyboard.instantiateInitialViewController() as! ViewController
        
        controller.toDoService = mockService
        
        window.addSubview(controller.view)
    }
    
    override func tearDown() {
    }
    
    func testOnLoadGetsToDoItems() {
        XCTAssertTrue(controller.toDoItems.count == 3)
    }
    
}
