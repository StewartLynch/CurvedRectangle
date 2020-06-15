//
//  CodeTextView.swift
//  ShapePlayer
//
//  Created by Stewart Lynch on 2020-06-14.
//  Copyright © 2020 Stewart Lynch. All rights reserved.
//

import SwiftUI

struct CodeTextView: View {
    var sides: CurvedRectangle.Side = .both
    var topCurve: CGFloat = 0
    var bottomCurve: CGFloat = 0
    
    var body: some View {
        Text(codeText())
            .font(Font.system(.body, design: .monospaced))
    }
    
    
    func codeText() -> String {
        var codeString = ""
        switch sides {
        case .top:
            codeString = """
            CurvedRecangle(
                sides: .top,
                topCurve: \(String(format: "%.2f", topCurve))
            )
            """
        case .bottom:
            codeString = """
            CurvedRecangle(
                sides: .bottom,
                bottomCurve: \(String(format: "%.2f", bottomCurve))
            )
            """
        case .both:
            codeString = """
            CurvedRecangle(
                sides: .both,
                topCurve: \(String(format: "%.2f", topCurve)),
                bottomCurve: \(String(format: "%.2f", bottomCurve))
            )
            """
        }
        return codeString
    }
}

