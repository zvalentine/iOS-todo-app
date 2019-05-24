import UIKit

struct ToDoService : ToDoServiceProtocol {
    init() {}
    
    func getToDoItems() -> [ToDoItem] {
        //real implementation here
        return [ToDoItem(title: "")]
    }
}
