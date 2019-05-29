import Foundation

protocol ToDoServiceProtocol {
    func getToDoItems(completionHandler: @escaping (Data?) -> (Void))
    
    func saveToDoItem(toDoItem: ToDoItem) -> Void
}
