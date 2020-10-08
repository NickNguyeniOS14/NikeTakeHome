//
//  SceneDelegate.swift
//  NikeTakeHome
//
//  Created by Nick Nguyen on 10/8/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private let albumTableViewController: UINavigationController = {
        let tableViewController = AlbumTableViewController()
        let navVC = UINavigationController(rootViewController: tableViewController)
        return navVC
    }()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScence = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScence.coordinateSpace.bounds)
        window?.windowScene = windowScence
        window?.rootViewController = albumTableViewController // Your initial view controller.
        window?.makeKeyAndVisible()



    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}

