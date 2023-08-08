import Foundation

final class SearchMoviesDataSourceImpl: SearchMoviesDataSourceProtocol {
    func searchMovies(query: String) async throws -> [Movie] {
        let baseURL = "https://api.themoviedb.org/3/search/movie"
        guard var urlComponents = URLComponents(string: baseURL) else {
            throw NetworkError.invalidUrl
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "include_adult", value: "false")
        ]

        guard let url = urlComponents.url else {
            throw NetworkError.invalidUrl
        }

        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer \(token)"
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(MoviesResponse.self, from: data)
        let movies = response.results
        return movies
    }
}

private struct MoviesResponse: Codable {
    let results: [Movie]
}
