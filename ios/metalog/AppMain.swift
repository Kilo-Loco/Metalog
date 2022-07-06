//  AppMain.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import Amplify
import AWSDataStorePlugin
import SwiftUI

@main
struct AppMain: App {
    
    init() {
        configureAmplify()
    }
    
    var body: some Scene {
        WindowGroup {
//            FirstView(store: .init(initialState: NavState(), reducer: navReducer, environment: .init()))
            RootView(
                store: RootStore(
                    initialState: RootState(),
                    reducer: rootReducer,
                    environment: .live(environment: RootEnvironment())
                )
            )
        }
    }
    
    private func configureAmplify() {
        do {
            let models = AmplifyModels()
            try Amplify.add(plugin: AWSDataStorePlugin(modelRegistration: models))
            try Amplify.configure()
            debugPrint("Amplify configured")
        } catch {
            debugPrint(error)
        }
    }
}
