import Foundation

enum CatalogEndpoint {
    case getMenu
    case getBanners
    case getCategories
    case getIngredients
}

extension CatalogEndpoint: Endpoint {
    
    var path: String {
        switch self {
        case .getMenu:
            return "/api/rest/dc3f4da362688669f36136edb4468d3015/menu"
        case .getCategories:
            return "/api/rest/d8ef9950913b5a271d4fb2f6bb94dda28/categories"
        default: return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMenu:
            return .get
        case .getBanners:
            return .get
        case .getCategories:
            return .get
        case .getIngredients:
            return .get
        }
    }
    
    var parameters: [URLQueryItem] { //?
        switch self {
        default: return []
        }
    }
    
    var body: [String : String]? {
        switch self {
        default: return nil
        }
    }
}

