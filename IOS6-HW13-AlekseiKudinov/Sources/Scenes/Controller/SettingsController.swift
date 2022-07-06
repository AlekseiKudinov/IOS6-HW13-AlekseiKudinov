//
//  SettingsController.swift
//  IOS6-HW13-AlekseiKudinov
//
//  Created by Алексей Кудинов on 06.07.2022.
//

import UIKit

class SettingsController: UIViewController {

    var model: SettingsItemModel?

       private var settingsView: SettingsView? {
           guard isViewLoaded else { return nil }
           return view as? SettingsView
       }

       // MARK: - Lifecycle
       override func viewDidLoad() {
           super.viewDidLoad()

           title = "Настройки"

           view = SettingsView()
           model = SettingsItemModel()
           configureView()
       }
   }

       // MARK: - Configurations
   private extension SettingsController {
       func configureView() {
           guard let models = model?.configure() else { return }
           settingsView?.configureView(with: models)
       }
   }
