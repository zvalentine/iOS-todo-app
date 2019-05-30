import UIKit

public class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var toDoService: ToDoServiceProtocol = ToDoService()
    var toDoItems: [ToDoItem] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var addTaskButton: UIButton!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //tableView.dataSource = self;
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel!.text = toDoItems[indexPath.row].title
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        tableView.dataSource = self;
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (action: UIContextualAction, sourceView: UIView, actionPerformed: (Bool) -> Void) in
            print("deleting row")
            
            actionPerformed(true)
        }
        deleteAction.backgroundColor = .red
        deleteAction.image = UIImage(named: "trash")
        
        let completeAction = UIContextualAction(style: .normal, title: nil) { (action: UIContextualAction, sourceView: UIView, actionPerformed: (Bool) -> Void) in

            let completedItem = self.toDoItems[indexPath.row]
            completedItem.isComplete = true
            
            self.toDoService.updateToDoItem(toDoItem: completedItem)
            self.loadToDoItems()
            
            actionPerformed(true)
        }
        completeAction.backgroundColor = .init(red: CGFloat(51/255.0), green: CGFloat(165/255.0), blue: CGFloat(50/255.0), alpha: CGFloat(1.0))
        completeAction.image = UIImage(named: "check")
        return UISwipeActionsConfiguration(actions: [completeAction, deleteAction])
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //this will hide extra empty cells
        self.tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        self.toDoItems = []
        loadToDoItems()
    }
    
    override public func viewDidLayoutSubviews() {
        configureButton()
    }
    
    func loadToDoItems(){
        toDoService.getToDoItems(completionHandler: addToDoItemsToList)
    }
    
    func configureButton()
    {
        addTaskButton.layer.cornerRadius = 0.5 * addTaskButton.bounds.size.width
        addTaskButton.layer.borderColor = UIColor.lightGray.cgColor as CGColor
        addTaskButton.layer.borderWidth = 2.0
        addTaskButton.tintColor = UIColor.lightGray
        addTaskButton.clipsToBounds = true
        addTaskButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10);
    }
    
    func addToDoItemsToList(data: Data?) -> Void {
        self.toDoItems = []
        if let data = data {
            let object = JSONParser.parse(data: data)
            
            if let object = object {
                object.forEach { o in
                    guard let title = o["title"], !(o["isComplete"] as! Bool) else {
                        return
                    }
                    self.toDoItems.append(ToDoItem(id: o["_id"] as! String, title: title as! String, body: o["body"] as! String,    isComplete: o["isComplete"] as! Bool))
                }
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

