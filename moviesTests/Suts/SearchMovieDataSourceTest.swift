import XCTest

@testable import movies

final class SearchMovieDataSourceTest: XCTestCase {
    
    var sut: SearchMoviesDataSourceProtocol?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SearchMoviesDataSourceImpl()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testSearchMovieDataSource_whenSearchMoviesURLSessionMock_expectMovies() async throws {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolMock.self]
        
        let mockURLSession = URLSession.init(configuration: configuration)
        sut = SearchMoviesDataSourceImpl(session: mockURLSession)
        
        URLProtocolMock.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields:  nil)!
            let movies = MoviesResponse(results: [.init(id: 1, title: "title1", poster_path: nil, overview: "overview1", vote_average: 1.0)])
            let data = try JSONEncoder().encode(movies)
            return (response, data)
        }
        
        guard let movies = try await sut?.searchMovies(query: "") else {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(movies.first)
        XCTAssertEqual(movies.first?.title, "title1")
        
        
        
    }
    
}
