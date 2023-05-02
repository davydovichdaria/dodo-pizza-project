//import Foundation
//
//class MenuAPIOld {
//    let session = URLSession(configuration: .default)
//
//    func fetchMenu() async throws -> [ProductModel] {
//
//        var urlComponents = URLComponents.init()
//        urlComponents.scheme = "https"
//        urlComponents.host = "apingweb.com"
//        urlComponents.path = "/api/rest/dc3f4da362688669f36136edb4468d3015/menu"
//
//        guard let url = urlComponents.url else { throw NetworkError.invalidURL }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = ["content-type":"application/json; charset=utf-8"]
//
//        let decoder = JSONDecoder()
//
//        do {
//            let (data, response) = try await session.data(for: request)
//
//            if let response = response as? HTTPURLResponse {
//                switch response.statusCode {
//                case 200..<300:
//                    print("Success - status: \(response.statusCode)")
//                    break
//                case 300..<400:
//                    print("Failure - redirection error \(response.statusCode)")
//                    break
//                case 400..<500:
//                    print("Failure - client error \(response.statusCode)")
//                    break
//                case 500..<600:
//                    print("Failure - server error \(response.statusCode)")
//                    break
//                default:
//                    print("Status: \(response.statusCode)")
//                }
//            }
//
//            let jsonResponse = try decoder.decode(ProductResponse.self, from: data)
//            return jsonResponse.products
//        } catch {
//            print(error)
//            throw NetworkError.invalidRequest
//        }
//    }
//}
