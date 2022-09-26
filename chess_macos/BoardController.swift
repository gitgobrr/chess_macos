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
        
        addPieces()
        
    }
    
    @IBOutlet var board: BoardView!
    
    func addPieces() {
        let order: [[PieceType]] = [
            [.rook,.knight,.bishop,.queen,.king,.bishop,.knight,.rook],
            [.pawn,.pawn,.pawn,.pawn,.pawn,.pawn,.pawn,.pawn]
        ]
        
        for (i,row) in order.enumerated() {
            for (j,col) in row.enumerated() {
                whitePieces.append(PieceView(type: col, color: .white, square: NSPoint(x: j, y: i)))
                blackPieces.append(PieceView(type: col, color: .black, square: NSPoint(x: j, y: 7-i)))
            }
        }
        
        board.pieces = whitePieces+blackPieces
        board.pieces.forEach { pieceView in
            let gesture = PieceGestureRecognizer(target: self, action: nil)
            pieceView.addGestureRecognizer(gesture)
        }
        board.subviews.append(contentsOf: board.pieces)
    }
    
    var whitePieces: [PieceView] = []
    var blackPieces: [PieceView] = []
    
}
