//  EventListView.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture
import SwiftUI

struct EventListView: View {
    let store: Store<RootState, RootAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            List {
                ForEachStore(
                    store.scope(
                        state: \.eventState.events,
                        action: RootAction.event(id:action:)
                    )
                ) {
                    EventView(store: $0)
                        .swipeActions(edge: .leading) {
                            Button(action: { }) {
                                Image(systemName: "plus")
                            }
                        }
                }
                
            }
            .listStyle(.plain)
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
