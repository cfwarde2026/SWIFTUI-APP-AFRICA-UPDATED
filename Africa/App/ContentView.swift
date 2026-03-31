//
//  ContentView.swift
//  Africa
//
//  Created by Cormac Warde on 3/30/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //MARK: PROPERTIES
        
        let animals: [Animal] = Bundle.main.decode("animals.json")
        
        
        //MARK: BODY
        NavigationView {
            List{
                CoverImageView()
                    .frame(height:300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                ForEach(animals) { animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)){
                        AnimalListItemView(animal: animal)
                    }
                }
            }//: LIST
            .navigationBarTitle("Africa", displayMode: .large)
        }
    }
}

#Preview {
    ContentView()
}
