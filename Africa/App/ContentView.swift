//
//  ContentView.swift
//  Africa
//
//  Created by Cormac Warde on 3/30/26.
//

import SwiftUI

struct ContentView: View {
    //MARK: PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    @State private var isGridViewActive: Bool = false
    let haptics = UIImpactFeedbackGenerator(style:.medium)
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    //MARK: FUNCTIONS
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number: \(gridLayout.count)")
        //TOOLBAR IMAGE
        switch gridColumn{
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
        print("Toolbar Item: \(toolbarIcon)")
        
        
    }
    
    //MARK: BODY
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height:300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)){
                                AnimalListItemView(animal: animal)
                            } //: LINK
                        } //: LOOP
                       
                            CreditsView()
                            .modifier(CenterModifier())
                       
                    } //: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink( destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }//: GRID
                        .padding(10)
                        .animation(.easeIn, value: isGridViewActive)
                    }//:SCROLL
                    
                } //: END OF IF
            } //: GROUP
                    .navigationBarTitle("Africa", displayMode: .large)
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing){
                            HStack(spacing: 16){
                                Button(action: {
                                    print("List View is activated")
                                    isGridViewActive = false
                                    haptics.impactOccurred()
                                    
                                }) {
                                    Image(systemName: "square.fill.text.grid.1x2")
                                        .font(.title2)
                                        .foregroundStyle( isGridViewActive ? Color.primary : Color.accent)
                                    
                                }
                                Button(action: {
                                    print("Grid View is activated")
                                    haptics.impactOccurred()
                                    isGridViewActive = true
                                    haptics.impactOccurred()
                                    gridSwitch()
                                }) {
                                    Image(systemName: toolbarIcon)
                                        .font(.title2)
                                        .foregroundStyle( isGridViewActive ? Color.accent : Color.primary)
                                    
                                }
                            } //: HSTACK
                        }//: BUTTONS
                    
                }
            } //:TOOLBAR
        } //: NAVIGATION
    }


//MARK: PREVIEW
#Preview {
    ContentView()
}
