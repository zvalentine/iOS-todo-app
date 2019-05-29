import Foundation

class JSONParser {
    static func parse (data: Data) -> [[String: AnyObject]]? {
        let options = JSONSerialization.ReadingOptions()
        do {
             let json = try JSONSerialization.jsonObject(with: data, options: options) as? [[String: AnyObject]]
             return json!
        } catch (let parseError) {
            //error
        }
        return nil
    }
}
