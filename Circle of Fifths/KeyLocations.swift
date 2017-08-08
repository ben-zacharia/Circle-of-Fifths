//
//  KeyLocations.swift
//  Circle of Fifths
//
//  Created by Ben Zacharia on 7/31/17.
//  Copyright © 2017 Ben Zacharia. All rights reserved.
//  (116,176) (131,176)

import Foundation

let keyLocations: [KeyName: Rectangle] = [
    //Rectangle for click ordered counter clockwise from C - (0,0) is top left of image
    .cMaj: Rectangle(lowerX: 145, lowerY: 15, upperX: 205, upperY: 50),
    .aMin: Rectangle(lowerX: 155, lowerY: 50, upperX: 195, upperY: 80),
    .fMaj: Rectangle(lowerX: 65, lowerY: 15, upperX: 140, upperY: 60),
    .dMin: Rectangle(lowerX: 105, lowerY: 60, upperX: 155, upperY: 90),
    .bFlatMaj: Rectangle(lowerX: 0, lowerY: 60, upperX: 90, upperY: 105),
    .gMin: Rectangle(lowerX: 95, lowerY: 90, upperX: 125, upperY: 125),
    .eFlatMaj: Rectangle(lowerX: 0, lowerY: 120, upperX: 80, upperY: 165),
    .cMin: Rectangle(lowerX: 80, lowerY: 120, upperX: 120, upperY: 155),
    .aFlatMaj: Rectangle(lowerX: 0, lowerY: 165, upperX: 90, upperY: 213),
    .fMin: Rectangle(lowerX: 90, lowerY: 160, upperX: 125, upperY: 185),
    .cSharpMaj: Rectangle(lowerX: 95, lowerY: 235, upperX: 125, upperY: 250),
    .dFlatMaj: Rectangle(lowerX: 90, lowerY: 213, upperX: 130, upperY: 235),
    .bFlatMin: Rectangle(lowerX: 125, lowerY: 203, upperX: 155, upperY: 215),
    .aSharpMin: Rectangle(lowerX: 125, lowerY: 185, upperX: 155, upperY: 203),
    .fSharpMaj: Rectangle(lowerX: 155, lowerY: 248, upperX: 200, upperY: 262),
    .gFlatMaj: Rectangle(lowerX: 155, lowerY: 225, upperX: 200, upperY: 248),
    .eFlatMin: Rectangle(lowerX: 165, lowerY: 212, upperX: 190, upperY: 225),
    .dSharpMin: Rectangle(lowerX: 160, lowerY: 195, upperX: 195, upperY: 212),
    .cFlatMaj: Rectangle(lowerX: 220, lowerY: 233, upperX: 250, upperY: 250),
    .bMaj: Rectangle(lowerX: 228, lowerY: 215, upperX: 255, upperY: 235),
    .aFlatMin: Rectangle(lowerX: 200, lowerY: 205, upperX: 228, upperY: 215),
    .gSharpMin: Rectangle(lowerX: 195, lowerY: 185, upperX: 235, upperY: 205),
    .eMaj: Rectangle(lowerX: 260, lowerY: 175, upperX: 335, upperY: 215),
    .cSharpMin: Rectangle(lowerX: 225, lowerY: 160, upperX: 260, upperY: 185),
    .aMaj: Rectangle(lowerX: 275, lowerY: 125, upperX: 340, upperY: 160),
    .fSharpMin: Rectangle(lowerX: 230, lowerY: 125, upperX: 270, upperY: 155),
    .dMaj: Rectangle(lowerX: 260, lowerY: 65, upperX: 330, upperY: 110),
    .bMin: Rectangle(lowerX: 230, lowerY: 95, upperX: 260, upperY: 120),
    .gMaj: Rectangle(lowerX: 215, lowerY: 20, upperX: 285, upperY: 65),
    .eMin: Rectangle(lowerX: 205, lowerY: 65, upperX: 230, upperY: 95)
]

enum KeyName {
    case aMaj
    case aMin
    case aFlatMaj
    case aFlatMin
    case aSharpMin
    case bMaj
    case bMin
    case bFlatMaj
    case bFlatMin
    case cMaj
    case cMin
    case cFlatMaj
    case cSharpMaj
    case cSharpMin
    case dMaj
    case dMin
    case dFlatMaj
    case dSharpMin
    case eMaj
    case eMin
    case eFlatMaj
    case eFlatMin
    case fMaj
    case fMin
    case fSharpMaj
    case fSharpMin
    case gMaj
    case gMin
    case gFlatMaj
    case gSharpMin
    
    var key: Key {
        switch  self {
        case .aMaj: return Key(pitch: .a, isMinor: false)
        case .aMin: return Key(pitch: .a, isMinor: true)
        case .aFlatMaj: return Key(pitch: .aFlat, isMinor: false)
        case .aFlatMin: return Key(pitch: .aFlat, isMinor: true)
        case .aSharpMin: return Key(pitch: .aSharp, isMinor: true)
        case .bMaj: return Key(pitch: .b, isMinor: false)
        case .bMin: return Key(pitch: .b, isMinor: true)
        case .bFlatMaj: return Key(pitch: .bFlat, isMinor: false)
        case .bFlatMin: return Key(pitch: .bFlat, isMinor: true)
        case .cMaj: return Key(pitch: .c, isMinor: false)
        case .cMin: return Key(pitch: .c, isMinor: true)
        case .cFlatMaj: return Key(pitch: .cFlat, isMinor: false)
        case .cSharpMaj: return Key(pitch: .cSharp, isMinor: false)
        case .cSharpMin: return Key(pitch: .cSharp, isMinor: true)
        case .dMaj: return Key(pitch: .d, isMinor: false)
        case .dMin: return Key(pitch: .d, isMinor: true)
        case .dFlatMaj: return Key(pitch: .dFlat, isMinor: false)
        case .dSharpMin: return Key(pitch: .dSharp, isMinor: true)
        case .eMaj: return Key(pitch: .e, isMinor: false)
        case .eMin: return Key(pitch: .e, isMinor: true)
        case .eFlatMaj: return Key(pitch: .eFlat, isMinor: false)
        case .eFlatMin: return Key(pitch: .eFlat, isMinor: true)
        case .fMaj: return Key(pitch: .f, isMinor: false)
        case .fMin: return Key(pitch: .f, isMinor: true)
        case .fSharpMaj: return Key(pitch: .fSharp, isMinor: false)
        case .fSharpMin: return Key(pitch: .fSharp, isMinor: true)
        case .gMaj: return Key(pitch: .g, isMinor: false)
        case .gMin: return Key(pitch: .g, isMinor: true)
        case .gFlatMaj: return Key(pitch: .gFlat, isMinor: false)
        case .gSharpMin: return Key(pitch: .gSharp, isMinor: true)
        }
    }
}















