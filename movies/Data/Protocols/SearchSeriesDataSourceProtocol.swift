import Foundation

protocol SearchSeriesDataSourceProtocol {
    func searchSeries(query: String) async throws -> [Serie]
}
