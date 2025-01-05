//
//  FavoritesCell.swift
//  Favorites
//
//  Created by Andres Camilo Lezcano Restrepo on 1/01/25.
//

import UIKit

class FavoritesCell: UITableViewCell {
    private let nameLabel = UILabel()
    private let countryLabel = UILabel()
    private let starImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        nameLabel.textColor = .black

        countryLabel.numberOfLines = 0
        countryLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        countryLabel.textColor = .gray

        starImageView.image = UIImage(systemName: "star.fill")
        starImageView.tintColor = .blue
        starImageView.translatesAutoresizingMaskIntoConstraints = false

        let stackView = UIStackView(arrangedSubviews: [nameLabel, countryLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading

        contentView.addSubview(stackView)
        contentView.addSubview(starImageView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: starImageView.leadingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            starImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            starImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            starImageView.widthAnchor.constraint(equalToConstant: 24),
            starImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    func configure(with city: FavoritesLoad) {
        guard let firstKey = city.favorite.keys.first else { return }
        let components = firstKey.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }

        if components.count == 2 {
            nameLabel.text = components[0]
            countryLabel.text = components[1]
        } else {
            nameLabel.text = firstKey
            countryLabel.text = "País desconocido"
        }
    }
}
