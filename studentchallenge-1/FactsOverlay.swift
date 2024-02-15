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
    
    @State var currentFactIndex = 1
    
    var body: some View {
        
        let currentFact = theFacts[currentFactIndex]
        
        VStack {
            Text(currentFact.statement)
                .font(.system(size: 24))
                .fontWeight(.light)
                .padding(.bottom, 12)
            
//            let numberOfSources = theFacts[currentFactIndex].supportingFact.count
            
            Divider()
            
            Text("Sources")
                .font(.system(size: 20))
                .fontWeight(.semibold)
            
            ForEach(0..<currentFact.supportingFact.count, id: \.self) { index in
                Link("\(currentFact.supportingFact[index])",
                     destination: URL(string: currentFact.source[index])!)
                .padding(.vertical, 3)
                
            }
            
            HStack {
                
                if currentFactIndex != 0 {
                    Button(action: {decrementFactIndex()}) {
                        Image(systemName: "arrow.left")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .padding(8)
                            .background(Color("WasteGrey"))
                            .cornerRadius(12)
                    }
                }

                if currentFactIndex != theFacts.count - 1 {
                    Button(action: {incrementFactIndex()}) {
                        Image(systemName: "arrow.right")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .padding(8)
                            .background(Color("WasteGrey"))
                            .cornerRadius(12)
                            
                    }
                }
            }.padding(.top, 12)
        }
        .padding(28)
        .frame(width: 725, height: 650)
        .background(.white)
        .cornerRadius(36)
        .shadow(radius: 12)
        
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
