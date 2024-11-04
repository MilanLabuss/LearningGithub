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
    let symbol: String?
    let symbolEnum: Symbol?
    
    let color: Color
    
    var symbolString: String    //if symbolEnum isnt nil we will use it otherwise we will use symbol
    
    //two of these parameters are non-optional and the rest are optional
    init(
        maxRating: Int,
        currentRating: Binding<Int>,
        width: Int = 30,
        symbol: String? = "star",   //with this you can actually force unwrap symbol since it was given a default value
        color: Color = .yellow
    ) {
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.width = width
        self.symbol = symbol
        self.symbolEnum = nil
        self.color = color
        
        //you can safetly force unwrap it because you assigned a default value of star in init
        symbolString = if let symbolEnum { symbolEnum.rawValue } else { symbol! }
    }
    
    var body: some View {
        HStack{
            //X out the current Rating Selected
            Image(systemName: "x.circle")
                .resizable()
                .scaledToFit()
                .foregroundStyle(color)
                .symbolVariant(.slash)
                .opacity(currentRating == 0 ? 0 : 1)
                .onTapGesture {
                    withAnimation {
                        currentRating = 0
                    }
                }
            
            ForEach(0..<maxRating, id: \.self) { rating in
                Image(systemName: symbolString)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(color)
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

extension RatingsView {
    
    //two of these parameters are non-optional and the rest are optional
    init(
        maxRating: Int,
        currentRating: Binding<Int>,
        width: Int = 30,
        symbolEnum: Symbol?,   //with this you can actually force unwrap symbol since it was given a default value
        color: Color = .yellow
    ) {
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.width = width
        self.symbol = nil
        self.symbolEnum = symbolEnum
        self.color = color
        
        //you can safetly force unwrap it because you assigned a default value of star in init
        symbolString = if let symbolEnum { symbolEnum.rawValue } else { symbol! }
    }
}

enum Symbol: String {
    
    case bell
    case star
    case bookmark
    case eye
    case flag
    case heart
    case pencil
    case person
    case pin
    case tag
    case thumbsUp = "hand.thumbsup"
    case trash
        
}


#Preview {

    @Previewable @State var maxRating = 5
    @Previewable @State var currentRating = 2
    RatingsView(maxRating: maxRating, currentRating: $currentRating)
        
}
