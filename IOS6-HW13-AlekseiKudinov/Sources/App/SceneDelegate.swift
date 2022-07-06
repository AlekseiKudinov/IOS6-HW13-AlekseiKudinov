
//  SceneDelegate.swift
//  IOS6-HW13-AlekseiKudinov
//
//  Created by Алексей Кудинов on 01.06.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
               window = UIWindow(windowScene: windowScene)

               let viewController = SettingsController()
               let navigationController = UINavigationController(rootViewController: viewController)


               window?.rootViewController = navigationController
               window?.makeKeyAndVisible()
    }
}


