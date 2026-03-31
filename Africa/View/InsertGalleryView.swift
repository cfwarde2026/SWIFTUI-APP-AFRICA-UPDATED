//
//  InsertGalleryView.swift
//  Africa
//
//  Created by Cormac Warde on 3/31/26.
//

import SwiftUI

struct InsertGalleryView: View {
    //MARK: PROPERTIES
    
    let animal: Animal
    
    
    
    
    
    //MARK: BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (alignment: .center, spacing: 15){
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }//LOOP
            }
        }//HSTACK
        
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    return InsertGalleryView(animal: animals[0])
    
    
}
