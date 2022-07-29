//  EventDetailsView.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture
import SwiftUI

struct EventDetailsView: View {
    let store: Store<EventDetailsState, EventDetailsAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Text(viewStore.event.dateString)
                Text("\(viewStore.event.occurrenceCount)")
                List(viewStore.occurrences) {
                    Text($0.id)
                }
            }
            .navigationTitle(viewStore.event.name)
            .onAppear { viewStore.send(.onAppear) }
        }
    }
}

struct EventDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
//        EventDetailsView(
//            store: .init(
//                initialState: Event.dummyEvents.first!,
//                reducer: eReducer,
//                environment: .init(eventClient: .dev)
//            )
//        )
    }
}
