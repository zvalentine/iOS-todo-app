import UIKit

public class ViewController: UIViewController {
    var toDoService: ToDoServiceProtocol
    var toDoItems: [ToDoItem] = []
    
    init(service: ToDoServiceProtocol){
        self.toDoService = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        toDoItems = toDoService.getToDoItems()
    }
}

