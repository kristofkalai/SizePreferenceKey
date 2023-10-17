//
//  View+Extensions.swift
//
//
//  Created by Kristof Kalai on 2022. 12. 11..
//

import SwiftUI

extension View {
    public func readProxy(onChange: @escaping (GeometryProxy) -> Void) -> some View {
        background(
            GeometryReader { proxy in
                Color.clear
                    .onAppear {
                        onChange(proxy)
                    }
            }
        )
    }
}

extension View {
    public func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        readProxy { onChange($0.size) }
    }

    public func readHeight(onChange: @escaping (CGFloat) -> Void) -> some View {
        readSize { onChange($0.height) }
    }

    public func readWidth(onChange: @escaping (CGFloat) -> Void) -> some View {
        readSize { onChange($0.width) }
    }
}

extension View {
    public func storeSize(in size: Binding<CGSize>, block: (CGSize) -> Void = { _ in }) -> some View {
        readSize {
            size.wrappedValue = $0
        }
    }

    public func storeSize(in size: Binding<CGSize?>, block: (CGSize) -> Void = { _ in }) -> some View {
        readSize {
            size.wrappedValue = $0
        }
    }

    public func storeSize(in size: Binding<CGSize>, block: () -> Void) -> some View {
        storeSize(in: size, block: { _ in block() })
    }

    public func storeSize(in size: Binding<CGSize?>, block: () -> Void) -> some View {
        storeSize(in: size, block: { _ in block() })
    }
}

extension View {
    public func storeHeight(in height: Binding<CGFloat>, block: (CGFloat) -> Void = { _ in }) -> some View {
        readSize {
            height.wrappedValue = $0.height
        }
    }

    public func storeHeight(in height: Binding<CGFloat?>, block: (CGFloat) -> Void = { _ in }) -> some View {
        readSize {
            height.wrappedValue = $0.height
        }
    }

    public func storeHeight(in height: Binding<CGFloat>, block: () -> Void) -> some View {
        storeHeight(in: height, block: { _ in block() })
    }

    public func storeHeight(in height: Binding<CGFloat?>, block: () -> Void) -> some View {
        storeHeight(in: height, block: { _ in block() })
    }
}

extension View {
    public func storeWidth(in width: Binding<CGFloat>, block: (CGFloat) -> Void = { _ in }) -> some View {
        readSize {
            width.wrappedValue = $0.width
        }
    }

    public func storeWidth(in width: Binding<CGFloat?>, block: (CGFloat) -> Void = { _ in }) -> some View {
        readSize {
            width.wrappedValue = $0.width
        }
    }

    public func storeWidth(in width: Binding<CGFloat>, block: () -> Void) -> some View {
        storeWidth(in: width, block: { _ in block() })
    }

    public func storeWidth(in width: Binding<CGFloat?>, block: () -> Void) -> some View {
        storeWidth(in: width, block: { _ in block() })
    }
}
