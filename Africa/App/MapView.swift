//
//  MapView.swift
//  Africa
//
//  Created by Cormac Warde on 3/30/26.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: PROPERTIES
    @State private var position: MapCameraPosition = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return .region(mapRegion)
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    
    
    
    
    //MARK: BODY
    var body: some View {
        //MARK: 1 - BASIC MAP
        //Map(position: $position)
        
        //MARK: 2 - ADVANCED MAP
        Map(position: $position) {
            ForEach(locations) { item in
                //Annotation(item.name, coordinate: item.location) {
                //    Image("logo")
                //        .resizable()
                //        .scaledToFit()
                //        .frame(width: 32, height: 32)
                //        .clipShape(Circle())
                //        .overlay(
                //            Circle()
                //                .stroke(Color.white, lineWidth: 2)
                //        )
                //        .shadow(radius: 3)
                Annotation(item.name, coordinate: item.location) {
                    MapAnnotionView(location: item)
                }
            }
        } //: MAP
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                
            } //
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .opacity(0.6)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                )
                .padding()
            , alignment: .top
        )
        
    }
}

#Preview {
    MapView()
}
