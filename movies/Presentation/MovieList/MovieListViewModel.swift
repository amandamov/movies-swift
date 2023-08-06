
import Foundation

final class MovieListViewModel : ObservableObject {
    
    private let repository: RepositoryProtocol
    @Published var movies : [Movie] = []
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchMovies() async {
        do {
            movies = try await repository.getMovies()
        } catch {
            print(error)
        }
    }
    
}
