//
//  BooksTableViewCell.swift
//  OpenLibraryTestApp
//
//  Created by Eugene Kudritsky on 13.04.23.
//

import UIKit

final class BooksTableViewCell: UITableViewCell {

  //MARK: - Properties

  private let bookImageView: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()

  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let releaseDate: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  //MARK: - Initialization

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //MARK: - Configure

  func configure(from model: Book) {
    titleLabel.text = model.details.title
    releaseDate.text = "Release date: \(model.details.publishDate)"
  }


}

//MARK: - Constraints

extension BooksTableViewCell {
  private func setupConstraints() {
    contentView.addSubview(bookImageView)
    contentView.addSubview(titleLabel)
    contentView.addSubview(releaseDate)

    NSLayoutConstraint.activate([
      bookImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24.0),
      bookImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
      bookImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24.0),
      bookImageView.widthAnchor.constraint(equalTo: bookImageView.heightAnchor)
    ])

    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32.0),
      titleLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 32.0),
      titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      titleLabel.bottomAnchor.constraint(equalTo: releaseDate.topAnchor),
      titleLabel.heightAnchor.constraint(equalToConstant: 17.0)
    ])

    NSLayoutConstraint.activate([
      releaseDate.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0),
      releaseDate.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
      releaseDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0)
    ])

  }
}
