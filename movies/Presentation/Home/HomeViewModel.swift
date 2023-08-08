import SwiftUI

final class HomeViewModel : ObservableObject {
    @Published var items : [MovieSerie] = []
    private let searchRepository: SearchRepositoryProtocol

    init(searchRepository: SearchRepositoryProtocol) {
        self.searchRepository = searchRepository
    }

    func searchMmovies(query: String) async {
        do {
            let movies = try await searchRepository.searchMovies(query: query)
            DispatchQueue.main.async {
                self.items = movies
            }
        } catch {
            print(error)
        }
    }

    func searchSeries(query: String) async {
        do {
            let series = try await searchRepository.searchSeries(query: query)
            DispatchQueue.main.async {
                self.items = series
            }
        } catch {
            print(error)
        }
    }
}
