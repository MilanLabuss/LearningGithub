//
//  ContentView.swift
//  LearningGithub
//
//  Created by Milan Labus on 31/10/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentRating = 0
    
    var body: some View {
        
        RatingsView(maxRating: 5, currentRating: $currentRating)
            .padding()
        
    }
    
}




#Preview {
    ContentView()
}





