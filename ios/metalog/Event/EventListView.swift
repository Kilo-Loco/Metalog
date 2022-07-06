//  EventListView.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture
import SwiftUI

struct EventListView: View {
    let store: EventStore
    
    var body: some View {
        WithViewStore(store) { viewStore in
            List(viewStore.events) { event in
                EventView(event: event)
                    .swipeActions(edge: .leading) {
                        Button(action: {}) {
                            Image(systemName: "plus")
                        }
                    }
            }
            .listStyle(.plain)
            .onAppear { viewStore.send(.onAppear) }
        }
    }
}

struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView(
            store: Store(
                initialState: EventState(),
                reducer: eventReducer,
                environment: .dev(
                    environment: EventEnvironment(eventClient: .dev)
                )
            )
        )
    }
}
