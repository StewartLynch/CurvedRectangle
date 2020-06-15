//
//  CurvedRectangle.swift
//  ShapePlayer
//
//  Created by Stewart Lynch on 2020-06-14.
//  Copyright © 2020 Stewart Lynch. All rights reserved.
//

import SwiftUI

struct CurvedRectangle: Shape {
    enum Side: CaseIterable {
        case top, bottom, both
    }
    var sides: Side = .top
    var topCurve: CGFloat = -0.2
    var bottomCurve: CGFloat = 0.2
    
    var animatableData: AnimatablePair<CGFloat,CGFloat> {
        get {
            AnimatablePair(topCurve, bottomCurve)
        }
        set {
            self.topCurve = newValue.first
            self.bottomCurve = newValue.second
        }
    }
    
    
    
    func path(in rect: CGRect) -> Path {
        var tYOffset: CGFloat {
            rect.height * ((topCurve > 0) ? topCurve * 2 : topCurve)
        }
        var bYOffset: CGFloat {
            rect.height * ((bottomCurve < 0) ? bottomCurve * 2 : bottomCurve)
        }
        var path = Path()
        // Top Left
        path.move(to: (sides != .bottom) ?
            CGPoint(x: rect.minX,y: (tYOffset >= 0) ? rect.minY : (rect.minY - tYOffset)) :
            CGPoint(x: rect.minX,y: rect.minY)
        )
        // Top Right
        (sides != .bottom) ?
        path.addQuadCurve(to: CGPoint(x: rect.maxX,
                    y: (tYOffset >= 0) ? rect.minY : (rect.minY - tYOffset)),
            control: CGPoint(x: rect.midX, y: rect.minY + tYOffset)) :
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        // Bottom Right
        path.addLine(to: (sides == .top) ?
            CGPoint(x: rect.maxX, y: rect.maxY) :
            CGPoint(x: rect.maxX,
            y: (bYOffset <= 0) ? rect.maxY :
               rect.maxY - bYOffset)
        )
        (sides == .top) ?
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY)) :
        path.addQuadCurve(to: CGPoint(x: rect.minX,
                    y: (bYOffset <= 0) ? rect.maxY :
                    (rect.maxY - bYOffset)),
        control: CGPoint(x: rect.midX,
                         y: rect.maxY + bYOffset))
        return path
    }
}


struct CurvedRectangle_Previews: PreviewProvider {
    static var previews: some View {
        CurvedRectangle()
    }
}
