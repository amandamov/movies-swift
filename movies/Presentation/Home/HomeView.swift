import SwiftUI

enum HomeState {
    case movies
    case series
}

struct HomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    
    @State var text: String = ""
    @State var state: HomeState = .movies
    
    private let columns = [
        GridItem(.adaptive(minimum: 130), spacing: 20)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                VStack(spacing: 20) {
                    textfield()
                    list()
                }
                .padding()
                button()
                    .padding([.bottom, .trailing], 20)
            }
            .toolbar(.hidden, for: .navigationBar)
            .background {
                Color("principal")
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

private extension HomeView {
    func search() {
        Task {
            switch state {
            case .movies:
                await viewModel.searchMmovies(query: text)
            case .series:
                await viewModel.searchSeries(query: text)
            }
        }
    }
}

private extension HomeView {
    func textfield() -> some View {
        TextField("Search a movie", text: $text)
            .textFieldStyle(.roundedBorder)
            .submitLabel(.search)
            .onSubmit {
                search()
            }
    }

    func list() -> some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.items) { item in
                    NavigationLink {
                        DetailsView(item: item)
                    } label: {
                        PosterView(imageURL: item.posterURL)
                    }
                }
            }
        }
    }
    
    func button() -> some View {
        ZStack {
            Circle()
                .foregroundColor(.red)
                .frame(width: 50, height: 50)
            Button("button") {
                switch state {
                case .movies:
                    state = .series
                case .series:
                    state = .movies
                }
                search()
            }
            .foregroundColor(.blue)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let searcMovieshDataSource = SearchMoviesDataSourceImpl()
        let searcSerieshDataSource = SearchSeriesDataSourceImpl()
        let searchRepository = SearchRepositoryImpl(
            searchMoviesDataSource: searcMovieshDataSource,
            searchSeriesDataSource: searcSerieshDataSource
        )
        let viewModel = HomeViewModel(searchRepository: searchRepository)
        return HomeView().environmentObject(viewModel)
    }
}
