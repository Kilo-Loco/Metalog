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
                ForEachStore(
                    store.scope(
                        state: \.events,
                        action: EventListAction.event(id:action:)
                    )
                ) { eventStore in
                    EventView(store: eventStore)
                }
            }
            .listStyle(.plain)
            .onAppear {
                viewStore.send(.onAppear)
            }
            
        }
    }
}

extension EventListView {
    enum UIAction {
        case leadingSwipeAction
        case onAppear
    }
}

struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
//        EventListView(store: .unchecked(initialState: .init(), reducer: .empty, environment: .init()))
    }
}
