import SwiftUI

final class HomeViewModel : ObservableObject {
    @Published var items : [MovieSerie] = []
    private let searchRepository: SearchRepositoryProtocol

    init(searchRepository: SearchRepositoryProtocol) {
        self.searchRepository = searchRepository
    }

    func searchMovies(query: String, completion: @escaping () -> () = {}) {
        DispatchQueue.main.async {
            Task {
                do {
                    let movies = try await self.searchRepository.searchMovies(query: query)
                        self.items = movies
                        completion()
                } catch {
                    print(error)
                }
            }
        }
    }

    func searchSeries(query: String, completion: @escaping () -> () = {}) {
        DispatchQueue.main.async {
            Task {
                do {
                    let series = try await self.searchRepository.searchSeries(query: query)
                        self.items = series
                    completion()
                } catch  {
                    print(error)
                }
            }
        }
    }
    
    //TODO: create new viewModel - listTopRatedViewModel
    func listTopRated() async {
        do {
            let shows = try await searchRepository.listTopRated()
            DispatchQueue.main.async {
                self.items = shows
            }
        } catch {
            print(error)
        }
    }
}
