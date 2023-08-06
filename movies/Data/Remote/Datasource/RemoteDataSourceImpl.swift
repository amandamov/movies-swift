
import Foundation

enum NetworkError: Error, Equatable {
    case invalidUrl
    case noData
    case tokenFormat
    case other
}

final class RemoteDataSourceImpl: RemoteDataSourceProtocol {
    
    func getMovies() async throws -> [Movie] {
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie") else {
            throw NetworkError.invalidUrl
        }
        
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMTZiYjZjZWQwY2EzZDU5MjdlNTQ3OTFmNzQwZThiNiIsInN1YiI6IjY0YzhmOGZkODlmNzQ5MDEwN2MwZGE3ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TtI_74nh85MGLK3OWqdF5Y81hmbRMcRlmtcrHQnw-tQ"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(MovieResponse.self, from: data)
        let movies = response.results
        movies.forEach { movie in
            print(movie.title)
        }
        return movies
    }
    
}

private struct MovieResponse: Codable {
    let results: [Movie]
}





