//
//  SettingsTableViewCellWithText.swift
//  IOS6-HW13-AlekseiKudinov
//
//  Created by Алексей Кудинов on 05.06.2022.
//

import UIKit

class SettingsTableViewCellWithText: UITableViewCell {

    static let identifier = "SettingsTableViewCellWithText"

    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()

    private let detail: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .systemGray
        return label
    }()

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

// MARK: --Initials--

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(detail)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

// MARK: --Layout--

    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)

        let imageSize: CGFloat = size/1.5
        iconImageView.frame = CGRect(x: (size - imageSize) / 2, y: (size - imageSize) / 2, width: imageSize, height: imageSize)
        label.frame = CGRect(
            x: 25 + iconContainer.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - 25 - iconContainer.frame.size.width,
            height: contentView.frame.size.height
        )

        detail.translatesAutoresizingMaskIntoConstraints = false
        detail.rightAnchor.constraint(
            equalTo: contentView.rightAnchor,
            constant: -8
        ).isActive = true
        detail.centerYAnchor.constraint(
            equalTo: contentView.centerYAnchor
        ).isActive = true
    }

// MARK: --Methods--

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        detail.text = nil
    }

    public func configure(with model: SettingsOptionWithText) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        detail.text = model.detail
    }
}
