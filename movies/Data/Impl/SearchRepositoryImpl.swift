import Foundation

struct SearchRepositoryImpl: SearchRepositoryProtocol {
    private let searchMoviesDataSource: SearchMoviesDataSourceProtocol
    private let searchSeriesDataSource: SearchSeriesDataSourceProtocol
    private let listTopRatedDataSource: ListTopRatedDataSourceProtocol

    init(searchMoviesDataSource: SearchMoviesDataSourceProtocol, searchSeriesDataSource: SearchSeriesDataSourceProtocol, listTopRatedDataSource: ListTopRatedDataSourceProtocol) {
        self.searchMoviesDataSource = searchMoviesDataSource
        self.searchSeriesDataSource = searchSeriesDataSource
        self.listTopRatedDataSource = listTopRatedDataSource
    }

    func searchMovies(query: String) async throws -> [MovieSerie] {
        let movies = try await searchMoviesDataSource.searchMovies(query: query)
        return movies.map { $0.toMovieSerie() }
    }

    func searchSeries(query: String) async throws -> [MovieSerie] {
        let series = try await searchSeriesDataSource.searchSeries(query: query)
        return series.map { $0.toMovieSerie() }
    }
    
    func listTopRated() async throws -> [MovieSerie] {
        let shows = try await listTopRatedDataSource.listTopRated()
        return shows.map { $0.toMovieSerie() }
    }
}
