//
//  SettingsItem.swift
//  IOS6-HW13-AlekseiKudinov
//
//  Created by Алексей Кудинов on 06.07.2022.
//

import UIKit

struct Section {
    let options: [CellType]
}

struct SettingsOptionWithNotification {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let notification: UIImage?
    let notificationBackgroundColor: UIColor
    let handler: (() -> ())
}

struct SettingsOptionWithText {
    let title: String
    let detail: String?
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> ())
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> ())
    var isOn: Bool
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> ())
}

enum CellType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
    case staticCellWithText(model: SettingsOptionWithText)
    case staticCellWithNotification(model: SettingsOptionWithNotification)
}

