//
//  InsertFactView.swift
//  Africa
//
//  Created by Cormac Warde on 3/31/26.
//

import SwiftUI

struct InsertFactView: View {
    //MARK: PROPERTIES
    
    let animal: Animal
    
    
    
    
    //MARK: BODY
    var body: some View {
        GroupBox {
            TabView{
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }

            }//:Tab
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
            
                    }
    }
}
//MARK: PREVIEW
#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    return InsertFactView(animal: animals[0])
}
