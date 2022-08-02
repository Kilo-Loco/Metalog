//  EventListView.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture
import SwiftUI

struct EventListView: View {
    let store: Store<EventListState, EventListAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            List {
                ForEach(viewStore.events) { event in
                    NavigationLink {
                        EventDetailsView(
                            store: .init(
                                initialState: .init(event: event),
                                reducer: eventDetailsReducer,
                                environment: .init(eventClient: .live)
                            )
                        )
                    } label: {
                        EventView(
                            store: .init(
                                initialState: event,
                                reducer: eReducer,
                                environment: .init(eventClient: .live))
                        )
                    }
                    .swipeActions(edge: .leading) {
                        Button(
                            action: { viewStore.send(EventListAction.event(id: event.id, action: .addOccurrence)) },
                            label: { Image(systemName: "plus") }
                        )
                    }
                }
            }
            .listStyle(.plain)
            .onAppear {
                viewStore.send(.onAppear)
            }
            
        }
    }
}

struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
//        EventListView(store: .unchecked(initialState: .init(), reducer: .empty, environment: .init()))
    }
}
