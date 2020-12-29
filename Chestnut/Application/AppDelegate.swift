//
//  AppDelegate.swift
//  Chestnut
//
//  Created by Roman Korostenskyi on 16.09.2020.
//  Copyright © 2020 Roman Korostenskyi. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            return
        }
        
        guard let authentication = user.authentication else {
            print("Auth is nil")
            return
        }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
    }
    
    
    private var applicationCoordinator: ApplicationCoordinator?
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let dependencyContainter = Container()
        let router = Router(navigationController: UINavigationController())
        let appCoordinator = ApplicationCoordinator(with: window, router: router, dependencies: dependencyContainter)
        self.applicationCoordinator = appCoordinator
        self.window = window
        appCoordinator.start()
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
            GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
            GIDSignIn.sharedInstance()?.delegate = self
        }
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance()?.handle(url) ?? false
    }
}

