//
//  Pitch.swift
//  Circle of Fifths
//
//  Created by Ben Zacharia on 7/31/17.
//  Copyright © 2017 Ben Zacharia. All rights reserved.
//

import Foundation

enum Pitch: String {
    case a = "A"
    case aFlat
    case aSharp
    case b = "B"
    case bFlat
    case bSharp
    case c = "C"
    case cFlat
    case cSharp
    case d = "D"
    case dFlat
    case dSharp
    case e = "E"
    case eFlat
    case eSharp
    case f = "F"
    case fFlat
    case fSharp
    case g = "G"
    case gFlat
    case gSharp
    
    
    var name: String {
        switch self {
        case .a: return "A"
        case .aFlat: return "Ab"
        case .aSharp: return "A#"
        case .b: return "B"
        case .bFlat: return "Bb"
        case .bSharp: return "B#"
        case .c: return "C"
        case .cFlat: return "Cb"
        case .cSharp: return "C#"
        case .d: return "D"
        case .dFlat: return "Db"
        case .dSharp: return "D#"
        case .e: return "E"
        case .eFlat: return "Eb"
        case .eSharp: return "E#"
        case .f: return "F"
        case .fFlat: return "Fb"
        case .fSharp: return "F#"
        case .g: return "G"
        case .gFlat: return "Gb"
        case .gSharp: return "G#"
        }
    }
}










