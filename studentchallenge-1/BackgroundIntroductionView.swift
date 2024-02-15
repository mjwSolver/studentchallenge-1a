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
    @State var showFactsOverlay: Bool = true
    
    // MARK: View Outline
    /// Displays several facts from Facts.swift
    /// Review facts with a back and next button
    /// onEnd, will show two level options
    
    var body: some View {
        
        GeometryReader { geo in
            
            NavigationView {
                
                ZStack {
                    
                    // Buttons are the lowest layer
                    VStack {
                        allLevelButtons
                    }
                    
                    // Show the facts
                    if showFactsOverlay {
                        FactsOverlay(showFactsOverlay: $showFactsOverlay)
                    }


                    lowerButtons
                    
                } // End of ZStack
                
            }.navigationViewStyle(StackNavigationViewStyle())
            
        }
        
    }
    

    // MARK: All Buttons
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
    
    var lowerButtons: some View {
        GeometryReader { geo in
            HStack {
                infoButton
                    .padding(.trailing, 10)
                homeScreenButton
            }
            .padding(.bottom, 50)
            // Center-aligned
//            .position(x: geo.size.width / 2, y:geo.size.height / 1.02)
            // Left-aligned
            .position(x: 115, y:geo.size.height / 1.02)
        }
    }
    
    private var infoButton: some View {
        Button(action: {showFactsOverlay.toggle()}, label: {
            Circle()
                .fill(Color("RecycleGreen"))
                .frame(width: 85, height: 85)
                .shadow(radius: 3)
                .overlay(
                    Image(systemName: "info.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                )
        })
    }
    
    private var homeScreenButton: some View {
//        GeometryReader {geo in
            
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
//            .padding(.bottom, 50)
//            .position(x: geo.size.width / 2, y:geo.size.height / 1.01)
            //        }
//        }
        
        
    }
    
    // MARK: Previewing
    
    struct BackgroundIntroductionView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                BackgroundIntroductionView()
                    .previewInterfaceOrientation(.landscapeLeft)
                
                BackgroundIntroductionView()
                    .previewInterfaceOrientation(.portrait)
            }
        }
    }
}
