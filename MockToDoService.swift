class MockToDoService: ToDoServiceProtocol {
    init() {}
    
    func getToDoItems() -> [ToDoItem] {
        return [ToDoItem(title: "walk dog"), ToDoItem(title: "eat"), ToDoItem(title: "code")]
    }
}
