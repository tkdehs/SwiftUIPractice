//
//  SequenceGesture.swift
//  SwiftUIPractice
//
//  Created by PNX on 2023/07/24.
//

import SwiftUI

struct SequenceGesture_Tutorials: View {
    @ObservedObject var longPress = LongPress()
    
    @ObservedObject var drag = Drag()
    
    var sequence: some Gesture {
        SequenceGesture(longPress.gesture, drag.gesture)
            .onEnded({ _ in
                longPress.activated = false
            })
        
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 50) {
                Label("LongPress", systemImage: "circle.fill")
                    .foregroundColor(longPress.activated ? .green : .gray)
                
                Label("Drag", systemImage: "circle.fill")
                    .foregroundColor(drag.activated ? .green : .gray)
            }
            .padding()
            
            VStack {
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: 100, height: 100)
                    .offset(drag.currentTranslation)
                    .offset(drag.totalTranslation)
                    .gesture(sequence)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct SequenceGesture_Previews: PreviewProvider {
    static var previews: some View {
        SequenceGesture_Tutorials()
    }
}
