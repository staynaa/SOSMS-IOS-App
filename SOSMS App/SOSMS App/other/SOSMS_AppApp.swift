//
//  SOSMS_AppApp.swift
//  SOSMS App
//
//  Created by Stayna Alexandre on 11/16/23.
//
import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct SOSMS_AppApp: App {
//    init(){
//        FirebaseApp.configure()
//    }
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
