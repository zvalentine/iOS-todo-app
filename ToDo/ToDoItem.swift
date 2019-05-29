import UIKit

public class ToDoItem : Codable {
    var title: String = ""
    var body: String = ""
    var status: Bool = false
    
    init(title: String, body: String) {
        self.title = title
        self.body = body
        self.status = false
    }
}
