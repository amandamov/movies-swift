import Foundation

final class SearchSeriesDataSourceImpl: SearchSeriesDataSourceProtocol {
    func searchSeries(query: String) async throws -> [Serie] {
        let baseURL = "https://api.themoviedb.org/3/search/tv"
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
        let response = try JSONDecoder().decode(SeriesResponse.self, from: data)
        let series = response.results
        return series
    }
}

private struct SeriesResponse: Codable {
    let results: [Serie]
}
