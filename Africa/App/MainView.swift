//
//  MainView.swift
//  Africa
//
//  Created by Cormac Warde on 3/30/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Browse", systemImage: "square.grid.2x2") {
                ContentView()
            }
            
            Tab("Videos", systemImage: "play.rectangle") {
                VideoListView()
            }
            
            Tab("Locations", systemImage: "map") {
                MapView()
            }
            
            Tab("Gallery", systemImage: "photo") {
                GalleryView()
            }
            
            
            
            
            
            
            
            
            
            
        }//: TabView
    }
}

#Preview {
    MainView()
}
