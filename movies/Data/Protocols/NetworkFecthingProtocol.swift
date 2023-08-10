import Foundation

protocol NetworkFetchingProtocol {
    func data(url: URLRequest) async throws  -> (Data, URLResponse)
    
}
