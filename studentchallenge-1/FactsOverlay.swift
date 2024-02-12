//
//  FactsOverlay.swift
//  studentchallenge-1
//
//  Created by Marcell JW on 12/02/24.
//

import SwiftUI

struct FactsOverlay: View {
    
    @Binding var showFactsOverlay: Bool
    
    let theFacts = Fact.infoCollection
    
    @State var currentFactIndex = 0
    
    var body: some View {
        
        let currentFact = theFacts[currentFactIndex]
        
        VStack {
            Text(currentFact.statement)
                .font(.system(size: 24))
            
//            let numberOfSources = theFacts[currentFactIndex].supportingFact.count
            
            Text("Sources")
            
            ForEach(0..<currentFact.supportingFact.count, id: \.self) { index in
                Link("\(currentFact.supportingFact[index])",
                     destination: URL(string: currentFact.source[index])!)
            }
            
            HStack {
                
                if currentFactIndex != 0 {
                    Button(action: {decrementFactIndex()}) {
                        Image(systemName: "arrow.left")
                    }
                }

                if currentFactIndex != theFacts.count - 1 {
                    Button(action: {incrementFactIndex()}) {
                        Image(systemName: "arrow.right")
                    }
                }
            }
        }
        .padding(10)
        
        
    }
    
    func incrementFactIndex() {
        
        currentFactIndex += 1
        
        if currentFactIndex == theFacts.count {
                currentFactIndex = 0
        }
        
    }
    
    func decrementFactIndex() {
        
        currentFactIndex -= 1
        
        if currentFactIndex < 0 {
            currentFactIndex = 0
        }
    }
    
}

struct FactsOverlay_Previews: PreviewProvider {
    
    static var previews: some View {
        @State var showFactsOverlay = true
        Group {
            FactsOverlay(showFactsOverlay: $showFactsOverlay)
                .previewInterfaceOrientation(.landscapeLeft)
            
            FactsOverlay(showFactsOverlay: $showFactsOverlay)
                .previewInterfaceOrientation(.portrait)
        }
    }
}
