//
//  BackgroundIntroductionView.swift
//  studentchallenge-1
//
//  Created by Marcell JW on 07/02/24.
//

import SwiftUI

struct BackgroundIntroductionView: View {
    
    // Allows Users to dismiss the current view
    // and return to the previous view
    @Environment(\.presentationMode) var presentationMode
    
    @State var currentFactIndex = 0
    @State var showFactsOverlay = true
    
    // MARK: View Outline
    /// Displays several facts from Facts.swift
    /// Review facts with a back and next button
    /// onEnd, will show two level options
    
    var body: some View {
        NavigationView {
            
            ZStack {
                VStack {
                    allLevelButtons
                }
                homeScreenButton
            } // End of ZStack
            
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    
    // MARK: All Level Buttons
    var allLevelButtons: some View {

        VStack {
            
            NavigationLink(destination: RecyclingLevel()
                .navigationBarBackButtonHidden()) {
                    Text("Recycling Level")
                }
                .padding(.bottom, 10)
            
            
            NavigationLink(destination: FoodnGeneralLevel()
                .navigationBarBackButtonHidden()) {
                    Text("Food and General Waste")
                }
        }
        
    }
    
    private var homeScreenButton: some View {
        GeometryReader {geo in
            
            // Button to go back a view
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color("WasteGrey"))
                    .frame(width: 85, height: 85)
                    .overlay(
                        Image(systemName: "house.fill")
                            .font(.system(size:45))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    )
            }
            .padding(.bottom, 50)
            .position(x: geo.size.width / 2, y:geo.size.height / 1.01)
        }
    }
    
    
}

struct BackgroundIntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundIntroductionView()
    }
}
