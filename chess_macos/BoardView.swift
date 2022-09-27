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
        layer?.borderWidth = 1
        
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
        pieces.forEach { pieceView in
            pieceView.frame.size = bounds.size.applying(.shrink8)
            pieceView.frame.origin = pieceView.setOrigin(square: pieceView.square)
        }
    }
    
    func addPieces() {
        let order: [[PieceType]] = [
            [.rook,.knight,.bishop,.queen,.king,.bishop,.knight,.rook],
            [.pawn,.pawn,.pawn,.pawn,.pawn,.pawn,.pawn,.pawn]
        ]
        
        for (i,row) in order.enumerated() {
            for (j,col) in row.enumerated() {
                pieces.append(PieceView(type: col, color: .white, square: NSPoint(x: j, y: i)))
                pieces.append(PieceView(type: col, color: .black, square: NSPoint(x: j, y: 7-i)))
            }
        }
        subviews.append(contentsOf: pieces)
    }
    
    override func viewDidMoveToWindow() {
        addPieces()
    }
    
    var pieces: [PieceView] = []
}
