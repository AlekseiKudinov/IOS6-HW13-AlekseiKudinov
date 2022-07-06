//
//  SettingsView.swift
//  IOS6-HW13-AlekseiKudinov
//
//  Created by Алексей Кудинов on 01.06.2022.
//

import UIKit

class SettingsView: UIView, UITableViewDelegate {

    //MARK: - Configuration
    func configureView(with models: [Section]) {
        self.models = models
    }

    //MARK: - Properties
    private var models = [Section]()

    //MARK: - Views
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.rowHeight = 40

        view.dataSource = self
        view.delegate = self

        view.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        view.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        view.register(SettingsTableViewCellWithText.self, forCellReuseIdentifier: SettingsTableViewCellWithText.identifier)
        view.register(SettingsTableViewCellWithNotification.self, forCellReuseIdentifier: SettingsTableViewCellWithNotification.identifier)

        return view
    }()

    //MARK: - Initial
    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    //MARK: - Settings
    private func setupHierarchy() {
        addSubview(tableView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource
extension SettingsView: UITableViewDataSource {

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



