import XCTest
@testable import movies

final class HomeViewModelTests: XCTestCase {
    
    
    var sut: HomeViewModel?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HomeViewModel(searchRepository: SearchRepositoryMock())
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testViewModel_whenSearchMovies_expectMovies() async throws {
        //GIVEN
        
        let expectation = XCTestExpectation(description: "Error")
        sut?.searchMovies(query: "") {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
        
        XCTAssertNotNil(sut?.items.first)
        XCTAssertEqual(sut?.items.first?.title, "title1")
        
        
        
    }
    
    func testViewModel_whenSearchSeries_expectSeries() async throws {
        //GIVEN
        
        let expectation = XCTestExpectation(description: "Error")
        sut?.searchSeries (query: "") {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
        
        XCTAssertNotNil(sut?.items.first)
        XCTAssertEqual(sut?.items.first?.title, "title2")
        
        
        
    }
}
