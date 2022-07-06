//  DashboardScreen.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture
import SwiftUI
import Combine
import Amplify
struct DashboardScreen: View {
    let store: DashboardStore
    func dothething() {
        let models = [Model]()
    }
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationStack(
                path: viewStore.binding(
                    get: \.destinationPaths,
                    send: { DashboardAction.destinationPathsDidChange($0) }
                )
            ) {
                FloatingActionButton(
                    systemImageName: "square.and.pencil",
                    action: {
                        viewStore.send(.destinationPathsDidChange([.createNewEvent]))
                    }
                ) {
                    EventListView(
                        store: store.scope(
                            state: \.eventState,
                            action: DashboardAction.eventAction
                        )
                    )
                }
                .navigationTitle("Events")
                .navigationDestination(for: DashboardDestination.self) { destination in
                    switch destination {
                    case .createNewEvent:
                        NewEventScreen(
                            store: NewEventStore(
                                initialState: viewStore.newEventState,
                                reducer: newEventReducer,
                                environment: .live(
                                    environment: .init(eventClient: .live)
                                )
                            )
                        )
                    }
                }
            }
        }
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen(
            store: DashboardStore(
                initialState: .init(),
                reducer: dashboardReducer,
                environment: .dev(environment: .init())
            )
        )
    }
}
