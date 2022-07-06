//
//  SettingsItemModel.swift
//  IOS6-HW13-AlekseiKudinov
//
//  Created by Алексей Кудинов on 06.07.2022.
//

import UIKit

class SettingsItemModel {
    var models = [Section]()

    func configure() -> [Section] {
        let firstSection = [Section(options: [
            .switchCell(
                model: SettingsSwitchOption(
                    title: "Авиарежим",
                    icon: UIImage(systemName: "airplane"),
                    iconBackgroundColor: .systemOrange,
                    handler: {
                    },
                    isOn: true)),
            .staticCellWithText(
                model: SettingsOptionWithText(
                    title: "Wi-Fi",
                    detail: "Не подключено",
                    icon: UIImage(systemName: "wifi"),
                    iconBackgroundColor: .systemBlue) {
                        print("Нажата ячейка Wi-Fi")
                    }),
            .staticCellWithText(
                model: SettingsOptionWithText(
                    title: "Bluetooth",
                    detail: "Вкл.",
                    icon: UIImage(named: "bluetooth"),
                    iconBackgroundColor: .link) {
                        print("Нажата ячейка Bluetooth")
                    }),
            .staticCell(
                model: SettingsOption(
                    title: "Сотовая связь",
                    icon: UIImage(systemName: "antenna.radiowaves.left.and.right"),
                    iconBackgroundColor: .systemGreen) {
                        print("Нажата ячейка Сотовая связь")

                    }),
            .staticCell(
                model: SettingsOption(
                    title: "Режим модема",
                    icon: UIImage(systemName: "personalhotspot"),
                    iconBackgroundColor: .systemGreen) {
                        print("Нажата ячейка Режим модема")

                    }),
            .switchCell(
                model: SettingsSwitchOption(
                    title: "VPN",
                    icon: UIImage(named: "vpn"),
                    iconBackgroundColor: .systemBlue,
                    handler: {
                    },
                    isOn: true))
        ])]
            let secondSection = [Section(options: [
            .staticCell(
                model: SettingsOption(
                    title: "Уведомления",
                    icon: UIImage(systemName: "bell.badge.fill"),
                    iconBackgroundColor: .systemRed) {
                        print("Нажата ячейка Уведомления")
                    }),
            .staticCell(
                model: SettingsOption(
                    title: "Звуки, тактильные сигналы",
                    icon: UIImage(systemName: "speaker.wave.3.fill"),
                    iconBackgroundColor: .systemRed) {
                        print("Нажата ячейка Звуки, тактильные сигналы")
                    }),
            .staticCell(
                model: SettingsOption(
                    title: "Не беспокоить",
                    icon: UIImage(systemName: "moon.fill"),
                    iconBackgroundColor: .systemIndigo) {
                        print("Нажата ячейка Не беспокоить")
                    }),
            .staticCell(
                model: SettingsOption(
                    title: "Экранное время",
                    icon: UIImage(systemName: "hourglass"),
                    iconBackgroundColor: .systemIndigo) {
                        print("Нажата ячейка Экранное время")
                    })
        ])]
        let thirdSection = [Section(options: [
            .staticCellWithNotification(
                model: SettingsOptionWithNotification(
                    title: "Основные",
                    icon: UIImage(systemName: "gear"),
                    iconBackgroundColor: .systemGray,
                    notification: UIImage(named: "notification"),
                    notificationBackgroundColor: .clear) {
                    print("Нажата ячейка Основные")
                }),
            .staticCell(
                model: SettingsOption(
                    title: "Пункт управления",
                    icon: UIImage(systemName: "switch.2"),
                    iconBackgroundColor: .systemGray) {
                        print("Нажата ячейка Пункт управления")
                    }),
            .staticCell(
                model: SettingsOption(
                    title: "Экран и яркость",
                    icon: UIImage(systemName: "textformat.size"),
                    iconBackgroundColor: .systemBlue) {
                        print("Нажата ячейка Экран и яркость")
                    }),
            .staticCell(
                model: SettingsOption(
                    title: "Экран «Домой»",
                    icon: UIImage(named: "homescreen"),
                    iconBackgroundColor: .systemBlue) {
                        print("Нажата ячейка Экран «Домой»")
                    }),
            .staticCell(
                model: SettingsOption(
                    title: "Универсальный доступ",
                    icon: UIImage(systemName: "figure.wave.circle"),
                    iconBackgroundColor: .systemBlue) {
                        print("Нажата ячейка Универсальный доступ")
                    })
        ])]
        models.append(contentsOf: firstSection)
        models.append(contentsOf: secondSection)
        models.append(contentsOf: thirdSection)
        return models
    }
}
