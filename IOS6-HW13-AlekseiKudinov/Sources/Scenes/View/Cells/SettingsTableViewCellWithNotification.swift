//
//  SettingsTableViewCellWithNotification.swift
//  IOS6-HW13-AlekseiKudinov
//
//  Created by Алексей Кудинов on 05.06.2022.
//

import UIKit

class SettingsTableViewCellWithNotification: UITableViewCell {

    static let identifier = "SettingsTableViewCellWithNotification"

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

    private let notification: UIView = {
        let notification = UIView()
        notification.clipsToBounds = true
        notification.layer.cornerRadius = 15
        notification.layer.masksToBounds = true
        return notification
    }()

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    private let notificationImageView: UIImageView = {
        let notificationImageView = UIImageView()
        notificationImageView.tintColor = .white
        notificationImageView.contentMode = .scaleAspectFit
        return notificationImageView
    }()

// MARK: --Initials--

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(notification)
        notification.addSubview(notificationImageView)
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
        notification.frame = CGRect(x: 350, y: 6, width: size, height: size)

        let imageSize: CGFloat = size/1.5
        iconImageView.frame = CGRect(x: (size - imageSize) / 2, y: (size - imageSize) / 2, width: imageSize, height: imageSize)
        let notificationSize: CGFloat = size/1.2
        notificationImageView.frame = CGRect(x: (size - notificationSize) / 2, y: (size - notificationSize) / 2,
        width: notificationSize, height: notificationSize)
        label.frame = CGRect(
            x: 25 + iconContainer.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - 25 - iconContainer.frame.size.width,
            height: contentView.frame.size.height
        )

    }

// MARK: --Methods--

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        notificationImageView.image = nil
    }

    public func configure(with model: SettingsOptionWithNotification) {
        label.text = model.title
        iconImageView.image = model.icon
        notificationImageView.image = model.notification
        iconContainer.backgroundColor = model.iconBackgroundColor
        notification.backgroundColor = model.notificationBackgroundColor
    }
}
