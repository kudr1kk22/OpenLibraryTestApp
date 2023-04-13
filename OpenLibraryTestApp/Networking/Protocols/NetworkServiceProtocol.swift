//
//  NetworkServiceProtocol.swift
//  OpenLibraryTestApp
//
//  Created by Eugene Kudritsky on 13.04.23.
//

import Foundation

protocol NetworkServiceProtocol {
  func getBooksListData(completion: @escaping (Result<BooksListModel, Error>) -> Void)
  func getRatingData(urlRating: String, completion: @escaping (Result<RatingModel, Error>) -> Void)
}
