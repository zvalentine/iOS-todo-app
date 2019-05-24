import UIKit

public class ViewController: UIViewController, UITableViewDataSource {
    var toDoService: ToDoServiceProtocol?
    var toDoItems: [ToDoItem] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dataSource = self;
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel!.text = toDoItems[indexPath.row].title
        
        return cell
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //this will hide extra empty cells
        self.tableView.tableFooterView = UIView()
        tableView.dataSource = self
        
        toDoItems = (toDoService?.getToDoItems())!
    }
}

