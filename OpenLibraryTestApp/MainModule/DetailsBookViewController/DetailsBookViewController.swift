//
//  DetailsBookViewController.swift
//  OpenLibraryTestApp
//
//  Created by Eugene Kudritsky on 13.04.23.
//

import UIKit

final class DetailsBookViewController: UIViewController {
  
  //MARK: - Properties

  private var bookImage: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()

  private var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private var descriptionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private var averangeRating: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private var releaseLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private var viewModel: DetailsBookViewModelProtocol

  //MARK: - Initialization

  init(viewModel: DetailsBookViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupConstraints()
  }

  func configure(model: Book) {
    guard let image = model.thumbnailURL else { return }
    if let imageURL = URL(string: image) {
      bookImage.sd_setImage(with: imageURL)
    }
    titleLabel.text = model.details.title
    releaseLabel.text = model.details.publishDate
    averangeRating.text = "Rating: \(viewModel.ratingModel?.summary?.average ?? 0)"
    descriptionLabel.text = model.details.subtitle
  }
}

extension DetailsBookViewController {
  private func setupConstraints() {
    view.addSubview(bookImage)
    view.addSubview(titleLabel)
    view.addSubview(descriptionLabel)
    view.addSubview(averangeRating)
    view.addSubview(releaseLabel)

    NSLayoutConstraint.activate([
      bookImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 24.0),
      bookImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      bookImage.widthAnchor.constraint(equalTo: view.widthAnchor),
      bookImage.heightAnchor.constraint(equalTo: bookImage.widthAnchor)
    ])
    

    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 16.0),
      titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0),
      titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])

    NSLayoutConstraint.activate([
      releaseLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0),
      releaseLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
      releaseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0)
    ])

    NSLayoutConstraint.activate([
      averangeRating.topAnchor.constraint(equalTo: releaseLabel.bottomAnchor, constant: 8.0),
      averangeRating.leadingAnchor.constraint(equalTo: releaseLabel.leadingAnchor),
      averangeRating.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0)
    ])

    NSLayoutConstraint.activate([
      descriptionLabel.topAnchor.constraint(equalTo: averangeRating.bottomAnchor, constant: 8.0),
      descriptionLabel.leadingAnchor.constraint(equalTo: averangeRating.leadingAnchor),
      descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0)
    ])
  }
}
