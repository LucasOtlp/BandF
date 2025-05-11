//
//  AppDelegate.swift
//  BandF
//
//  Created by etudiant on 10/03/2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private static var tailleText : Int = 17
    private static var langue : Int = 0
    private static var mode : Int = 0

    public static func getTailleText() -> Int {
        return tailleText
    }
    
    public static func getLangue() -> Int {
        return langue
    }
    
    public static func getMode() -> Int {
        return mode
    }
    
    public static func setTailleText(_ t : Int) {
        AppDelegate.tailleText = t
    }
    
    public static func setLangue(_ l : Int) {
        AppDelegate.langue = l
    }
    
    public static func setMode(_ m : Int) {
        AppDelegate.mode = m
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

