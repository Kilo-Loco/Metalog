//  EventDetailsView.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture
import SwiftUI

struct EventDetailsView: View {
    let store: Store<Event, EventAction>
    
    var body: some View {
        WithViewStore(store) { event in
            VStack {
                Text(event.dateString)
                Text("\(event.occurrenceCount)")
            }
            .navigationTitle(event.name)
        }
    }
}

struct EventDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailsView(
            store: .init(
                initialState: Event.dummyEvents.first!,
                reducer: eReducer,
                environment: .init(eventClient: .dev)
            )
        )
    }
}
