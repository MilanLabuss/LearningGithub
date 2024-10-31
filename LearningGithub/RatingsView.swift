//
//  RatingsView.swift
//  LearningGithub
//
//  Created by Milan Labus on 31/10/2024.
//

import SwiftUI

struct RatingsView: View {
    
     
    let maxRating: Int
    @Binding var currentRating: Int
    let width: Int
    
    init(maxRating: Int, currentRating: Binding<Int>, width: Int = 30) {
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.width = width
    }
    
    var body: some View {
        HStack{
            Image(systemName: "star")
                .resizable()
                .scaledToFit()
                .foregroundColor(.yellow)
                .symbolVariant(.slash)
                .opacity(currentRating == 0 ? 0 : 1)
                .onTapGesture {
                    withAnimation {
                        currentRating = 0
                    }
                }
            
            ForEach(0..<maxRating, id: \.self) { rating in
                Image(systemName: "star")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.yellow)
                    .symbolVariant(rating < currentRating ? .fill : .none)
                    .onTapGesture {
                        withAnimation {
                            currentRating = rating + 1
                        }
                    }
                    
            }
        }
        .frame(width: CGFloat(maxRating * width))
    }
    
    
}

#Preview {

    @Previewable @State var maxRating = 5
    @Previewable @State var currentRating = 2
    RatingsView(maxRating: maxRating, currentRating: $currentRating)
        
}
