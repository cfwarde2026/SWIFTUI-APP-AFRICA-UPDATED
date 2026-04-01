//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Cormac Warde on 4/1/26.
//

import SwiftUI


struct AnimalGridItemView: View {
    //MARK: PROPERTIES
    
    let animal: Animal
    
    //MARK: BODY
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }

}

#Preview {
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    return AnimalGridItemView(animal: animals[0])
}
