import Foundation

@testable import movies

class NetworkFetchingMock: NetworkFetchingProtocol {
    
    let result: Result<Data, Error>

    init(returning result: Result<Data, Error>) {
        self.result = result
    }
    
    func data(url: URLRequest) async throws -> (Data, URLResponse) {
        // Not needed as it is done with the URLProtocol
        return ("".data(using: .utf8)!,URLResponse()) // Not needed
    }
}
