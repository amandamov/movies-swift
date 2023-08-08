import Foundation

final class ListTopRatedDataSourceImpl: ListTopRatedDataSourceProtocol {
    func listTopRated() async throws -> [Serie] {
//        let baseURL = "https://api.themoviedb.org/3/tv/top_rated?language=en-US&page=1"
//        guard var urlComponents = URLComponents(string: baseURL) else {
//            throw NetworkError.invalidUrl
//        }
//        urlComponents.queryItems = [
//            URLQueryItem(name: "query", value: query),
//        ]

//        guard let url = urlComponents.url else {
//            throw NetworkError.invalidUrl
//        }
        
        guard let url = URL(string: "https://api.themoviedb.org/3/tv/top_rated?language=en-US&page=1") else {
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
        let shows = response.results
        return shows
    }
}

private struct SeriesResponse: Codable {
    let results: [Serie]
}
