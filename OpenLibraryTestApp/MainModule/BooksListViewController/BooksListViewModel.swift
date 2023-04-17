//
//  BooksListViewModel.swift
//  OpenLibraryTestApp
//
//  Created by Eugene Kudritsky on 13.04.23.
//

import Foundation

final class BooksListViewModel: BooksListVMProtocol {

  //MARK: - Properties

  var booksListModel: BooksListModel?
  var ratingModel: RatingModel?
  private let networkService: NetworkServiceProtocol
  var complitionHandler: (() -> Void)?

  //MARK: - Initialization

  init(networkService: NetworkServiceProtocol) {
    self.networkService = networkService
    loadBooksListData()
  }

  //MARK: - Load books list

  func loadBooksListData() {
    networkService.getBooksListData { result in
      switch result {
      case .success(let model):
        self.booksListModel = model
        self.complitionHandler?()
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }

  //MARK: - Load book details

  func loadBookDetails(indexPath: String) {
    guard let index = booksListModel?[indexPath]?.details.works.first?.key else { return }
    networkService.getRatingData(urlRating: index) { result in
      switch result {
      case .success(let rating):
        self.ratingModel = rating
      case .failure(let error):
        print(error)
      }
    }
  }
}
