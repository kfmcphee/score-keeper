//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Kevin McPhee on 2020-10-18.
//

import SwiftUI

struct ContentView: View {
    
    let pool = ThePool(startWith: 65)
    
    var body: some View {

            HStack{
                VStack{
                    PlayerScore(isTop: true, pool: pool, playerOne: true)
                    Spacer()
                }
                
                VStack{
                    Pool(pool: pool)

                }
                
                
                VStack{
                    Spacer()
                    PlayerScore(isTop: false, pool: pool, playerOne: false)

                }
                
            }
            .padding()
            .background(
                Image("parchment")
                    .resizable()
                    //.rotationEffect(.degrees(180.0))
                    .ignoresSafeArea())

        
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
