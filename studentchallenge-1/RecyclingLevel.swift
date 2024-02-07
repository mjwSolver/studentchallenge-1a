//
//  RecyclingLevel.swift
//  studentchallenge-1
//
//  Created by Marcell JW on 28/01/24.
//

// MARK: Recycling Waste Level
import SwiftUI

struct RecyclingLevel: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: ALL Waste Data
    
    let BananaPeel: Waste = Waste.BananaPeel
    let EggShell: Waste = Waste.BrownEggShell
    let CardboardBox: Waste = Waste.CardboardBox
    let PlasticBottle: Waste = Waste.CrushedBottleWhite
    let MelonRind: Waste = Waste.MelonRind
    let MetalCan: Waste = Waste.MetalCan
    
    @State var waste1Position = CGPoint.zero
    @State var waste2Position = CGPoint.zero
    @State var waste3Position = CGPoint.zero
    @State var waste4Position = CGPoint.zero
    @State var waste5Position = CGPoint.zero
    @State var waste6Position = CGPoint.zero
    
    @State var waste1Opacity: Double = 1.0
    @State var waste2Opacity: Double = 1.0
    @State var waste3Opacity: Double = 1.0
    @State var waste4Opacity: Double = 1.0
    @State var waste5Opacity: Double = 1.0
    @State var waste6Opacity: Double = 1.0
    
    @State var waste1Scale: CGFloat = 1.0
    @State var waste2Scale: CGFloat = 1.0
    @State var waste3Scale: CGFloat = 1.0
    @State var waste4Scale: CGFloat = 1.0
    @State var waste5Scale: CGFloat = 1.0
    @State var waste6Scale: CGFloat = 1.0
    
    @State var text1Opacity: CGFloat = 0.0
    @State var text2Opacity: CGFloat = 0.0
    @State var text3Opacity: CGFloat = 0.0
    @State var text4Opacity: CGFloat = 0.0
    @State var text5Opacity: CGFloat = 0.0
    @State var text6Opacity: CGFloat = 0.0
    
    // MARK: Structure Overview
    var body: some View {
        GeometryReader { geo in
            
            ZStack {
                wasteComponents
            }
            
        }
        
    }
    
    
    var wasteComponents: some View {
        
        GeometryReader { geo in
            
            // Define the  Initial / Starting CGPoints of each Waste Item
            let waste1Point: CGPoint = CGPoint(x: geo.size.width / 4, y: geo.size.height / 2)
            let waste2Point: CGPoint = CGPoint(x: geo.size.width / 1.2, y: geo.size.height / 2.4)
            let waste3Point: CGPoint = CGPoint(x: geo.size.width / 1.4, y: geo.size.height / 2.8)
            let waste4Point: CGPoint = CGPoint(x: geo.size.width / 2.8, y: geo.size.height / 2.7)
            let waste5Point: CGPoint = CGPoint(x: geo.size.width / 7, y: geo.size.height / 3.6)
            let waste6Point: CGPoint = CGPoint(x: geo.size.width / 2, y: geo.size.height / 3.5)
            
            // Define the CGRect Parameters: CGPoint and CGSize
            let wasteBagPoint = CGPoint(x: geo.size.width / 2, y: geo.size.height / 1.5)
            let wasteBagShape = CGSize(width: geo.size.width / 6.5, height: geo.size.height / 8)
            
            let wasteBagRect = CGRect(
                x: wasteBagPoint.x, y: wasteBagPoint.y,
                width: wasteBagShape.width, height: wasteBagShape.height
            )
            
            let wasteBag: WasteBin = WasteBin.GeneralBin
            
            ZStack{
                
                Image(wasteBag.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width:200)
                    .position(wasteBagPoint)
                
                createWasteContainer(theWaste: BananaPeel, textOpacity: text1Opacity, frameSize: 175, scale: waste1Scale, opacity: waste1Opacity, position: waste1Position)
                    .gesture(DragGesture()
                        .onChanged{ value in
                            waste1Position = value.location
                            text1Opacity = 1.0
                        }
                        .onEnded{ value in
                            
                            text1Opacity = 0.0
                            
                            let wasteRect = CGRect(x: waste1Position.x, y: waste1Position.y, width: 100, height: 100)
                            
                            if wasteRect.intersects(wasteBagRect) {
                                
                                // If the waste meets the area of the waste bag, check if the category matches.
                                
                                
                                // If the category matches, remove the waste from view.
                                withAnimation {
                                    waste1Scale = 0.0
                                    waste1Opacity = 0.1
                                }
                            } else {
                                withAnimation {
                                    waste1Position = waste1Point
                                }
                            }
                        }
                    )
                
                createWasteContainer(
                    theWaste: EggShell,
                    textOpacity: text2Opacity,
                    frameSize: 50,
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
                            
                            if wasteRect.intersects(wasteBagRect) {
                                
                                // If the waste meets the area of the waste bag, check if the category matches.
                                
                                
                                // If the category matches, remove the waste from view.
                                withAnimation {
                                    waste2Scale = 0.0
                                    waste2Opacity = 0.1
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
                    theWaste: CardboardBox,
                    textOpacity: text3Opacity,
                    frameSize: 175,
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
                        
                        if wasteRect.intersects(wasteBagRect) {
                            
                            // If the waste meets the area of the waste bag, check if the category matches.
                            
                            
                            // If the category matches, remove the waste from view.
                            
                            withAnimation {
                                waste3Scale = 0.0
                                waste3Opacity = 0.1
                            }
                            
                        } else {
                            withAnimation {
                                waste3Position = waste3Point
                            }
                        }
                        
                    }
                )
                
                
                createWasteContainer(
                    theWaste: PlasticBottle,
                    textOpacity: text4Opacity,
                    frameSize: 75, scale:
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
                        
                        if wasteRect.intersects(wasteBagRect) {
                            
                            // If the waste meets the area of the waste bag, check if the category matches.
                            
                            
                            // If the category matches, remove the waste from view.
                            
                            withAnimation {
                                waste4Scale = 0.0
                                waste4Opacity = 0.1
                            }
                            
                        } else {
                            withAnimation {
                                waste4Position = waste4Point
                                
                            }
                        }
                        
                    }
                )
                
                // MelonRind
                createWasteContainer(theWaste: MelonRind,
                                     textOpacity: text5Opacity,
                                     frameSize: 75,
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
                        
                        if wasteRect.intersects(wasteBagRect) {
                            
                            // If the waste meets the area of the waste bag, check if the category matches.
                            
                            
                            // If the category matches, remove the waste from view.
                            withAnimation {
                                waste5Scale = 0.0
                                waste5Opacity = 0.1
                            }
                        } else {
                            withAnimation {
                                waste5Position = waste5Point
                            }
                        }
                        
                    }
                )
                
                // MetalCan
                
                createWasteContainer(theWaste: MetalCan,
                                     textOpacity: text6Opacity,
                                     frameSize: 100,
                                     scale: waste6Scale,
                                     opacity: waste6Opacity,
                                     position: waste6Position
                ).gesture(DragGesture()
                    .onChanged{ value in
                        waste6Position = value.location
                        text6Opacity = 1.0
                    }
                    .onEnded{ value in
                        
                        text6Opacity = 0
                        
                        let wasteRect = CGRect(x: waste6Position.x, y: waste6Position.y, width: 100, height: 100)
                        
                        if wasteRect.intersects(wasteBagRect) {
                            
                            // If the waste meets the area of the waste bag, check if the category matches.
                            
                            
                            // If the category matches, remove the waste from view.
                            withAnimation {
                                waste6Scale = 0.0
                                waste6Opacity = 0.1
                            }
                        } else {
                            withAnimation {
                                waste6Position = waste6Point
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
                waste6Position = waste6Point
            }
            .onChange(of: geo.size) { _ in
                // Return to the Default Position
                waste1Position = waste1Point
                waste2Position = waste2Point
                waste3Position = waste3Point
                waste4Position = waste4Point
                waste5Position = waste5Point
                waste6Position = waste6Point
                
            }
        }
    }
    
    func createWasteContainer(
        theWaste: Waste, textOpacity: Double, frameSize: CGFloat,
        scale: CGFloat, opacity: CGFloat, position: CGPoint
    ) -> some View {
        return VStack {
            
            Text(theWaste.nameEN)
                .font(.system(size: 28, design: .rounded))
                .fontWeight(.heavy)
                .opacity(textOpacity)
            
            Text(theWaste.nameKR)
                .font(.system(size: 36))
                .fontWeight(.semibold)
                .opacity(textOpacity)
                .padding(.bottom, -12)
            
            Image(theWaste.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: frameSize)
                .padding(10)
            
        }
        .scaleEffect(scale)
        .opacity(opacity)
        .position(position)
        
    } // End of Function createWasteContainer
    
}

struct RecyclingLevel_Previews: PreviewProvider {
    static var previews: some View {
        RecyclingLevel()
    }
}

