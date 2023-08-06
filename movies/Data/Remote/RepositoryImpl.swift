
import Foundation

struct RepositoryImpl: RepositoryProtocol {
    
    private let remoteDataSource : RemoteDataSourceProtocol
    
    init(remoteDataSource : RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getMovies() async throws -> [Movie] {
        try await remoteDataSource.getMovies()
    }
}
