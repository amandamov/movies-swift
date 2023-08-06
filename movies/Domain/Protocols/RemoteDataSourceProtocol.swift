
import Foundation
import Combine


protocol RemoteDataSourceProtocol {
    func getMovies() async throws -> [Movie]
}
