

import SwiftUI

struct MovieListView: View {
    
    @EnvironmentObject var viewModel : MovieListViewModel
    
    let columns = [
            GridItem(.adaptive(minimum: 130))
        ]
    
    var body: some View {
//        VStack(spacing: 20) {
//            ForEach(viewModel.movies){ movie in
//                MovieCellView(movie: movie)
//            }
//        }.background()
//        .onAppear {
//            Task {
//                await viewModel.fetchMovies()
//            }
//        }
//        .padding()
//
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center, spacing: 50) {
                ForEach(viewModel.movies) { movie in
                    MovieCellView(movie: movie)
                }
            }.onAppear {
                Task {
                    await viewModel.fetchMovies()
                }
            }
        }.padding(.horizontal)
            .background(Color("principal").edgesIgnoringSafeArea(.all))
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        let remoteDataSource = RemoteDataSourceImpl()
        let repository = RepositoryImpl(remoteDataSource: remoteDataSource)
        return MovieListView()
            .environmentObject(MovieListViewModel(repository: repository))
    }
}



