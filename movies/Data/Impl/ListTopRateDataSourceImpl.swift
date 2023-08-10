import Foundation

final class ListTopRatedDataSourceImpl: ListTopRatedDataSourceProtocol {
    
    
    func listTopRated() async throws -> [Serie] {
        //Fix URL
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

        guard shows.count > 0 else {throw SearchError.NoList}

        return shows
    }
}

private struct SeriesResponse: Codable {
    let results: [Serie]
}

extension URLResponse {

    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}
