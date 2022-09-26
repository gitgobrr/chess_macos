//
//  MovePieceGestureRecognizer.swift
//  chess_macos
//
//  Created by sergey on 26.09.2022.
//

import Cocoa

class PieceGestureRecognizer: NSGestureRecognizer {
    
    var piece: PieceView! {
        guard view is PieceView else { return nil }
        return view as? PieceView
    }
    
    var board: BoardView! {
        guard let boardVC = target as? BoardController else { return nil }
        return boardVC.board
    }
    
    // Mouse events handling
    
    override func mouseDown(with event: NSEvent) {
        board.bringSubviewToFront(view!)
        piece.frame.origin = location(in: board).applying(.init(centering: view as! PieceView))
    }
    
    override func mouseDragged(with event: NSEvent) {
        piece.frame.origin = location(in: board).applying(.init(centering: view as! PieceView))
    }
    
    override func mouseUp(with event: NSEvent) {
        piece.frame.origin = piece.getSquare().applying(.init(scaleX: piece.frame.width, y: piece.frame.height))
    }
    
}
