//import XCTest
//import XCTest_Gherkin
//@testable import ToDo
//
//class ToDoAcceptanceTests: XCTestCase {
//    func testBasicSteps() {
//        Given("I have a default list of tasks")
//        When("I start the app")
//        Then("I should see the default tasks")
//    }
//}
//
//class StepDefinitions: StepDefiner {
//    override func defineSteps() {
//        step("I have a default list of tasks") {
//            let viewController = ViewController()
//            viewController.toDoItems = buildDefaultTaskList()
//        }
//        step("I start the app") {
//
//        }
//        step("I should see the default tasks") {
//
//        }
//    }
//
//
//    func buildDefaultTaskList() -> [ToDoItem] {
//        var firstItem = ToDoItem()
//        var secondItem = ToDoItem()
//        var thirdItem = ToDoItem()
//        let defaultList: [ToDoItem] = [firstItem, secondItem, thirdItem]
//        return defaultList
//    }
//}
