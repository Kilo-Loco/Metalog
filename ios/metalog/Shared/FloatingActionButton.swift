//  FloatingActionButton.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import SwiftUI

struct FloatingActionButton<Content: View>: View {
    
    let systemImageName: String
    let action: () -> Void
    let content: () -> Content
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            content()
            
            Button(action: action) {
                Image(systemName: systemImageName)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.accentColor)
                    .clipShape(Circle())
                    .shadow(radius: 4)
                    .padding()
            }
        }
    }
}

struct FloatingActionButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingActionButton(
            systemImageName: "plus",
            action: {},
            content: { Color.white}
        )
    }
}
