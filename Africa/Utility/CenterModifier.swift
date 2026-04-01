//
//  CenterModifier.swift
//  Africa
//
//  Created by Cormac Warde on 4/1/26.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
