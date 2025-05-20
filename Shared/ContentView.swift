//
//  ContentView.swift
//  WatchConnectivityPrototype
//
//  Created by Chris Gaafary on 4/14/21.
//

import SwiftUI
import WatchConnectivity

struct ContentView: View {
    @StateObject var plantaview = Counter()
    
    var labelStyle: some LabelStyle {
        #if os(watchOS)
        return IconOnlyLabelStyle()
        #else
        return DefaultLabelStyle()
        #endif
    }
    
    var body: some View {
        VStack {
            Text("\(plantaview.plant)")
                .font(.largeTitle)
            
            HStack {
                Button(action: plantaview.decrement) {
                    Label("Decrement", systemImage: "minus.circle")
                }
                .padding()
                
                Button(action: plantaview.increment) {
                    Label("Increment", systemImage: "plus.circle.fill")
                }
                .padding()
            }
            .font(.headline)
            .labelStyle(labelStyle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
