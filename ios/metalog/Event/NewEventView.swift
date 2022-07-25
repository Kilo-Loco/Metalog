//  NewEventScreen.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture
import SwiftUI

struct NewEventScreen: View {
    @Environment(\.dismiss) var dismiss
    let store: RootStore
    
    var body: some View {
        WithViewStore(store) { viewStore in
            FloatingActionButton(
                systemImageName: "square.and.arrow.down",
                action: { }
            ) {
                Text("OHAI")
//                ScrollView {
//                    VStack {
//                        FormField(
//                            placeholder: "Event name",
//                            text: viewStore.binding(
//                                get: \.newEvent.name,
//                                send: { updatedName in
//                                    var updatedNewEvent = viewStore.state.newEvent
//                                    updatedNewEvent.name = updatedName
//                                    return NewEventAction.newEventChanged(updatedNewEvent)
//                                }
//                            )
//                        )
//                        DatePicker(
//                            selection: viewStore.binding(
//                                get: \.newEvent.date,
//                                send: { updatedDate in
//                                    var updatedNewEvent = viewStore.state.newEvent
//                                    updatedNewEvent.date = updatedDate
//                                    return NewEventAction.newEventChanged(updatedNewEvent)
//                                }
//                            )
//                        ) {
//                            Text("Date:")
//                        }
//                        .datePickerStyle(.graphical)
//                        .padding()
//
//                        FormField(
//                            placeholder: "Notes",
//                            text: viewStore.binding(
//                                get: \.newEvent.notes,
//                                send: { updatedNotes in
//                                    var updatedNewEvent = viewStore.state.newEvent
//                                    updatedNewEvent.notes = updatedNotes
//                                    return NewEventAction.newEventChanged(updatedNewEvent)
//                                }
//                            )
//                        )
//                    }
//                    .padding(.horizontal)
//                }
            }
            .navigationTitle("New Event")
        }
    }
}

struct NewEventView_Previews: PreviewProvider {
    static var previews: some View {
        NewEventScreen(store: .dev)
    }
}
