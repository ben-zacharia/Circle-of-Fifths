//
//  KeyErrors.swift
//  Circle of Fifths
//
//  Created by Ben Zacharia on 8/8/17.
//  Copyright © 2017 Ben Zacharia. All rights reserved.
//

import Foundation

enum KeyErrors: Error {
    case noRelativeKey
    case noParallelKey
    case scaleCellError
    case audioCellError
    case arrowCellError
    
    var errorTitle: String {
        switch self {
        case .noRelativeKey: return "No Relative Key"
        case .noParallelKey: return "No Parallel Key"
        case .scaleCellError: return "Error Creating Cell"
        case .audioCellError: return "Error Finding Audio"
        case .arrowCellError: return "Error Finding Reverse"
        }
    }
    
    var errorMessage: String {
        switch self {
        case .noRelativeKey: return "There is no relative key with 7 or fewer accidentals"
        case .noParallelKey: return "There is no parallel key with 7 or fewer accidentals"
        case .scaleCellError: return "There was an error creating the key's data"
        case .audioCellError: return "The requested file does not exist"
        case .arrowCellError: return "The requested scale file does not exist"
        }
    }
}

