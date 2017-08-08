//
//  Keys.swift
//  Circle of Fifths
//
//  Created by Ben Zacharia on 7/26/17.
//  Copyright © 2017 Ben Zacharia. All rights reserved.
//

import Foundation

struct Key {
    var pitch: Pitch
    var isMinor: Bool = false
    
    var name: String {
        let majorMinor = isMinor ? "Minor" : "Major"
        return "\(pitch.name) \(majorMinor)"
    }
    
    init(pitch: Pitch, isMinor: Bool) {
        self.pitch = pitch
        self.isMinor = isMinor
    }
    
    init(pitch: Pitch, accidental: Accidental, isMinor: Bool) {
        if (accidental == .natural) {
            self.pitch = pitch
        } else if (accidental == .flat) {
            switch pitch {
            case .a: self.pitch = .aFlat
            case .b: self.pitch = .bFlat
            case .c: self.pitch = .cFlat
            case .d: self.pitch = .dFlat
            case .e: self.pitch = .eFlat
            case .f: self.pitch = .fFlat
            case .g: self.pitch = .gFlat
            default: self.pitch = .c
            }
        } else {
            switch pitch {
            case .a: self.pitch = .aSharp
            case .b: self.pitch = .bSharp
            case .c: self.pitch = .cSharp
            case .d: self.pitch = .dSharp
            case .e: self.pitch = .eSharp
            case .f: self.pitch = .fSharp
            case .g: self.pitch = .gSharp
            default: self.pitch = .c
            }
        }
        self.isMinor = isMinor
    }
}

extension Key {
    func getRelativeKey() -> Key? {
        var newPitch: Pitch?
        switch self.pitch {
        case .a: newPitch = self.isMinor ? .c : .fSharp
        case .aFlat: newPitch = self.isMinor ? .cFlat : .f
        case .aSharp: newPitch = self.isMinor ? .cSharp : nil
        case .b: newPitch = self.isMinor ? .d : .gSharp
        case .bFlat: newPitch = self.isMinor ? .dFlat : .g
        case .c: newPitch = self.isMinor ? .eFlat : .a
        case .cFlat: newPitch = self.isMinor ? nil : .aFlat
        case .cSharp: newPitch = self.isMinor ? .e : .aSharp
        case .d: newPitch = self.isMinor ? .f : .b
        case .dFlat: newPitch = self.isMinor ? nil : .bFlat
        case .dSharp: newPitch = self.isMinor ? .fSharp : nil
        case .e: newPitch = self.isMinor ? .g : .cSharp
        case .eFlat: newPitch = self.isMinor ? .gFlat : .c
        case .f: newPitch = self.isMinor ? .aFlat : .d
        case .fSharp: newPitch = self.isMinor ? .a : .dSharp
        case .g: newPitch = self.isMinor ? .bFlat : .e
        case .gFlat: newPitch = self.isMinor ? nil : .eFlat
        case .gSharp: newPitch = self.isMinor ? .b : nil
        default: newPitch = nil //B#, E#, Fb exist neither in major nor minor without double flats/sharps
        }
        if newPitch == nil {
            return nil
        }
        let newKey = Key(pitch: newPitch!, isMinor: !self.isMinor)
        
        return newKey
    }
    
    func getParallelKey() -> Key? {
        var newKey: Key
        switch self.pitch {
        case .aSharp, .cFlat, .dFlat, .dSharp, .gFlat, .gSharp: return nil
        default: newKey = Key(pitch: self.pitch, isMinor: !self.isMinor)
        }
        return newKey
    }
}





















