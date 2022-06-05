//
//  ViewController.swift
//  IOS6-HW13-AlekseiKudinov
//
//  Created by Алексей Кудинов on 01.06.2022.
//

import UIKit

// MARK: --Structs--

struct Section {
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
    case staticCellWithText(model: SettingsOptionWithText)
    case staticCellWithNotification(model: SettingsOptionWithNotification)
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

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingsTableViewCell.self,
                       forCellReuseIdentifier: SettingsTableViewCell.identifier)
        table.register(SwitchTableViewCell.self,
                       forCellReuseIdentifier: SwitchTableViewCell.identifier)
        table.register(SettingsTableViewCellWithText.self,
                       forCellReuseIdentifier: SettingsTableViewCellWithText.identifier)
        table.register(SettingsTableViewCellWithNotification.self,
                       forCellReuseIdentifier: SettingsTableViewCellWithNotification.identifier)
        return table
    }()


    var models = [Section]()

// MARK: --LifeCycle--

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Настройки"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds

    }

// MARK: --Config--

    func configure() {
        models.append(Section(options: [
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
        ]))

        models.append(Section(options: [
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
        ]))

        models.append(Section(options: [
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
        ]))

    }

// MARK: --TableView--

    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]

        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingsTableViewCell.identifier,
                for: indexPath
            ) as? SettingsTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath
            ) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .staticCellWithText(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingsTableViewCellWithText.identifier,
                for: indexPath
            ) as? SettingsTableViewCellWithText else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .staticCellWithNotification(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingsTableViewCellWithNotification.identifier,
                for: indexPath
            ) as? SettingsTableViewCellWithNotification else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell

        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        case .staticCellWithText(let model):
            model.handler()
        case .staticCellWithNotification(let model):
            model.handler()
        }
    }
}

