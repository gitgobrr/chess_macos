//
//  Extensions.swift
//  chess_macos
//
//  Created by sergey on 26.09.2022.
//

import AppKit

// https://stackoverflow.com/a/54310657/7699647

extension NSView {
    
    func bringSubviewToFront(_ view: NSView) {
        var theView = view
        self.sortSubviews({(viewA,viewB,rawPointer) in
            let view = rawPointer?.load(as: NSView.self)
            
            switch view {
            case viewA:
                return ComparisonResult.orderedDescending
            case viewB:
                return ComparisonResult.orderedAscending
            default:
                return ComparisonResult.orderedSame
            }
        }, context: &theView)
    }
}


extension CGAffineTransform {
    
    init(multiply by: CGFloat) {
        self.init(scaleX: by, y: by)
    }
    
    static var shrink8: CGAffineTransform {
        .init(multiply: 1/8)
    }
    
    init(centering piece: PieceView) {
        self.init(translationX: -piece.frame.width/2, y: -piece.frame.height/2)
    }
}
