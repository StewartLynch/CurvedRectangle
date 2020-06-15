//
//  BothCurves.swift
//  ShapePlayer
//
//  Created by Stewart Lynch on 2020-06-14.
//  Copyright © 2020 Stewart Lynch. All rights reserved.
//

import SwiftUI

struct BothCurves: View {
    enum Direction: CGFloat {
        case up = -1
        case down = 1
    }
    @State private var topScale: CGFloat = 0.2
    @State private var bottomScale: CGFloat = 0.2
    @State private var topDirection:Direction = .up
    @State private var bottomDirection:Direction = .down
    
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Slider(value: $bottomScale)
                    .frame(width: 100)
                Text("\(bottomScale, specifier: "%.2f")")
            }
            Picker(selection: $bottomDirection.animation(), label: Text("")) {
                Text("Up").tag(Direction.up)
                Text("Down").tag(Direction.down)
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 150)
            
            CurvedRectangle(sides: .both,
                            topCurve: bottomScale * bottomDirection.rawValue,
                            bottomCurve: topScale * topDirection.rawValue )
                .fill(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 0.5699273768)))
                .shadow(radius: 12)
                .frame(height: 300)
                .overlay(
                    CodeTextView(sides: .both,
                                 topCurve: bottomScale * bottomDirection.rawValue,
                                 bottomCurve: topScale * topDirection.rawValue)
            .font(.caption  )
            )
            Picker(selection: $topDirection.animation(), label: Text("")) {
                Text("Up").tag(Direction.up)
                Text("Down").tag(Direction.down)
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 150)
            VStack {
                Slider(value: $topScale)
                    .frame(width: 100)
                Text("\(topScale, specifier: "%.2f")")
            }
        }
    }
}

struct BothCurves_Previews: PreviewProvider {
    static var previews: some View {
        BothCurves()
    }
}
