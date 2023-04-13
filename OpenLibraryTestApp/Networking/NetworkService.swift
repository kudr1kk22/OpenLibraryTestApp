//
//  NetworkService.swift
//  OpenLibraryTestApp
//
//  Created by Eugene Kudritsky on 13.04.23.
//

import Foundation

private enum BaseURLs {
  static let booksListURL = "https://openlibrary.org/api/books?bibkeys=ISBN:0385472579,LCCN:62019420&format=json&jscmd=details"
}

final class NetworkService: NetworkServiceProtocol {

  //MARK: - Get Books List

  func getBooksListData(completion: @escaping (Result<BooksListModel, Error>) -> Void) {
    self.createRequest(with: URL(string: BaseURLs.booksListURL), type: .GET) { request in
      let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else { return }
        do {
          let result = try JSONDecoder().decode(BooksListModel.self, from: data)
//
//                    let result = try JSONSerialization.jsonObject(with: data, options: [])
//                    print(result)
          completion(.success(result))
        }
        catch {
          completion(.failure(error))
        }
      }
      task.resume()
    }
  }
}



//MARK: - Create Request

extension NetworkService {
  private func createRequest(with url: URL?, type: HTTPMethod, completion: @escaping (URLRequest) -> Void) {
    guard let apiURL = url else { return }
    var request = URLRequest(url: apiURL)
    request.httpMethod = type.rawValue
    request.timeoutInterval = 30
    completion(request)
  }
}
