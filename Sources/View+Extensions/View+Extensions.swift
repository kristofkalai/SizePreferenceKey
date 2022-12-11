//
//  View+Extensions.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 11..
//

import SwiftUI

public extension View {
    public func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader {
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: $0.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }

    public func storeSize(in size: Binding<CGSize>) -> some View {
        readSize {
            size.wrappedValue = $0
        }
    }

    public func storeHeight(in height: Binding<CGFloat>) -> some View {
        readSize {
            height.wrappedValue = $0.height
        }
    }

    public func storeWidth(in width: Binding<CGSize>) -> some View {
        readSize {
            width.wrappedValue = $0.width
        }
    }
}
