//
//  Geometry.swift
//  Circle of Fifths
//
//  Created by Ben Zacharia on 7/31/17.
//  Copyright © 2017 Ben Zacharia. All rights reserved.
//

import Foundation

struct Rectangle {
    let lowerX: Int
    let lowerY: Int
    let upperX: Int
    let upperY: Int
}

struct Point {
    let x: Double
    let y: Double
}

extension Point {
    func isInRectangle(_ rectangle: Rectangle) -> Bool {
        if x <= Double(rectangle.upperX) && x >= Double(rectangle.lowerX) && y <= Double(rectangle.upperY) && y >= Double(rectangle.lowerY){
            return true
        } else {
            return false
        }
    }
}






























