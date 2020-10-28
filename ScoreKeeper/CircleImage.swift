//
//  CircleImage.swift
//  ScoreKeeper
//
//  Created by Kevin McPhee on 2020-10-18.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("fire")
            
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.yellow, lineWidth: 10))
    }
}


struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
