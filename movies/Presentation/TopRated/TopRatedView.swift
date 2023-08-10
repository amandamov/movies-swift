//import SwiftUI
//
//struct TopRatedView: View {
//    
//    @EnvironmentObject var viewModel: HomeViewModel
//    
//    private let columns = [
//        GridItem(.adaptive(minimum: 130), spacing: 20)
//    ]
//    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                VStack(spacing: 20) {
//                    Text("What 2'Watch")
//                        .foregroundColor(.white)
//                        .fontWeight(.semibold)
//                        .font(.largeTitle)
//                        .font(.system(size: 22))
//                    
//                    ScrollView {
//                        LazyVGrid(columns: columns, spacing: 20) {
//                            ForEach(viewModel.items) { item in
//                                NavigationLink {
//                                    DetailsView(item: item)
//                                } label: {
//                                    PosterView(imageURL: item.posterURL)
//                                }
//                            }
//                        }
//                        .padding()
//                    }
//                }
//            }
//            .toolbar (.hidden, for: .navigationBar)
//            .background {
//                Color("principal")
//                    .edgesIgnoringSafeArea(.all)
//            }
//        }
//        .onAppear {
//            Task {
//                await viewModel.listTopRated()
//            }
//        }
//    }
//}
//
//struct TopRatedView_Previews: PreviewProvider {
//    static var previews: some View {
//        let searcMovieshDataSource = SearchMoviesDataSourceImpl()
//        let searcSerieshDataSource = SearchSeriesDataSourceImpl()
//        let listTopRatedDataSource = ListTopRatedDataSourceImpl()
//        let searchRepository = SearchRepositoryImpl(
//            searchMoviesDataSource: searcMovieshDataSource,
//            searchSeriesDataSource: searcSerieshDataSource,
//            listTopRatedDataSource: listTopRatedDataSource
//        )
//        let viewModel = HomeViewModel(searchRepository: searchRepository)
//        return TopRatedView().environmentObject(viewModel)
//        
//    }
//}



