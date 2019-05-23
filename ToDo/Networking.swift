import Foundation

protocol Networking {
    func request(response: (NSData?) -> ())
}
