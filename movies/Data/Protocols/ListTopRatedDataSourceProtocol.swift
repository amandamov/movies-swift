import Foundation

protocol ListTopRatedDataSourceProtocol {
    func listTopRated() async throws -> [Serie]
}
