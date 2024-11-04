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
    @State var bookmarkRating = 0
    @State var flagRating = 0
    
    var body: some View {
        
        RatingsView(maxRating: 5, currentRating: $currentRating)
            .padding()
        
        RatingsView(maxRating: 3, currentRating: $heartRating, width: 50, symbolEnum: .heart, color: .green)
            .padding()
        
        RatingsView(maxRating: 5, currentRating: $pinRating, width: 40, symbol: "pin", color: .blue)
            .padding()
        
        
        RatingsView(maxRating: 5, currentRating: $bookmarkRating, symbolEnum: .bookmark, color: .teal)
            .padding()
        
        
        RatingsView(maxRating: 7, currentRating: $flagRating,width: 30, symbolEnum: .flag, color: .green)
            .padding()
        
    }
    
}




#Preview {
    ContentView()
}





