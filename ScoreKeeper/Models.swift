//
//  Models.swift
//  ScoreKeeper
//
//  Created by Kevin McPhee on 2020-10-19.
//

import Foundation
import Combine


class ThePool: ObservableObject {
    
    @Published var availablePoints: Int
    @Published var playerOnePoints: Int = 0
    @Published var playerTwoPoints: Int = 0
    var initialPoints: Int
    
    func decreasePool() {
        self.availablePoints -= 1
    }
    
    func increasePool(){
        if (self.availablePoints < initialPoints){
            self.availablePoints += 1
        }
    }
    
    func increasePlayerOne(){
        playerOnePoints += 1
    }
    
    func decreasePlayerOne() -> Bool{
        if (playerOnePoints > 0){
            playerOnePoints -= 1
            return true
        }
        return false
    }
    
    func increasePlayerTwo(){
        playerTwoPoints += 1
    }
    
    func decreasePlayerTwo() -> Bool{
        if (playerTwoPoints > 0){
            playerTwoPoints -= 1
            return true
        }
        return false
    }
    
    
    init(startWith points: Int){
        self.availablePoints = points
        self.initialPoints = points
    }
    
}


