import Foundation

protocol ProductAPI {
    func fetchMenu() async throws -> ProductResponse
}

class ProductAPIImpl: API {
    func fetchMenu() async throws -> ProductResponse {
      return try await request(endpoint: CatalogEndpoint.getMenu, responseModel: ProductResponse.self)
    }
}
