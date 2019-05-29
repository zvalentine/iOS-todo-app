import Foundation

class HttpHandler {
    static func getJson(urlString: String, completionHandler: @escaping (Data?) -> (Void)) {
        let urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = URL(string: urlString!)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { data, response, error in
            if let data = data {
                let httpResponse = response as! HTTPURLResponse
                let statusCode = httpResponse.statusCode
                
                if (statusCode == 200) {
                    completionHandler(data as Data)
                    return
                } else if error != nil {
                    print("there was an error")
                }
                completionHandler(nil)
                return
            }
        }
        task.resume()
    }
    
    static func sendPost(urlString: String, toDoItem: ToDoItem) -> Void {
        let Url = String(format: urlString)
        guard let serviceUrl = URL(string: Url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        let jsonData = try? JSONEncoder().encode(toDoItem)
        request.httpBody = Data(jsonData!)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            if let data = data {
                let httpResponse = response as! HTTPURLResponse
                let statusCode = httpResponse.statusCode
            }
        }
        task.resume()
    }
}
