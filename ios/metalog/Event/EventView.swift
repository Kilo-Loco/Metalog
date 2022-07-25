//  EventView.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture
import SwiftUI

struct EventView: View {
    let store: Store<Event, EventAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            HStack(alignment: .top) {
                Text(viewStore.name)
                    .font(.headline)
                    .padding(.vertical)
                
                Spacer()
                
                VStack {
                    Text("\(viewStore.updatedAt?.iso8601String ?? "meep")")
                        .font(.footnote)
                    
                    Text("\(viewStore.occurrenceCount)")
                        .font(.title)
                }
            }
            .swipeActions(edge: .leading) {
                Button(action: { viewStore.send(EventAction.addOccurrence) }) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
//        EventView(store: .init(initialState: .init(), reducer: .init(), environment: .live())
    }
}
