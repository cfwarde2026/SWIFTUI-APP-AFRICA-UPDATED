//
//  GalleryView.swift
//  Africa
//
//  Created by Cormac Warde on 3/30/26.
//

import SwiftUI

struct GalleryView: View {
    
    //MARK: PROPERTIES
    
    let animals: [Animal] =  Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var selectedAnimal:String = "lion"
    //SIMPLE GRID DEF
    //let gridLayout: [GridItem] = [
    //    GridItem(.flexible()),
    //    GridItem(.flexible()),
    //    GridItem(.flexible())
    //]
    
    // EFFICIENT GRID DEF
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    //DYNAMIC GRID:
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    
    
    //MARK: BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            //MARK: IMAGE
            
            
            Image(selectedAnimal)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 8))
            
            //MARK: SLIDER
            
            Slider(value: $gridColumn, in: 2...4, step: 1)
                .padding(.horizontal)
                .onChange(of: gridColumn) {
                 gridSwitch()
                }
            
            
            //MARK: GRID
            VStack(alignment:.center, spacing: 40) {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }
                }
                .animation(.easeIn, value: gridLayout)
                .onAppear(perform: {
                    gridSwitch()
                    
                })
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        
            
        }//: SCROLL
        .frame(maxWidth: .infinity, maxHeight:.infinity)
        .background(MotionAnimationView())
    }
}


//MARK: PREVIEW
#Preview {
    GalleryView()
}
