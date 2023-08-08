import Foundation

struct SearchRepositoryImpl: SearchRepositoryProtocol {
    private let searchMoviesDataSource: SearchMoviesDataSourceProtocol
    private let searchSeriesDataSource: SearchSeriesDataSourceProtocol

    init(searchMoviesDataSource: SearchMoviesDataSourceProtocol, searchSeriesDataSource: SearchSeriesDataSourceProtocol) {
        self.searchMoviesDataSource = searchMoviesDataSource
        self.searchSeriesDataSource = searchSeriesDataSource
    }

    func searchMovies(query: String) async throws -> [MovieSerie] {
        let movies = try await searchMoviesDataSource.searchMovies(query: query)
        return movies.map { $0.toMovieSerie() }
    }

    func searchSeries(query: String) async throws -> [MovieSerie] {
        let series = try await searchSeriesDataSource.searchSeries(query: query)
        return series.map { $0.toMovieSerie() }
    }
}
