//import Foundation
//import SwiftUI
//
//struct TVListView: View {
//    @EnvironmentObject var viewModel : TVListViewModel
//    
//    @State var text: String = ""
//    
//    private let columns = [
//        GridItem(.adaptive(minimum: 130), spacing: 20)
//    ]
//    
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                LazyVGrid(columns: columns, spacing: 20) {
//                    ForEach(viewModel.tvs) { tv in
//                        NavigationLink {
//                            TVDetailsView(tv: tv)
//                        } label: {
//                            PosterView(imageURL: tv.posterURL)
//                        }
//                    }
//                }
//                .padding()
//            }
//            .toolbar {
//                ToolbarItem {
//                    TextField(text: $text, axis: .horizontal) {
//                    }
//                }
//            }
////            .searchable(text: $text)
//            .background {
//                Color("principal")
//                    .edgesIgnoringSafeArea(.all)
//            }
//        }
//        .onAppear {
//            Task {
//                await viewModel.fetchTVs()
//            }
//        }
//    }
//}
//
//struct TVListView_Previews: PreviewProvider {
//    static var previews: some View {
//        let remoteDataSource = RemoteDataSourceTVImpl()
//        let repository = RepositoryTVImpl(remoteDataSourceTV: remoteDataSource)
//        return TVListView()
//            .environmentObject(TVListViewModel(repository: repository))
//    }
//}
