//
//  BooksListVMProtocol.swift
//  OpenLibraryTestApp
//
//  Created by Eugene Kudritsky on 13.04.23.
//

import Foundation

protocol BooksListVMProtocol {
  var booksListModel: BooksListModel? { get }
  var complitionHandler: (() -> Void)? { get set }
  var ratingModel: RatingModel? { get }
  func loadBookDetails(indexPath: String)
}
