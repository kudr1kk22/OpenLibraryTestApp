//
//  BooksListViewModel.swift
//  OpenLibraryTestApp
//
//  Created by Eugene Kudritsky on 13.04.23.
//

import Foundation

final class BooksListViewModel: BooksListVMProtocol {

  //MARK: - Properties

  var booksListModel = BooksListModel()
  private let networkService: NetworkServiceProtocol
  var complitionHandler: (() -> Void)?

  //MARK: - Initialization

  init(networkService: NetworkServiceProtocol) {
    self.networkService = networkService
    loadBooksListData()
  }


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



}