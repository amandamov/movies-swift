import SwiftUI

@main
struct moviesApp: App {
    var body: some Scene {
        WindowGroup {
            let searchMoviesDataSource = SearchMoviesDataSourceImpl()
            let searchSeriesDataSource = SearchSeriesDataSourceImpl()
            let listTopRatedDataSource = ListTopRatedDataSourceImpl()
            let searchRepository = SearchRepositoryImpl(
                searchMoviesDataSource: searchMoviesDataSource,
                searchSeriesDataSource: searchSeriesDataSource,
                listTopRatedDataSource: listTopRatedDataSource
            )

            let viewModel = HomeViewModel(searchRepository: searchRepository)

            HomeView()
                .environmentObject(viewModel)
        }
    }
}
