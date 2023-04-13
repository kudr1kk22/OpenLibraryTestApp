//
//  RatingModel.swift
//  OpenLibraryTestApp
//
//  Created by Eugene Kudritsky on 13.04.23.
//

import Foundation

// MARK: - RatingModel

struct RatingModel: Decodable {
  var summary: SummaryCount?

  enum CodingKeys: String, CodingKey {
    case summary
  }

}

struct SummaryCount: Decodable {
  let average: Double

  enum CodingKeys: String, CodingKey {
    case average
  }
}


