//
//  BoardView.swift
//  chess_macos
//
//  Created by sergey on 17.09.2022.
//

import Cocoa

class BoardView: NSView {
    
    override func viewDidMoveToWindow() {
        addPieces()
    }
    
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
        for i in 0..<whitePieces.count {
            whitePieces[i].image.frame.size = NSSize(width: bounds.width/8, height: bounds.width/8)
            whitePieces[i].image.frame.origin.x = whitePieces[i].origin.x + whitePieces[i].image.frame.width * CGFloat(Int(i % 8))
            whitePieces[i].originByPieace(board: self)
            
            blackPieces[i].image.frame.size = NSSize(width: bounds.width/8, height: bounds.width/8)
            blackPieces[i].image.frame.origin.x = whitePieces[i].origin.x + whitePieces[i].image.frame.width * CGFloat(Int(i % 8))
            blackPieces[i].originByPieace(board: self)
        }
    }
    
    func addPieces() {
        let whitePawns: [Piece] = { () -> [Piece] in
            var a: [Piece] = []
            for _ in 1...8 {
                a.append(Piece(type: .pawn, color: .white))
            }
            return a
        }()
        let whitePieces = whitePawns + [
            Piece(type: .rook, color: .white),
            Piece(type: .knight, color: .white),
            Piece(type: .bishop, color: .white),
            Piece(type: .queen, color: .white),
            Piece(type: .king, color: .white),
            Piece(type: .bishop, color: .white),
            Piece(type: .knight, color: .white),
            Piece(type: .rook, color: .white),
        ]
        
        let blackPawns: [Piece] = { () -> [Piece] in
            var a: [Piece] = []
            for _ in 1...8 {
                a.append(Piece(type: .pawn, color: .black))
            }
            return a
        }()
        let blackPieces = blackPawns + [
            Piece(type: .rook, color: .black),
            Piece(type: .knight, color: .black),
            Piece(type: .bishop, color: .black),
            Piece(type: .queen, color: .black),
            Piece(type: .king, color: .black),
            Piece(type: .bishop, color: .black),
            Piece(type: .knight, color: .black),
            Piece(type: .rook, color: .black),
        ]
        
        self.whitePieces = whitePieces
        self.blackPieces = blackPieces
        
        whitePieces.forEach { addSubview($0.image) }
        blackPieces.forEach { addSubview($0.image) }
        
    }
    
    var whitePieces: [Piece] = []
    var blackPieces: [Piece] = []
}
