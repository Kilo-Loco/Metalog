//  RootView.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture
import SwiftUI

struct RootView: View {
    let store: RootStore
    
    var body: some View {
        WithViewStore(store.stateless) { _ in
            DashboardScreen(store: store)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(store: .dev)
    }
}
