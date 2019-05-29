import UIKit

class CreateToDoViewController: UIViewController {
   var toDoService: ToDoServiceProtocol = ToDoService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleInput.text = nil
        titleInput.placeholder = "Add New Task"
        descriptionInput.text = nil
        descriptionInput.placeholder = "Add Task Description"
    }
    
    @IBOutlet var titleInput: UITextField!
    @IBOutlet var descriptionInput: UITextField!

    @IBAction func submitButton(_ sender: Any) {
        let title = titleInput.text!
        let description = descriptionInput.text!
        if (title.count > 0){
            //call http post and save
            let newToDoItem = ToDoItem(title: title, body: description)
            
            toDoService.saveToDoItem(toDoItem: newToDoItem)
            
            titleInput.text = nil
            descriptionInput.text = nil
            self.showToast(message: "To Do Item Added")
        }
    }
}
