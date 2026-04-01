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
                    }
                } else {
                    Text("Grid View")
                }//: LIST
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
                                }) {
                                    Image(systemName: "square.grid.2x2")
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
