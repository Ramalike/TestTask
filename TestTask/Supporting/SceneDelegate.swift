//
//  SceneDelegate.swift
//  TestTask
//
//  Created by Рамиль Мухаррямов on 02.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let navigationController = UINavigationController(rootViewController: OrderListTableViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

