//
//  BoardView.swift
//  chess_macos
//
//  Created by sergey on 17.09.2022.
//

import Cocoa

class BoardView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        
        drawBoard()
        drawPieces()
    }
    
    
    func drawBoard() {
        for row in 1...8 {
            for col in 1...8 {
                let boardWidth = bounds.width
                let boardHeight = bounds.height
                let squareSize = CGSize(width: boardWidth/8, height: boardHeight/8)
                let squareOrigin = CGPoint(x: CGFloat (col-1) * squareSize.width, y: CGFloat (row-1) * squareSize.height)
                let squareRect = NSRect(origin: squareOrigin, size: squareSize)
                let square = NSBezierPath(rect: squareRect)
                if ((row + col) % 2 == 0) {
                    NSColor.gray.setFill()
                } else {
                    NSColor.white.setFill()
                }
                square.fill()
            }
        }
    }
        
        
        func drawPieces() {
            
        }
}
