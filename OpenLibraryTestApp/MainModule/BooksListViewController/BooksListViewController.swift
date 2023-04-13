//
//  BooksListViewController.swift
//  OpenLibraryTestApp
//
//  Created by Eugene Kudritsky on 13.04.23.
//

import UIKit

final class BooksListViewController: UIViewController {

  //MARK: - Properties

  private var tableView: UITableView = UITableView(frame: .zero)
  private var viewModel: BooksListVMProtocol

  //MARK: - Initialization

  init(viewModel: BooksListVMProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    bind()
    setConstraints()
    registerCells()
  }

  //MARK: - Binding

  private func bind() {
    viewModel.complitionHandler = {
      print("Content updated")
      self.fetchData()
    }
  }

  //MARK: - Setup TableView

  private func setupTableView() {
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.showsVerticalScrollIndicator = false
    tableView.rowHeight = 120.0
  }

  private func registerCells() {
    tableView.register(BooksTableViewCell.self, forCellReuseIdentifier: String(describing: BooksTableViewCell.self))
  }

}

//MARK: -  Fetch Data

extension BooksListViewController {
  private func fetchData() {
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
}

//MARK: - UITableViewDataSource

extension BooksListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.booksListModel.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BooksTableViewCell.self), for: indexPath) as? BooksTableViewCell else {
      return UITableViewCell()
    }

    let bookIndex = viewModel.booksListModel.keys.sorted()[indexPath.row]

    if let book = viewModel.booksListModel[bookIndex] {
      cell.configure(from: book)
    }
    return cell
  }
}

//MARK: - UITableViewDelegate

extension BooksListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)

  }
}


//MARK: - Constraints

extension BooksListViewController {
  private func setConstraints() {
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}

