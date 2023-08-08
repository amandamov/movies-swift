//import Foundation
//import SwiftUI
//
//struct MainView: View {
//    private let viewModelMovie : HomeViewModel
//    private let viewModelTV : TVListViewModel
//    private let searchRepository : SearchRepositoryImpl
//
//    init(viewModelMovie : HomeViewModel, viewModelTV : TVListViewModel, searchRepository : SearchRepositoryImpl) {
//        self.viewModelMovie = viewModelMovie
//        self.viewModelTV = viewModelTV
//        self.searchRepository = searchRepository
//    }
//
//    var body: some View {
//        HomeView()
//            .environmentObject(viewModelMovie)
//            .tabItem {
//                Label("Movies", systemImage: "popcorn.fill")
//            }
//        TabView {
//            HomeView()
//                .environmentObject(viewModelMovie)
//                .tabItem {
//                    Label("Movies", systemImage: "popcorn.fill")
//                }
//            TVListView()
//                .environmentObject(viewModelTV)
//                .tabItem {
//                    Label("TV", systemImage: "play.tv.fill")
//                }
//        }
//    }
//}

//
//struct MainViewPreview: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
