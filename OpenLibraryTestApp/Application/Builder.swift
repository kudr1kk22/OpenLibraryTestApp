//
//  Builder.swift
//  OpenLibraryTestApp
//
//  Created by Eugene Kudritsky on 13.04.23.
//

import UIKit

final class Builder {

  static func createBooksModule() -> UINavigationController {
    let navigationController = UINavigationController()
    let networkService = NetworkService()
    let viewModel = BooksListViewModel(networkService: networkService)
    let view = BooksListViewController(viewModel: viewModel)
    navigationController.viewControllers =
    [view]
    return navigationController
  }
}
