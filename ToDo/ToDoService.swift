import UIKit
import Alamofire

struct ToDoService : ToDoServiceProtocol {
    init() {}
    
    func getToDoItems(completionHandler: @escaping (Data?) -> (Void)) {
        let todoEndpoint: String = "http://localhost:3000/todos/"
        
        HttpHandler.getJson(urlString: todoEndpoint, completionHandler: completionHandler)
    }
    
    func updateToDoItem(toDoItem: ToDoItem) -> Void {
        let todoEndpoint: String = "http://localhost:3000/todos/\(toDoItem._id)"
        
        HttpHandler.sendPut(urlString: todoEndpoint, toDoItem: toDoItem)
    }
    
    func saveToDoItem(toDoItem: ToDoItem) -> Void {
        let todoEndpoint: String = "http://localhost:3000/todos/"
        
        HttpHandler.sendPost(urlString: todoEndpoint, toDoItem: toDoItem)
    }
}
