//
//  BoardController.swift
//  chess_macos
//
//  Created by sergey on 17.09.2022.
//

import Cocoa

class BoardController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        board.pieces.forEach { pieceView in
            let gesture = PieceGestureRecognizer(target: self, action: nil)
            pieceView.addGestureRecognizer(gesture)
        }
    }
    
    @IBOutlet var board: BoardView!
    
    var whitePieces: [PieceView] = []
    var blackPieces: [PieceView] = []
    
}
