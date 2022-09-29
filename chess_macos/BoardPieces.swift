//
//  BoardPieces.swift
//  chess_macos
//
//  Created by sergey on 17.09.2022.
//

import AppKit

class PieceView: NSImageView {
    let color: PieceColor
    
    var type: PieceType
    var square: NSPoint
    
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
        return point.applying(.init(multiply: bounds.width))
    }
    
    func getSquare() -> NSPoint {
        var square = NSPoint()
        square.x = (frame.origin.x/frame.size.width).rounded()
        square.y = (frame.origin.y/frame.size.height).rounded()
        
        return square
    }
    
    func moveIsLegal(start: NSPoint, end: NSPoint) -> Bool {
        let dX = abs(start.x - end.x)
        let dY = abs(start.y - end.y)
        
        switch type {
        case .pawn:
            if dX == 0 { return true }
            return false
        case .rook:
            if dX != 0 && dY != 0 { return false }
            return true
        case .knight:
            if (dX == 1 && dY == 2) || (dX == 2 && dY == 1) { return true }
            return false
        case .bishop:
            if dX == dY { return true }
            return false
        case .queen:
            if dX == dY { return true }
            else if dX == 0 || dY == 0 { return true }
            return false
        case .king:
            if dX > 1 || dY > 1 { return false }
            return true
        }
    }
    
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
}


class Rook: PieceView {
    override init(type: PieceView.PieceType, color: PieceView.PieceColor, square: NSPoint) {
        super.init(type: type, color: color, square: square)
        image = NSImage(named: "rook")!
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
