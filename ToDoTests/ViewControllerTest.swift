import XCTest
@testable import ToDo

class ViewControllerTest: XCTestCase {
    var viewController: ToDo.ViewController!
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        //        viewController = (navigationController.topViewController as! ViewController)
        //
        //        UIApplication.shared.keyWindow!.rootViewController = viewController
        
        viewController = (storyboard.instantiateViewController(withIdentifier: "ViewController")) as! ToDo.ViewController
        
        
        
        //viewController.toDoItems = toDoItems
        
        // The One Weird Trick!
        //let _ = navigationController.view
        //let _ = viewController.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testOnLoadGetsToDoItems() {
        viewController.getToDoItems()
        XCTAssertEqual(viewController.toDoItems.count, 3)
    }
    
}
