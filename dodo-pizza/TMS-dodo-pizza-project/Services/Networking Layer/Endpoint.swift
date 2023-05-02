import Foundation

protocol Endpoint { //Оболочка для URL
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: HTTPMethod { get}
    var parameters: [URLQueryItem] { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint { //Устанавливаем по дефолту
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "apingweb.com"
    }
    
    var header: [String: String]? {
        return ["content-type":"application/json; charset=utf-8"]
    }
}


