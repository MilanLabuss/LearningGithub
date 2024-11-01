//
//  ContentView.swift
//  LearningGithub
//
//  Created by Milan Labus on 31/10/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentRating = 0
    @State var heartRating = 0
    @State var pinRating = 0
    
    
    var body: some View {
        
        RatingsView(maxRating: 5, currentRating: $currentRating)
            .padding()
        
        RatingsView(maxRating: 3, currentRating: $heartRating, width: 50, symbol: "heart", color: .red)
            .padding()
        
        RatingsView(maxRating: 5, currentRating: $pinRating, width: 40, symbol: "pin", color: .blue)
        
    }
    
}




#Preview {
    ContentView()
}





