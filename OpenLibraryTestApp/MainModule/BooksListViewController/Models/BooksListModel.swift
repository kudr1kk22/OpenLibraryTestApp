//
//  BooksListModel.swift
//  OpenLibraryTestApp
//
//  Created by Eugene Kudritsky on 17.04.23.
//

import Foundation

typealias BooksListModel = [String: Book]

// MARK: - Book

struct Book: Decodable {
    let thumbnailURL: String?
    let details: BookDetails

    enum CodingKeys: String, CodingKey {
        case thumbnailURL = "thumbnail_url"
        case details
    }
}

//MARK: - BookDetails

struct BookDetails: Decodable {
   let title: String
   let publishDate: String
   let works: [KeyRating]
   let subtitle: String

  enum CodingKeys: String, CodingKey {
    case title
    case publishDate = "publish_date"
    case works
    case subtitle
   }
}

//MARK: - KeyRating

struct KeyRating: Decodable {
  let key: String
}





