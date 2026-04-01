//
//  CreditsView.swift
//  Africa
//
//  Created by Cormac Warde on 4/1/26.
//

import SwiftUI

struct CreditsView: View {
    //MARK: PROPERTIES
    
    
    //MARK: BODY
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
Copyright © Robert Petras
All rights reserverd
Beter Apps ♡ Less Code
""")
            .font(.footnote)
            .multilineTextAlignment(.center)
        } //: VSTACK
        .padding()
        .opacity(0.4)
        
    }
}

#Preview {
    CreditsView()
}
