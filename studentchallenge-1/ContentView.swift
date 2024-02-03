//
//  ContentView.swift
//  studentchallenge-1
//
//  Created by Marcell JW on 24/01/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: wasteHeightPosition
    // The value -50, is just enough to set the trash out of view as it descends
    @State private var waste1Height:CGFloat = -50
    @State private var waste2Height:CGFloat = -50
    @State private var waste3Height:CGFloat = -50
    @State private var waste4Height:CGFloat = -50
    @State private var waste5Height:CGFloat = -50
    @State private var waste6Height:CGFloat = -50
    @State private var waste7Height:CGFloat = -50
    @State private var waste8Height:CGFloat = -50
    
    // MARK: TitleSize
    @State private var titleScale: CGFloat = 1.0
    
    
    // MARK: Overall Structure
    var body: some View {
        
        NavigationView{
            ZStack{
                
//                fallingTrash
                
                VStack {
                    
                    title
                    
                    playButton
                    
                    NavigationLink(destination:RecyclingLevel().navigationBarBackButtonHidden(true)
                    ) {
                        Text("Recycling Waste")
                    }
                    NavigationLink(destination: FoodnGeneralLevel()){
                        Text("Food and General Waste")
                    }
                }

            }
        }.navigationViewStyle(StackNavigationViewStyle())

    } // End of body variable
    
    var fallingTrash: some View {
        
        let allWaste = (Waste.allClusterWaste + Waste.allSingleWaste)
        let wasteSizeModifier:CGFloat = CGFloat(10.0)
        let allWasteOpacity: Double = 0.5
                
        return GeometryReader { geo in
            let endOfScreenPosition = geo.size.height
            
            
            ZStack {
            
                // MARK: Falling Trash
                /// There's a common structure
                /// random fall-timing -> .delay
                /// speed of falling -> .duration
                
                Image(allWaste.first?.imageName ?? Waste.BananaPeel.imageName)
                    .resizable().scaledToFit()
                    .frame(width: geo.size.width / 5)
                    .opacity(allWasteOpacity)
//                    .position(x: geo.size.width / 10 ,y: -10)
                    .position(x: geo.size.width / 10 ,y: waste1Height)
                    .offset(y: waste1Height)
                    .onAppear {
                        withAnimation(.easeIn(duration:11).repeatForever(autoreverses: false).delay(2)) {
                            waste1Height = endOfScreenPosition
                        }
                    }
                
                Image(allWaste[1].imageName)
                    .resizable().scaledToFit()
                    .frame(width: geo.size.width / 7)
                    .opacity(allWasteOpacity)
                    .position(x: geo.size.width / 4 ,y: waste2Height)
                    .offset(y: waste2Height)
                    .onAppear {
                        withAnimation(.easeIn(duration:8).repeatForever(autoreverses: false).delay(3)) {
                            waste2Height = endOfScreenPosition
                        }
                    }
      
                
                Image(allWaste[2].imageName)
                    .resizable().scaledToFit()
                    .frame(width: geo.size.width / 7)
                    .opacity(allWasteOpacity)
                    .position(x: geo.size.width / 1.2 ,y: waste3Height)
                    .offset(y: waste3Height)
                    .onAppear {
                        withAnimation(.easeIn(duration:9).repeatForever(autoreverses: false)) {
                            waste3Height = endOfScreenPosition
                        }
                    }
   
                
                Image(allWaste[3].imageName)
                    .resizable().scaledToFit()
                    .frame(width: geo.size.width / wasteSizeModifier)
                    .opacity(allWasteOpacity)
                    .position(x: geo.size.width / 0.15 ,y: waste4Height)
                    .offset(y: waste4Height)
                    .onAppear {
                        withAnimation(.easeIn(duration: 15).repeatForever(autoreverses: false)) {
                            waste4Height = endOfScreenPosition
                        }
                    }
                
                Image(allWaste[4].imageName)
                    .resizable().scaledToFit()
                    .frame(width: geo.size.width / wasteSizeModifier)
                    .opacity(allWasteOpacity)
                    .position(x: geo.size.width / 2.5 ,y: waste5Height)
                    .offset(y: waste5Height)
                    .onAppear {
                        withAnimation(.easeIn(duration: 12).repeatForever(autoreverses: false)) {
                            waste5Height = endOfScreenPosition
                        }
                    }
                
                
                Image(allWaste[5].imageName)
                    .resizable().scaledToFit()
                    .frame(width: geo.size.width / wasteSizeModifier)
                    .opacity(allWasteOpacity)
                    .position(x: geo.size.width / 1.05 ,y: waste6Height)
                    .offset(y: waste6Height)
                    .onAppear {
                        withAnimation(.easeIn(duration: 13).repeatForever(autoreverses: false)) {
                            waste6Height = endOfScreenPosition
                        }
                    }
                
                Image(allWaste[6].imageName)
                    .resizable().scaledToFit()
                    .frame(width: geo.size.width / 5)
                    .opacity(allWasteOpacity)
                    .position(x: geo.size.width / 1.4 ,y: waste7Height)
                    .offset(y: waste7Height)
                    .onAppear {
                        withAnimation(.easeIn(duration: 14).repeatForever(autoreverses: false).delay(1)) {
                            waste7Height = endOfScreenPosition
                        }
                    }
                
                Image(allWaste.last?.imageName ?? Waste.SaltedEggShell.imageName)
                    .resizable().scaledToFit()
                    .frame(width: geo.size.width / wasteSizeModifier)
                    .opacity(allWasteOpacity)
                    .position(x: geo.size.width / 1.75 ,y: waste8Height)
                    .offset(y: waste8Height)
                    .onAppear {
                        withAnimation(.easeIn(duration: 10).repeatForever(autoreverses: false)) {
                            waste8Height = endOfScreenPosition
                        }
                    }
                
            }
            
            
        }
        
    }
    
    // MARK: Game Title
    
    var title: some View {
        
        return Image("GameTitle")
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 500)
                .padding(10)
                .shadow(radius: 10)
                .scaleEffect(self.titleScale)
                .onAppear {
                    withAnimation(.easeInOut(duration: 3).repeatForever()){
                        self.titleScale = 1.1
                    }
                    
                }
        
    }
    
    // MARK: PlayButton
    
    var playButton: some View {
        
        // Include a NavigationLink here
        
        Text("PLAY".uppercased())
            .font(.system(size: 40))
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(20)
            .background(
                Color(red: 121/255, green: 96/255, blue: 182/255)
                    .cornerRadius(20)
                    .shadow(radius: 10)
            )
            
    }
    
    
} // End of ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
