//
//  ViewController.swift
//  ToDo
//
//  Created by zachary.j.valentine on 5/23/19.
//  Copyright © 2019 zachary.j.valentine. All rights reserved.
//

import UIKit

public class ViewController: UIViewController {
    var toDoItems: [String] = []
    
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
        self.toDoItems = ["walk dog", "eat", "code"]
    }


}

