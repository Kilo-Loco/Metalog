//  EventDetailsView.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture
import SwiftUI

struct EventDetailsView: View {
    let store: Store<EventDetailsState, EventDetailsAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            FloatingActionButton(systemImageName: "plus", action: {}) {
                VStack {
                    Text(viewStore.event.dateString)
                    Text("\(viewStore.event.occurrenceCount)")
                    if viewStore.occurrencesWithNotes.isEmpty {
                        Text("No occurrences with notes")
                            .bold()
                        Spacer()
                    } else {
                        List(viewStore.occurrencesWithNotes) { occurrence in
                            if let notes = occurrence.notes {
                                Text(notes)
                            }
                        }
                    }
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
