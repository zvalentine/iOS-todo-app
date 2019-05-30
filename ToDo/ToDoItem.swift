import UIKit

public class ToDoItem : Codable {
    var _id: String = ""
    var title: String = ""
    var body: String = ""
    var isComplete: Bool = false
    
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
    
    init(id: String, title: String, body: String, isComplete: Bool) {
        self._id = id
        self.title = title
        self.body = body
        self.isComplete = isComplete
    }
}
