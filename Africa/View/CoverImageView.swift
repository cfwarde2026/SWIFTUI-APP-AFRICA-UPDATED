//
//  CoverImageView.swift
//  Africa
//
//  Created by Cormac Warde on 3/30/26.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: PROPERTIES
    
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    //MARK: BODY
    
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            } //: LOOP
        } //: TAB VIEW
        .tabViewStyle(PageTabViewStyle())
        
    }
            

}


//MARK: PREVIEW

#Preview {
    CoverImageView()
}
