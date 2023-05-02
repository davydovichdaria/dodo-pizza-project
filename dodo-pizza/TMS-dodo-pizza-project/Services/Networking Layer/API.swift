import Foundation

protocol API { //Подписавшись на протокол, необходимо реализовать эту функцию
    func request<T: Codable> (endpoint: Endpoint, responseModel: T.Type) async throws -> T
}

extension API {
    func request<T: Codable> (endpoint: Endpoint, responseModel: T.Type) async throws -> T {
        var urlComponents = URLComponents.init()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.parameters
        
        guard let url = urlComponents.url else { throw NetworkError.invalidURL}
        
        var request = URLRequest.init(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        let decoder = JSONDecoder()
        let session = URLSession.init(configuration: .default)
        
        do {
            let (data, response) = try await session.data(for: request)
            
            guard let response = response as? HTTPURLResponse else { throw NetworkError.noResponse}
            
            switch response.statusCode {
            case 200..<300:
                let model = try decoder.decode(responseModel, from: data)
                return model
            case 400..<500:
                throw NetworkError.unauthorized
            default:
                throw NetworkError.unexpectedStatusCode
            }
        } catch {
            print(error)
            throw NetworkError.unexpectedStatusCode
        }
    }
}

