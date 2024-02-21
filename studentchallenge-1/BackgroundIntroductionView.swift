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
    @State var showFactsOverlay: Bool = false
    
    // MARK: View Outline
    /// Displays several facts from Facts.swift
    /// Review facts with a back and next button
    /// onEnd, will show two level options
    
    var body: some View {
        
        GeometryReader { geo in
            
            NavigationView {
                
                ZStack {
                    
                    Image("Landfill")
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 4)
                        .ignoresSafeArea()
                        
                    
                    // Show the facts
                    if showFactsOverlay {
                        FactsOverlay(showFactsOverlay: $showFactsOverlay)
                    } else {
                        VStack {
                            allLevelButtons
                        }
                    }

                    lowerButtons
                    
                } // End of ZStack
                
            }.navigationViewStyle(StackNavigationViewStyle())
            
        }
        
    }
    

    // MARK: All Buttons
    var allLevelButtons: some View {
        
        VStack(alignment: .center, spacing: 20) {
            
            NavigationLink(destination: RecyclingLevel()
                .navigationBarBackButtonHidden()) {
                    
                    HStack(spacing: 24) {
                        Image(systemName: "arrow.3.trianglepath")
                            .foregroundColor(Color("RecycleGreen"))
                        Text("Recycling Level")
                            .foregroundColor(Color("SeuraegiPurple"))
                    }
                    .font(.system(size:50, weight: .medium, design: .rounded))
                    .padding(24)
                    .background(.white)
                    .cornerRadius(24)
                    
                }
            
            NavigationLink(destination: FoodnGeneralLevel()
                .navigationBarBackButtonHidden()) {
                    
                    HStack(spacing: 24) {
                        Image(systemName: "fork.knife")
                            .foregroundColor(Color("RecycleGreen"))
                        Text("Food and General Waste")
                            .foregroundColor(Color("SeuraegiPurple"))
                    }
                    .font(.system(size:50, weight: .medium, design: .rounded))
                    .padding(24)
                    .background(.white)
                    .cornerRadius(24)

                }
        }
        .shadow(radius: 10)
        
    }
    
    var lowerButtons: some View {
        GeometryReader { geo in
            HStack {
                
                if !showFactsOverlay {
                    infoButton
                        .padding(.trailing, 10)
                    
                }
                
                homeScreenButton
            }
            .padding(.bottom, 100)
            .shadow(radius: 5)
            // Center-aligned
            .position(x: geo.size.width / 2, y:geo.size.height / 1.02)
            // Left-aligned
//            .position(x: 115, y:geo.size.height / 1.02)
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
        
        
    }
    
    // MARK: Previewing
    
    struct BackgroundIntroductionView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                BackgroundIntroductionView()
                    .previewInterfaceOrientation(.landscapeRight)
                
                BackgroundIntroductionView()
                    .previewInterfaceOrientation(.portrait)
            }
        }
    }
}
