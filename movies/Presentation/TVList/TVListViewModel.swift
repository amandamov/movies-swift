//import Foundation
//
//final class TVListViewModel : ObservableObject {
//    
//    private let repository: RepositoryTVProtocol
//    @Published var tvs : [TV] = []
//    
//    init(repository: RepositoryTVProtocol) {
//        self.repository = repository
//    }
//    
//    func fetchTVs() async {
//        do {
//            let tvs = try await repository.getTV()
//            DispatchQueue.main.async {
//                self.tvs = tvs
//            }
//        } catch {
//            print(error)
//        }
//    }
//    
//}
