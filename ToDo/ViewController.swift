import UIKit

public class ViewController: UIViewController {
    var toDoItems: [ToDoItem] = []
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
    

    override public func viewDidLoad() {
        super.viewDidLoad()
        getToDoItems()
        // Do any additional setup after loading the view.
        
    }
    
    public func getToDoItems() {
        //get to do items from repo
        self.toDoItems = [ToDoItem(title: "walk dog"), ToDoItem(title: "eat"), ToDoItem(title: "code")]
    }


}

