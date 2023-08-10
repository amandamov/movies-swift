import Foundation

enum NetworkError: Error, Equatable {
    case invalidUrl
    case conectionError
    case generalError
}

enum SearchError: Error {
    case ItemNotFound
    case NoList
}
