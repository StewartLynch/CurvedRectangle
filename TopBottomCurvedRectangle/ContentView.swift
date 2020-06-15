//
//  ContentView.swift
//  TopBottomCurvedRectangle
//
//  Created by Stewart Lynch on 2020-06-14.
//  Copyright © 2020 Stewart Lynch. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    enum Direction: CGFloat {
        case up = -1
        case down = 1
    }
    @State private var topScale: CGFloat = 0.1
    @State private var bottomScale: CGFloat = 0.1
    @State private var topDirection:Direction = .down
    @State private var bottomDirection:Direction = .up
    @State private var isShowingBoth = false
    
    var body: some View {
        VStack {
            CurvedRectangle(
                sides: .bottom,
                bottomCurve: topScale * topDirection.rawValue )
                .fill(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 0.5699273768)))
                .shadow(radius: 12)
                .frame(height: 200)
                .overlay(
                    CodeTextView(sides: .bottom, bottomCurve: topScale * topDirection.rawValue)
            )
            VStack {
                Picker(selection: $topDirection.animation(), label: Text("")) {
                    Text("Up").tag(Direction.up)
                    Text("Down").tag(Direction.down)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 150)
                Slider(value: $topScale)
                    .frame(width: 100)
                Text("\(topScale, specifier: "%.2f")")
            }.padding()
            Spacer()
                Button("Show Both") {
                    self.isShowingBoth = true
                }
            Spacer()
            VStack {
                Slider(value: $bottomScale)
                    .frame(width: 100)
                Text("\(bottomScale, specifier: "%.2f")")
                Picker(selection: $bottomDirection.animation(), label: Text("")) {
                    Text("Up").tag(Direction.up)
                    Text("Down").tag(Direction.down)
                }.pickerStyle(SegmentedPickerStyle())
                    .frame(width: 150)
            }.padding()
            
            CurvedRectangle(
                sides: .top,
                topCurve: bottomScale * bottomDirection.rawValue
            )
                .fill(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 0.5699273768)))
                .shadow(radius: 12)
                .frame(height: 200)
                .overlay(
                    CodeTextView(sides: .top, topCurve:  bottomScale * bottomDirection.rawValue)
            )
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $isShowingBoth) {
            BothCurves()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
