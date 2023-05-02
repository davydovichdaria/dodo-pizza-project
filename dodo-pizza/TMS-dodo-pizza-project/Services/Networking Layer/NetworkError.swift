import Foundation

enum NetworkError: Error { //enum with all errors we need to handle
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    case invalidRequest
    
    var description: String {
        switch self {
        case .decode:
            return "Decode error"
        case .invalidURL:
            return "Invalid URL error"
        case .noResponse:
            return "No response error"
        case .unauthorized:
            return "Unauthorized error"
        case .unexpectedStatusCode:
            return "Unexpected status code error"
        case .unknown:
            return "Unknown error"
        case .invalidRequest:
            return "Invalid request error"
        }
    }
}
