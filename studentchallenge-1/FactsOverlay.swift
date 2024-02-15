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
    let overlayWidth:CGFloat = 950.0
    let overlayHeight:CGFloat = 500.0
    
    @State var currentFactIndex = 0
    
    var body: some View {
        
        let currentFact = theFacts[currentFactIndex]
        
        VStack(alignment: .leading) {
            
            Text(currentFact.title)
                .font(.system(size: 30))
                .fontWeight(.heavy)
                .padding(.top, 16)
                .padding(.leading, 12)
                
            
            HStack(spacing: 16) {
                
                VStack(alignment: .trailing) {
                    Text(currentFact.statement)
                        .font(.system(size: 24))
                        .fontWeight(.light)
                }
                .padding(.horizontal, 5)
                
                Divider()
                    .frame(width: 1.5)
                    .overlay(Color("WasteGrey"))
                    .opacity(0.2)
                
                VStack {
                    Text("Sources")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .padding(.top, 12)
                    
                    ForEach(0..<currentFact.supportingFact.count, id: \.self) { index in
                        Link("\(currentFact.supportingFact[index])",
                             destination: URL(string: currentFact.source[index])!)
                        .padding(.vertical, 3)
                    }
                }
                
            }
            .padding(.horizontal, 12)
            
            HStack {
                
                // The Back Button
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
                
                // The Next Button
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
                
                // The close button
                if currentFactIndex == theFacts.count - 1 {
                    Button(action: {closeOverlay()}) {
                        Text("Close")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 100, height: 50)
                            .padding(8)
                            .background(Color("WasteGrey"))
                            .cornerRadius(12)
                        
                    }
                }
                
            }
            .padding(.top, 12)
            .frame(width: 900)
                
            
        }
        .padding(18)
        .frame(width: overlayWidth, height: overlayHeight)
        .background(.white)
        .cornerRadius(36)
        .shadow(radius: 12)
        
    }
    
    // MARK: Functions
    
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
    
    func closeOverlay() {
        showFactsOverlay.toggle()
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
