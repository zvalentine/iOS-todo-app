import Foundation

class MockToDoService: ToDoServiceProtocol {
    func saveToDoItem(toDoItem: ToDoItem) {
    }
    
    init() {}
    
    func getToDoItems(completionHandler: @escaping (Data?) -> (Void)) {
    }
    
    func updateToDoItem(toDoItem: ToDoItem) -> Void {
    }
}
