import UIKit

public class ViewController: UIViewController, UITableViewDataSource {
    var toDoService: ToDoServiceProtocol = ToDoService()
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

    func addToDoItemsToList(data: Data?) -> Void {
        print("adding to do to list")
        if let data = data {
            let object = JSONParser.parse(data: data)

            if let object = object {
                object.forEach { o in
                    guard let title = o["title"] else {
                        return
                    }
                    self.toDoItems.append(ToDoItem(title: title as! String, body: o["body"] as! String))
                }
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        print("view loaded")
        self.toDoItems = []
        loadToDoItems()
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        print("loading view for first time")
        // Do any additional setup after loading the view.
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //this will hide extra empty cells
        self.tableView.tableFooterView = UIView()
        tableView.dataSource = self
    }
    
    func loadToDoItems(){
        toDoService.getToDoItems(completionHandler: addToDoItemsToList)
    }
}

