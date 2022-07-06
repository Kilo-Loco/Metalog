//  RootView.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture
import SwiftUI

struct RootView: View {
    let store: RootStore
    
    var body: some View {
        WithViewStore(store.stateless) { _ in
            DashboardScreen(
                store: DashboardStore(
                    initialState: .init(),
                    reducer: dashboardReducerPublisher,
                    environment: .live(environment: .init())
                )
            )
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(
            store: RootStore(
                initialState: .init(),
                reducer: rootReducer,
                environment: .dev(environment: .init())
            )
        )
    }
}
