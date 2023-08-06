//
//  moviesApp.swift
//  movies
//
//  Created by De Oliveira Vasconcelos Amanda Maria on 1/8/23.
//

import SwiftUI

@main
struct moviesApp: App {
    var body: some Scene {
        WindowGroup {
            
            let remoteDataSource = RemoteDataSourceImpl()
            let repository = RepositoryImpl(remoteDataSource: remoteDataSource)
            let viewModel = MovieListViewModel(repository: repository)
            MovieListView()
                .environmentObject(viewModel)
        }
    }
}
