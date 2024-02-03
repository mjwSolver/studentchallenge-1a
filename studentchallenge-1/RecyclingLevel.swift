//
//  RecyclingLevel.swift
//  studentchallenge-1
//
//  Created by Marcell JW on 28/01/24.
//

// MARK: Recycling Waste Level
import SwiftUI

struct RecyclingLevel: View {
    
    var BananaPeel = Waste.BananaPeel
    var EggShell = Waste.BrownEggShell
    var CardboardBox = Waste.CardboardBox
    var PlasticBottle = Waste.CrushedBottleWhite
    var MelonRind = Waste.MelonRind
    var MetalCan = Waste.MetalCan
    
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
    
    
    var body: some View {
        GeometryReader { geo in
            
            ZStack {
                trash
            }
            
        }
        
    }
        
    var trash: some View {
        
        GeometryReader { geo in
            
            let wasteBagPoint = CGPoint(x: geo.size.width / 2, y: geo.size.height / 1.5)
            
            let wasteBagShape = CGSize(width: geo.size.width / 6.5, height: geo.size.height / 8)
            
            let wasteBagRect = CGRect(
                x: wasteBagPoint.x, y: wasteBagPoint.y,
                width: wasteBagShape.width, height: wasteBagShape.height
            )
            
            ZStack{
                
                Image("GeneralWasteBin")
                    .resizable()
                    .scaledToFit()
                    .frame(width:150)
                    .border(.green)
                    .position(wasteBagPoint)
                
                Image(BananaPeel.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .scaleEffect(waste1Scale)
                    .opacity(waste1Opacity)
                    .position(waste1Position)
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
                                    waste1Position = CGPoint(x: geo.size.width / 4, y: geo.size.height / 2)
                                }
                            }
                        }
                    )
                
                Image(EggShell.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .scaleEffect(waste2Scale)
                    .opacity(waste2Opacity)
                    .position(waste2Position)
                    .gesture(DragGesture()
                        .onChanged{ value in
                            waste2Position = value.location
                        }
                        .onEnded{ value in
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
                                    waste2Position = CGPoint(x: geo.size.width / 1.2, y: geo.size.height / 2.4)
                                }
                            }
                            
                        }
                    )
                
                VStack {
                    
                    Text(CardboardBox.nameEN)
                        .font(.system(size: 28, design: .rounded))
                        .fontWeight(.heavy)
                        .opacity(text3Opacity)
                    Text(CardboardBox.nameKR)
                        .font(.system(size: 36))
                        .fontWeight(.semibold)
                        .opacity(text3Opacity)
                        .padding(.bottom, -12)
                    
                    Image(CardboardBox.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 175)
                        .padding(10)
                }
                .scaleEffect(waste3Scale)
                .opacity(waste3Opacity)
                .position(waste3Position)
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
                                waste3Position = CGPoint(x: geo.size.width / 1.4, y: geo.size.height / 2.8)
                            }
                        }
                        
                    }
                )
                
                VStack {
                    
                    Text(PlasticBottle.nameEN)
                        .font(.system(size: 28, design: .rounded))
                        .fontWeight(.heavy)
                        .opacity(text4Opacity)
                    Text(PlasticBottle.nameKR)
                        .font(.system(size: 36))
                        .fontWeight(.semibold)
                        .opacity(text4Opacity)
                        .padding(.bottom, -12)
                    
                    Image(PlasticBottle.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75)
                        .padding(10)
                }
                .scaleEffect(waste4Scale)
                .opacity(waste4Opacity)
                .position(waste4Position)
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
                                waste4Position = CGPoint(x: geo.size.width / 2.8, y: geo.size.height / 2.7)
                                
                                
                            }
                        }
                        
                    }
                )
                
                
                Image(MelonRind.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75)
                    .scaleEffect(waste5Scale)
                    .opacity(waste5Opacity)
                    .position(waste5Position)
                
                Image(MetalCan.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .scaleEffect(waste6Scale)
                    .opacity(waste6Opacity)
                    .position(waste6Position)
                
            }
            .onAppear {
                // Define the Default Position
                waste1Position = CGPoint(x: geo.size.width / 4, y: geo.size.height / 2)
                waste2Position = CGPoint(x: geo.size.width / 1.2, y: geo.size.height / 2.4)
                waste3Position = CGPoint(x: geo.size.width / 1.4, y: geo.size.height / 2.8)
                waste4Position = CGPoint(x: geo.size.width / 2.8, y: geo.size.height / 2.7)
                waste5Position = CGPoint(x: geo.size.width / 7, y: geo.size.height / 3.6)
                waste6Position = CGPoint(x: geo.size.width / 5, y: geo.size.height / 1.5)
            }
            .onChange(of: geo.size) { _ in
                // Return to the Default Position
                waste1Position = CGPoint(x: geo.size.width / 4, y: geo.size.height / 2)
                waste2Position = CGPoint(x: geo.size.width / 1.2, y: geo.size.height / 2.4)
                waste3Position = CGPoint(x: geo.size.width / 1.4, y: geo.size.height / 2.8)
                waste4Position = CGPoint(x: geo.size.width / 2.8, y: geo.size.height / 2.7)
                waste5Position = CGPoint(x: geo.size.width / 7, y: geo.size.height / 3.6)
                waste6Position = CGPoint(x: geo.size.width / 5, y: geo.size.height / 1.5)
                
            }
        }
    }
    

}

struct RecyclingLevel_Previews: PreviewProvider {
    static var previews: some View {
        RecyclingLevel()
    }
}

