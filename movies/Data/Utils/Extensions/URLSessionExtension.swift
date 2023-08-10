import Foundation

extension URLSession: NetworkFetchingProtocol {
    
    func data(url: URLRequest) async throws  -> (Data, URLResponse) {
        return try await data(for: url)
    }
}
