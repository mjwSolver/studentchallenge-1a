//
//  FoodnGeneralLevel.swift
//  studentchallenge-1
//
//  Created by Marcell JW on 28/01/24.
//

// MARK: Food and General Waste Level
import SwiftUI

struct FoodnGeneralLevel: View {
    
    // MARK: Game Session Data
    let totalNumberOfWaste = 5
    @State var numberOfCollectedWaste = 0
    @State var currentWasteBin = WasteBin.GeneralBin
    @State var showSuccessOverlay = false
    
    // For returning to the previous view
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: ALL Waste Data
    let Waste1: Waste = Waste.BananaPeels
    let Waste2: Waste = Waste.FishBones
    let Waste3: Waste = Waste.BrownEggShell
    let Waste4: Waste = Waste.MelonRinds
    let Waste5: Waste = Waste.EggShells
    
    // Positions of each waste on screen
    @State var waste1Position = CGPoint.zero
    @State var waste2Position = CGPoint.zero
    @State var waste3Position = CGPoint.zero
    @State var waste4Position = CGPoint.zero
    @State var waste5Position = CGPoint.zero
    
    // Make the waste invisible when "sorted properly"
    @State var waste1Opacity: Double = 1.0
    @State var waste2Opacity: Double = 1.0
    @State var waste3Opacity: Double = 1.0
    @State var waste4Opacity: Double = 1.0
    @State var waste5Opacity: Double = 1.0
    
    // Shrink the waste when "sorted properly"
    @State var waste1Scale: CGFloat = 1.0
    @State var waste2Scale: CGFloat = 1.0
    @State var waste3Scale: CGFloat = 1.0
    @State var waste4Scale: CGFloat = 1.0
    @State var waste5Scale: CGFloat = 1.0
    
    // Annotations on top of each waste
    @State var text1Opacity: CGFloat = 0.0
    @State var text2Opacity: CGFloat = 0.0
    @State var text3Opacity: CGFloat = 0.0
    @State var text4Opacity: CGFloat = 0.0
    @State var text5Opacity: CGFloat = 0.0
    
    // MARK: Structure Overview
    var body: some View {
        GeometryReader { geo in
            
            ZStack {
                Image("ParkBackground")
                    .resizable()
                    .scaledToFill()
                    .blur(radius: 6)
                    .ignoresSafeArea()
                
                if !showSuccessOverlay {
                    
                    wasteComponents
                    
                    VStack{
                        Spacer(minLength: 10)
                        HStack(alignment: .bottom) {
                            backButton
                                .padding(.leading, 20)
                            Spacer(minLength: 10)
                            WasteBinChangeButton
                                .padding(.trailing, 25)
                            
                        }
                        .padding(.bottom, 28)
                        .frame(width: geo.size.width)
                    }
                } else {
                    successOverlay
                        .position(x: geo.size.width / 2, y: geo.size.height / 2)
                        .transition(AnyTransition.scale.animation(.spring()))
                }
            }
        }
        
    }
    
    private var backButton: some View {
        
        // Button to go back a view
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            RoundedRectangle(cornerRadius: 18)
                .fill(Color("WasteGrey"))
                .frame(width: 145, height: 85)
                .overlay(
                    HStack {
                        Image(systemName: "arrow.left")
                            .font(.system(size:42))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Back")
                            .font(.system(size:28))
                            .foregroundColor(.white)
                    }
                    
                )
        }
        
    }
    
    /// Show the successView when all waste are sorted into the proper trash
    private var successOverlay: some View {
        
        let overlayWidth:CGFloat = 950.0
        let overlayHeight:CGFloat = 500.0
    
        return VStack(alignment: .center) {
            
            Text("🎉 CONGRATULATIONS! 🎉")
                .foregroundColor(Color("SeuraegiPurple"))
                .font(.system(size: 48, weight: .heavy, design: .rounded))
            
            Text("You've sorted all the Waste!")
                .font(.system(size: 36, weight: .bold, design: .rounded))
            
            backButton
                .padding(.vertical, 12)
                .padding(.vertical, 15)
            
        }
        .padding(18)
        .frame(width: overlayWidth, height: overlayHeight)
        .background(.white)
        .cornerRadius(36)
        .shadow(radius: 12)
        
    }
    
    private var WasteBinChangeButton: some View {
        
        let buttonTextSize: CGFloat = 24.0
        // All Buttons Needed
        // Paper, Plastic, Glass, Metal
        return VStack(alignment: .trailing, spacing: 32) {
            
            Text("Waste Bins")
                .font(.system(size: buttonTextSize + 2, weight: .heavy, design: .rounded))
                .underline()
                .padding(.bottom, -10)
            
            Button(action: {currentWasteBin = WasteBin.GeneralBin}) {
                HStack(spacing: 16) {
                    Text(WasteBin.GeneralBin.nameEN)
                    Image(systemName: "wineglass")
                }
                .foregroundColor(.blue)
                .font(.system(size: buttonTextSize, weight: .bold, design: .rounded))
                
            }
            
            Button(action: {currentWasteBin = WasteBin.FoodWasteBin}) {
                HStack(spacing: 16) {
                    Text(WasteBin.FoodWasteBin.nameEN)
                    Image(systemName: "fork.knife")
                }
                .font(.system(size: buttonTextSize, weight: .bold, design: .rounded))
            }
            
        }
        .padding(12)
        .padding(.horizontal, 6)
        .background(.white)
        .opacity(0.9)
        .cornerRadius(12)
        
        
    }
    
    // MARK: WasteComponents
    var wasteComponents: some View {
        
        GeometryReader { geo in
            
            // Define the  Initial / Starting CGPoints of each Waste Item
            let waste1Point: CGPoint = CGPoint(x: geo.size.width / 4, y: geo.size.height / 2.3)
            let waste2Point: CGPoint = CGPoint(x: geo.size.width / 1.2, y: geo.size.height / 2.4)
            let waste3Point: CGPoint = CGPoint(x: geo.size.width / 1.4, y: geo.size.height / 8)
            let waste4Point: CGPoint = CGPoint(x: geo.size.width / 2.3, y: geo.size.height / 4.9)
            let waste5Point: CGPoint = CGPoint(x: geo.size.width / 5.8, y: geo.size.height / 1.4)
            
            // Define the CGRect Parameters: CGPoint and CGSize
            let wasteBagPoint = CGPoint(x: geo.size.width / 2, y: geo.size.height / 1.5)
            let wasteBagShape = CGSize(width: geo.size.width / 6, height: geo.size.height / 8)
            
            // CGRect for WasteBag
            let wasteBagRect = CGRect(
                x: wasteBagPoint.x, y: wasteBagPoint.y,
                width: wasteBagShape.width, height: wasteBagShape.height
            )
            
            ZStack{
                
                Image(currentWasteBin.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width:200)
                    .position(wasteBagPoint)
                
                createWasteContainer(theWaste: Waste1, textOpacity: text1Opacity, frameSize: 210, scale: waste1Scale, opacity: waste1Opacity, position: waste1Position)
                    .gesture(DragGesture()
                        .onChanged{ value in
                            waste1Position = value.location
                            text1Opacity = 1.0
                        }
                        .onEnded{ value in
                            
                            text1Opacity = 0.0
                            
                            let wasteRect = CGRect(x: waste1Position.x, y: waste1Position.y, width: 100, height: 100)
                            
                            // If the waste meets the area of the waste bag, check if the category matches.
                            if wasteRect.intersects(wasteBagRect) &&
                                currentWasteBin.wasteCategory == Waste1.category {
                                
                                // Disappearing Animation to remove Waste from View
                                withAnimation {
                                    waste1Scale = 0.0
                                    waste1Opacity = 0.1
                                }
                                
                                // Increase Number CollectedWaete
                                numberOfCollectedWaste += 1
                                if numberOfCollectedWaste == totalNumberOfWaste {
                                    showSuccessOverlay.toggle()
                                }
                                
                            } else {
                                withAnimation {
                                    waste1Position = waste1Point
                                }
                            }
                        }
                    )
                
                createWasteContainer(
                    theWaste: Waste2,
                    textOpacity: text2Opacity,
                    frameSize: 175,
                    scale: waste2Scale,
                    opacity: waste2Opacity,
                    position: waste2Position)
                .gesture(DragGesture()
                    .onChanged{ value in
                        waste2Position = value.location
                        text2Opacity = 1.0
                    }
                    .onEnded{ value in
                        
                        text2Opacity = 0
                        
                        let wasteRect = CGRect(x: waste2Position.x, y: waste2Position.y, width: 100, height: 100)
                        
                        // If the waste meets the area of the waste bag, check if the category matches.
                        if wasteRect.intersects(wasteBagRect) &&
                            currentWasteBin.wasteCategory == Waste2.category {
                            
                            // Disappearing Animation to remove Waste from View
                            withAnimation {
                                waste2Scale = 0.0
                                waste2Opacity = 0.1
                            }
                            
                            // Increase Number CollectedWaete
                            numberOfCollectedWaste += 1
                            if numberOfCollectedWaste == totalNumberOfWaste {
                                showSuccessOverlay.toggle()
                            }
                            
                        } else {
                            withAnimation {
                                waste2Position = waste2Point
                            }
                        }
                        
                    }
                )
                
                
                // Cardboard Box
                createWasteContainer(
                    theWaste: Waste3,
                    textOpacity: text3Opacity,
                    frameSize: 120,
                    scale: waste3Scale,
                    opacity: waste3Opacity,
                    position: waste3Position
                )
                .gesture(DragGesture()
                    .onChanged{ value in
                        waste3Position = value.location
                        text3Opacity = 1.0
                    }
                    .onEnded{ value in
                        
                        text3Opacity = 0.0
                        
                        let wasteRect = CGRect(x: waste3Position.x, y: waste3Position.y, width: 100, height: 100)
                        
                        // If the waste meets the area of the waste bag, check if the category matches.
                        if wasteRect.intersects(wasteBagRect) &&
                            currentWasteBin.wasteCategory == Waste3.category {
                            
                            // Disappearing Animation to remove Waste from View
                            withAnimation {
                                waste3Scale = 0.0
                                waste3Opacity = 0.1
                            }
                            
                            // Increase Number CollectedWaete
                            numberOfCollectedWaste += 1
                            if numberOfCollectedWaste == totalNumberOfWaste {
                                showSuccessOverlay.toggle()
                            }
                            
                        } else {
                            withAnimation {
                                waste3Position = waste3Point
                            }
                        }
                    }
                         
                )
                
                
                createWasteContainer(
                    theWaste: Waste4,
                    textOpacity: text4Opacity,
                    frameSize: 125, scale:
                        waste4Scale,
                    opacity: waste4Opacity,
                    position: waste4Position
                )
                .gesture(DragGesture()
                    .onChanged{ value in
                        waste4Position = value.location
                        text4Opacity = 1.0
                    }
                    .onEnded{ value in
                        
                        text4Opacity = 0.0
                        
                        let wasteRect = CGRect(x: waste4Position.x, y: waste4Position.y, width: 100, height: 100)
                        
                        // If the waste meets the area of the waste bag, check if the category matches.
                        if wasteRect.intersects(wasteBagRect) &&
                            currentWasteBin.wasteCategory == Waste4.category {
                            
                            // Disappearing Animation to remove Waste from View
                            withAnimation {
                                waste4Scale = 0.0
                                waste4Opacity = 0.1
                            }
                            
                            // Increase Number CollectedWaete
                            numberOfCollectedWaste += 1
                            if numberOfCollectedWaste == totalNumberOfWaste {
                                showSuccessOverlay.toggle()
                            }
                            
                        } else {
                            withAnimation {
                                waste4Position = waste4Point
                            }
                        }
                        
                    }
                )
                
                createWasteContainer(theWaste: Waste5,
                                     textOpacity: text5Opacity,
                                     frameSize: 120,
                                     scale: waste5Scale,
                                     opacity: waste5Opacity,
                                     position: waste5Position
                ).gesture(DragGesture()
                    .onChanged{ value in
                        waste5Position = value.location
                        text5Opacity = 1.0
                    }
                    .onEnded{ value in
                        
                        text5Opacity = 0
                        
                        let wasteRect = CGRect(x: waste5Position.x, y: waste5Position.y, width: 100, height: 100)
                        
                        // If the waste meets the area of the waste bag, check if the category matches.
                        if wasteRect.intersects(wasteBagRect) &&
                            currentWasteBin.wasteCategory == Waste5.category {
                            
                            // Disappearing Animation to remove Waste from View
                            withAnimation {
                                waste5Scale = 0.0
                                waste5Opacity = 0.1
                            }
                            
                            // Increase Number CollectedWaete
                            numberOfCollectedWaste += 1
                            if numberOfCollectedWaste == totalNumberOfWaste {
                                showSuccessOverlay.toggle()
                            }
                            
                        } else {
                            withAnimation {
                                waste5Position = waste5Point
                            }
                        }
                    }
                )
                
            }
            .onAppear {
                // Define the Default Position
                waste1Position = waste1Point
                waste2Position = waste2Point
                waste3Position = waste3Point
                waste4Position = waste4Point
                waste5Position = waste5Point
            }
            .onChange(of: geo.size) { _ in
                // Return to the Default Position
                waste1Position = waste1Point
                waste2Position = waste2Point
                waste3Position = waste3Point
                waste4Position = waste4Point
                waste5Position = waste5Point
                
            }
        }
    }
    
    // MARK: Functions
    
    func createWasteContainer(
        theWaste: Waste, textOpacity: Double, frameSize: CGFloat,
        scale: CGFloat, opacity: CGFloat, position: CGPoint
    ) -> some View {
        return VStack {
            
            Text(theWaste.nameEN)
                .font(.system(size: 28,weight: .heavy, design: .rounded))
                .opacity(textOpacity)
            
            Text(theWaste.nameKR)
                .font(.system(size: 36, weight: .semibold))
                .opacity(textOpacity)
                .padding(.bottom, -12)
            
            Image(theWaste.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: frameSize)
                .padding(10)
            
        }
        // Add padding and create a rounded border around the vstack.
        .padding(8)
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color("WasteGrey"), lineWidth: 4)
                .opacity(textOpacity)
        )
        .shadow(color: .white, radius: 12)
        .scaleEffect(scale)
        .opacity(opacity)
        .position(position)
        
    } // End of Function createWasteContainer
    
}

struct FoodnGeneralLevel_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FoodnGeneralLevel()
                .previewInterfaceOrientation(.landscapeLeft)
            
            FoodnGeneralLevel()
                .previewInterfaceOrientation(.portrait)
            
        }
    }
}


