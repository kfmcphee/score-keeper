//
//  ModelView.swift
//  ScoreKeeper
//
//  Created by Kevin McPhee on 2020-10-19.
//

import SwiftUI
import AVFoundation




struct Pool : View {
    @ObservedObject var pool: ThePool
    
    var body: some View {
        ZStack{
                
            Image("center")
                .opacity(0.6)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.gray, lineWidth: 30)
                        .opacity(0.3)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        //.blendMode(.softLight)
                        )
                
                .rotationEffect(.degrees(180.0))
            VStack{
                Button(action: {
                    if (pool.decreasePlayerOne()){
                        pool.increasePool()
                    }
                    
                }, label: {
                    Text("\(pool.availablePoints)")
                        .font(.system(size: 80))
                        .fontWeight(.heavy)
                        .rotationEffect(.degrees(180))
                        .shadow(color: .white, radius: 10, x: 5, y: 5)
                        .shadow(color: .white, radius: 10, x: -5, y: -5)
                        .shadow(color: .red, radius: 20, x: -5, y: -5)
                        .blur(radius: 0.5)
                })
                .buttonStyle(PlainButtonStyle())
                
                
                Button(action: {
                    if (pool.decreasePlayerTwo()){
                        pool.increasePool()
                    }
                    
                }, label: {
                    Text("\(pool.availablePoints)")
                        .font(.system(size: 80))
                        .foregroundColor(Color.black)
                        .fontWeight(.heavy)
                        .shadow(color: .white, radius: 10, x: 5, y: 5)
                        .shadow(color: .white, radius: 10, x: -5, y: -5)
                        .shadow(color: .blue, radius: 20, x: 5, y: 5)
                        .blur(radius: 0.5)
                })
                .buttonStyle(PlainButtonStyle())
                
                    
            }
        }
    }
    
    init(pool: ThePool){
        self.pool = pool
    }
}

struct PlayerScore : View {
    
    private let isPlayerOne: Bool
    private var top: Bool
    @ObservedObject var pool: ThePool
    //@State private var points: Int = 0
    
    @State var audioPlayer:AVAudioPlayer?
    @State var isPlaying : Bool = false
    
    @State private var isRotated = false
        
        var animation: Animation {
            Animation.linear(duration: 100)
            .repeatForever(autoreverses: false)
        }
    
    var body: some View {
   
        
        Button(action: {
            pool.decreasePool()
            isPlayerOne ? pool.increasePlayerOne() : pool.increasePlayerTwo()

            /*
             "Bell, Counter, A.wav" by InspectorJ (www.jshaw.co.uk) of Freesound.org
             */
            
            if let path = Bundle.main.path(forResource: "trimmed_ting", ofType: ".wav") {

                self.audioPlayer = AVAudioPlayer()
                self.isPlaying.toggle()

                let url = URL(fileURLWithPath: path)

                do {
                    self.audioPlayer = try AVAudioPlayer(contentsOf: url)
                    self.audioPlayer?.prepareToPlay()
                    self.audioPlayer?.play()
                }catch {
                    print("Error")
                }
            }
        }, label: {
            ZStack{
                Image("fire")
                    .opacity(0.3)
                    .clipShape(Circle())
                    .blur(radius: 0.5)
                    .rotationEffect(Angle.degrees(isRotated ? 360 : 0))
                    .animation(animation)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 10).opacity(0.1).blur(radius: 2))
                    .shadow(color: Color.red, radius: 10)
                    .shadow(color: Color.yellow, radius: 15, x: 5, y:5)
                    .shadow(color: Color.gray, radius: 40)
                    .frame(width: 175, height: 175, alignment: top ? .top: .bottom)
                Text("\(isPlayerOne ? pool.playerOnePoints : pool.playerTwoPoints)")
                    .font(.system(size: 70))
                    .fontWeight(.heavy)
                    .rotationEffect(.degrees(top ? 180: 0))
                    .shadow(color: .gray, radius: 1)
                    .shadow(color: .white, radius: 2.5)
                    .shadow(color: .yellow, radius: 20, x: 4, y: 4)
                    .shadow(color: .gray, radius: 1)
                    .shadow(color: .white, radius: 2.5)
                    .shadow(color: .yellow, radius: 20, x: -4, y: -4)
                    .blur(radius: 0.5)
            }.onAppear(perform: {
                isRotated.toggle()
            })
        })
        .buttonStyle(PlainButtonStyle())
        
    }
    
    init(isTop top: Bool, pool: ThePool, playerOne: Bool){
        self.top = top
        self.pool = pool
        self.isPlayerOne = playerOne
    }
}




//struct PlayerScore_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack{
//            , pool: <#ThePool#>
//            
//        }
//    }
//}
