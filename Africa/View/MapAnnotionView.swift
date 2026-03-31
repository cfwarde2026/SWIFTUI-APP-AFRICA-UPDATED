//
//  MapAnnotionView.swift
//  Africa
//
//  Created by Cormac Warde on 3/31/26.
//

import SwiftUI

struct MapAnnotionView: View {
    //MARK: PROPERTIES
    
    var location: NationalParkLocation
    
    @State private var animation: Double = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
                
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                
        } //:ZSTACK
        .onAppear{
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
                
            }
        }
    }
}

#Preview {
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    return MapAnnotionView(location: locations[0])
   
}
