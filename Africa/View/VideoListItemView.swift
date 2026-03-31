//
//  VideoListItem.swift
//  Africa
//
//  Created by Cormac Warde on 3/31/26.
//

import SwiftUI

struct VideoListItemView: View {
    //MARK: PROPERTIES
    
    let video: Video
    
    
    
    
    //MARK: BODY
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 9))
                Image(systemName: "play")
                    .resizable()
                    .scaledToFit()
                    .frame(height:32)
                    .shadow(radius:4)
                
            } //:ZSTACK
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(Color(.accent))
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    
                
                
            }





        } //:HSTACK
    }
}

#Preview {
    let videos: [Video] = Bundle.main.decode("videos.json")
    return VideoListItemView(video: videos[0])
    
}
