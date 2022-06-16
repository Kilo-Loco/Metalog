//  MetalogApp.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import Amplify
import AWSDataStorePlugin
import SwiftUI

@main
struct MetalogApp: App {
    
    init() {
        configureAmplify()
    }
    
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
    
    private func configureAmplify() {
        do {
            try Amplify.configure()
            debugPrint("Amplify configured")
        } catch {
            debugPrint(error)
        }
    }
}
