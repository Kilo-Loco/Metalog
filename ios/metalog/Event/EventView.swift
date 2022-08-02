//  EventView.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture
import SwiftUI

struct EventView: View {
    let store: Store<Event, EventAction>
    
    var body: some View {
        WithViewStore(store) { event in
            HStack(alignment: .top) {
                Text(event.name)
                    .font(.headline)
                    .padding(.vertical)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("\(event.dateString)")
                        .font(.footnote)
                    
                    Text("\(event.occurrenceCount)")
                        .font(.title)
                }
            }
//            .swipeActions(edge: .leading) {
//                Button(action: { event.send(EventAction.addOccurrence) }) {
//                    Image(systemName: "plus")
//                }
//            }
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
//        EventView(store: .init(initialState: .init(), reducer: .init(), environment: .live())
    }
}
