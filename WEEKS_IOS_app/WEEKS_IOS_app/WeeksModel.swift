//
//  WeeksModel.swift
//  WEEKS_IOS_app
//
//  Created by Samuel Marg on 07/07/2024.
//

import Foundation
import SwiftUI

public struct Dimension {
    var _height: Int
    var _width: Int
    
    var height: Int {
        get { return _height }
        set(newValue) {
            if newValue >= 0 {
                _height = newValue
            } else {
                print("Error: Height cannot be negative.")
            }
        }
    }
    
    var width: Int {
        get { return _width }
        set(newValue) {
            if newValue >= 0 {
                _width = newValue
            } else {
                print("Error: Width cannot be negative.")
            }
        }
    }
    
    func getTotal() -> Int {
        return _height * _width
    }
}
let gridDimensions = Dimension(_height: 11, _width: 5)
let gridSize = gridDimensions.getTotal()


