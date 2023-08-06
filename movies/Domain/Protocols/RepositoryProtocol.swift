
import Foundation

protocol RepositoryProtocol {
    func getMovies() async throws -> [Movie]
}

