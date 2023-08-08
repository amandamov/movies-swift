//import Foundation
//import SwiftUI
//
//struct MainView: View {
//    private let viewModelMovie : GridViewModel
//    private let viewModelTV : TVListViewModel
//
//    init(viewModelMovie : GridViewModel, viewModelTV : TVListViewModel) {
//        self.viewModelMovie = viewModelMovie
//        self.viewModelTV = viewModelTV
//    }
//
//    var body: some View {
//        HomeView()
//            .environmentObject(viewModelMovie)
//            .tabItem {
//                Label("Movies", systemImage: "popcorn.fill")
//            }
////        TabView {
////            MovieListView()
////                .environmentObject(viewModelMovie)
////                .tabItem {
////                    Label("Movies", systemImage: "popcorn.fill")
////                }
////            TVListView()
////                .environmentObject(viewModelTV)
////                .tabItem {
////                    Label("TV", systemImage: "play.tv.fill")
////                }
////        }
//    }
//}
//
////
////struct MainViewPreview: PreviewProvider {
////    static var previews: some View {
////        MainView()
////    }
////}
