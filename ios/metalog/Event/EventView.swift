//  EventView.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import SwiftUI

struct EventView: View {
    let event: Event
    
    var body: some View {
        HStack(alignment: .top) {
            Text(event.name)
                .font(.headline)
                .padding(.vertical)
            
            Spacer()
            
            VStack {
                Text("\(event.updatedAt?.iso8601String ?? "meep")")
                    .font(.footnote)
                
                Text("\(event.occurrenceCount)")
                    .font(.title)
            }
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(event: Event.dummyEvents.first!)
    }
}
