//  DashboardScreen.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture
import SwiftUI
import Combine
import Amplify

struct DashboardScreen: View {
    let store: RootStore
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationStack(
                path: viewStore.binding(
                    get: \.navigationState.destinationPaths,
                    send: { .navigationAction(.updateRoutes($0)) }
                )
            ) {
                FloatingActionButton(
                    systemImageName: "square.and.pencil",
                    action: { viewStore.send(.navigationAction(.goTo(.createNewEvent))) }
                ) {
                    EventListView(store: store)
                }
                .navigationTitle("Events")
                .navigationDestination(for: Route.self) { destination in
                    if destination == .createNewEvent {
                        NewEventScreen(store: store)
                    }
                }
            }
        }
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen(store: .dev)
    }
}
