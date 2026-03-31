//
//  VideoListView.swift
//  Africa
//
//  Created by Cormac Warde on 3/30/26.
//

import SwiftUI

struct VideoListView: View {
    //MARK: PROPERTIES
    
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    
    
    
    //MARK: BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
                }
            }//:End of List
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        //Shuffle Videos
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }) {
                        Image(systemName: "shuffle")
                    }
                }
            }
        }//: END OF NAV
    }
}


//MARK: PREVIEW
#Preview {
    VideoListView()
}
