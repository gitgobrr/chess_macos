//
//  BoardPieces.swift
//  chess_macos
//
//  Created by sergey on 17.09.2022.
//

import Foundation
import AppKit

enum PieceColor: String {
    case black = "b"
    case white = "w"
}

enum PieceType: String {
    case pawn = "p"
    case rook = "r"
    case knight = "n"
    case bishop = "b"
    case queen = "q"
    case king = "k"
}


struct Piece {
    var origin: NSPoint
    let color: PieceColor
    
    var type: PieceType
    var image: NSImageView
    
    init(origin: NSPoint = .zero, type: PieceType, color: PieceColor) {
        self.origin = origin
        self.type = type
        self.color = color
        
        self.image = NSImageView(image: NSImage(named: type.rawValue+color.rawValue)!)
    }
    
    
    mutating func originByPieace(board: BoardView) {
        if color == .white {
            if type == .pawn {
                image.frame.origin.y = .zero + image.bounds.height
            } else {
                image.frame.origin.y = .zero
            }
        } else if color == .black {
            if type == .pawn {
                image.frame.origin.y = board.bounds.maxY - image.bounds.height * 2
            } else {
                image.frame.origin.y = board.bounds.maxY - image.bounds.height
            }
        }
    }
}
