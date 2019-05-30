//
//  CompletedTasksViewController.swift
//  ToDo
//
//  Created by aaron.harris on 5/29/19.
//  Copyright © 2019 zachary.j.valentine. All rights reserved.
//

import UIKit

class CompletedTasksViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var toDoService: ToDoServiceProtocol = ToDoService()
    var toDoItems: [ToDoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //this will hide extra empty cells
        self.tableView.tableFooterView = UIView()
        tableView.dataSource = self
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //tableView.dataSource = self;
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel!.text = toDoItems[indexPath.row].title
        
        return cell
    }
    
    func loadToDoItems(){
        toDoService.getToDoItems(completionHandler: addToDoItemsToList)
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        self.toDoItems = []
        loadToDoItems()
    }
    
    func addToDoItemsToList(data: Data?) -> Void {
        self.toDoItems = []
        if let data = data {
            let object = JSONParser.parse(data: data)
            
            if let object = object {
                object.forEach { o in
                    guard let title = o["title"], (o["isComplete"] as! Bool) else {
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
