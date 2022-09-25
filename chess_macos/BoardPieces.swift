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

enum PieceType: Int {
    case pawn
    case rook
    case knight
    case bishop
    case queen
    case king
}

class PieceView: NSImageView {
    let color: PieceColor
    
    var type: PieceType
    var square: NSPoint
    var isDragged = false
    
    init(type: PieceType, color: PieceColor, square: NSPoint) {
        self.color = color
        self.type = type
        self.square = square
        
        super.init(frame: NSRect())
        imageScaling = .scaleAxesIndependently
        image = NSImage(named: color.rawValue+"-\(type.rawValue)")!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setOrigin(square point: NSPoint) -> NSPoint {
        return point.applying(.init(scaleX: bounds.width, y: bounds.height))
    }
    
    func getSquare() -> NSPoint {
        var square = NSPoint()
        square.x = (frame.origin.x/frame.size.width).rounded()
        square.y = (frame.origin.y/frame.size.height).rounded()
        
        return square
    }
}
