//import Foundation
//import SwiftUI
//
//struct MainView: View {
//    private let viewModel : HomeViewModel
//    private let searchRepository : SearchRepositoryImpl
//
//    init(viewModel : HomeViewModel, searchRepository : SearchRepositoryImpl) {
//        self.viewModel = viewModel
//        self.searchRepository = searchRepository
//    }
//
//    var body: some View {
//        HomeView()
//            .environmentObject(viewModel)
//            .tabItem {
//                Label("The Best", systemImage: "popcorn.fill")
//            }
//        TabView {
//            HomeView()
//                .environmentObject(viewModel)
//                .tabItem {
//                    Label("Search", systemImage: "search.fill")
//                }
//            TopRatedView()
//                .environmentObject(viewModel)
//                .tabItem {
//                    Label("TV", systemImage: "play.tv.fill")
//                }
//        }
//    }
//}
//
//
//struct MainViewPreview: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
