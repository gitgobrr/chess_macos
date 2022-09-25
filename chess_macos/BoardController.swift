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
    
    var draggedPiece: PieceView? {
        didSet {
            print(oldValue)
        }
    }
//        willSet {
//            print(board.pieces.count)
//            guard newValue != nil else { return }
//            guard let index = board.pieces.firstIndex(of: newValue!) else { return }
//            board.pieces.remove(at: index)
//            print(board.pieces.count)
//        }
    
    
    @IBOutlet var board: BoardView!
    
//    override func mouseDown(with event: NSEvent) {
//        guard let contentView = event.window?.contentView else { return }
//
//        let clickPoint = contentView.convert(event.locationInWindow, to: board)
//        let clickArea = NSSize(width: board.pieces[0].frame.width,
//                               height: board.pieces[0].frame.height)
//
//
//        let square = NSPoint(x: (clickPoint.x/clickArea.width).rounded(.up),
//                             y: (clickPoint.y/clickArea.height).rounded(.up))
//
//
//        for i in 0..<board.pieces.count {
//            switch (board.pieces[i].frame.origin.x+clickArea.width/2,board.pieces[i].frame.origin.y+clickArea.height/2) {
//            case ((square.x-1)*clickArea.width..<square.x*clickArea.width,
//                  (square.y-1)*clickArea.height..<square.y*clickArea.height):
//                board.pieces[i].isDragged = true
//                return
//            default:
//                print(((square.x-1)*clickArea.width..<square.x*clickArea.width,
//                       (square.y-1)*clickArea.height..<square.y*clickArea.height))
//                print(board.pieces[i].frame)
//                continue
//            }
//        }
//
//    }
    
//    override func mouseDragged(with event: NSEvent) {
//        guard let contentView = event.window?.contentView else { return }
//
//        let clickPoint = contentView.convert(event.locationInWindow, to: board)
//        let clickArea = NSSize(width: board.pieces[0].frame.width,
//                               height: board.pieces[0].frame.height)
//        for piece in board.pieces {
//            if piece.isDragged {
//                let translation = CGAffineTransform(translationX: -clickArea.width/2,y: -clickArea.height/2)
//                piece.frame.origin = clickPoint.applying(translation)
//            }
//        }
//    }
    
//    override func mouseUp(with event: NSEvent) {
//        for i in 0..<board.pieces.count {
//            board.pieces[i].isDragged = false
//        }
//    }
    
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
            let gesture = ChessGesture(target: self, action: nil)
//            gesture.minimumPressDuration = .zero
            pieceView.addGestureRecognizer(gesture)
        }
        board.subviews.append(contentsOf: board.pieces)
        board.drawPieces()
    }
    
//    @objc func holdPiece(_ sender: NSGestureRecognizer) {
////        sender.state = .ended
//        guard let piece = sender.view as? PieceView else { return }
//        draggedPiece = piece
//        let translation = CGAffineTransform(translationX: -draggedPiece!.frame.width/2,
//                                            y: -draggedPiece!.frame.height/2)
//        draggedPiece!.frame.origin =  sender.location(in: board).applying(translation)
//    }
    
    
//    override func mouseDragged(with event: NSEvent) {
//        print("yo")
//        guard let draggedPiece = draggedPiece else { return }
//        guard let contentView = event.window?.contentView else { return }
//        let clickPoint = contentView.convert(event.locationInWindow, to: board)
//        let translation = CGAffineTransform(translationX: -draggedPiece.frame.width/2,
//                                            y: -draggedPiece.frame.height/2)
//        draggedPiece.frame.origin = clickPoint.applying(translation)
//    }
    
//    override func mouseUp(with event: NSEvent) {
//        draggedPiece = nil
//    }
    
    var whitePieces: [PieceView] = []
    var blackPieces: [PieceView] = []

}

class ChessGesture: NSGestureRecognizer {
    
//    override func mouseDown(with event: NSEvent) {
//        let translation = CGAffineTransform(translationX: -view!.frame.width/2,
//                                            y: -view!.frame.height/2)
//        view?.frame.origin = location(in: target?.view).applying(translation)
//    }
    
    override func mouseDragged(with event: NSEvent) {
        let translation = CGAffineTransform(translationX: -view!.frame.width/2,
                                            y: -view!.frame.height/2)
        view?.frame.origin = location(in: target?.view).applying(translation)
    }
    
    override func mouseUp(with event: NSEvent) {
        let piece = view as! PieceView
        piece.frame.origin = piece.getSquare().applying(.init(scaleX: piece.frame.width, y: piece.frame.height))
    }
}
