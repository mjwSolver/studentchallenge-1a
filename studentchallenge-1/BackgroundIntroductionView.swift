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
            }
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
    
    
}

struct BackgroundIntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundIntroductionView()
    }
}
