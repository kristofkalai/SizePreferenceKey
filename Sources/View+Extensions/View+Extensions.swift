//
//  View+Extensions.swift
//
//
//  Created by Kristof Kalai on 2022. 12. 11..
//

import SwiftUI

extension View {
    public func readProxy(onAppear: @escaping (GeometryProxy) -> Void) -> some View {
        overlay(
            GeometryReader { proxy in
                Color.clear
                    .onAppear {
                        onAppear(proxy)
                    }
            }
        )
    }
}

extension View {
    public func readSize(
        update strategy: SizeUpdateStrategy = .once,
        onChange: @escaping (CGSize) -> Void
    ) -> some View {
        overlay(
            GeometryReader { proxy in
                let proxySize = proxy.size

                let observer = Color.clear
                    .onAppear {
                        guard strategy == .once else { return }
                        onChange(proxy.size)
                    }

                if #available(iOS 15, *) {
                    observer
                        .task(id: proxy.size) {
                            guard strategy == .always else { return }
                            await MainActor.run {
                                onChange(.init(width: max(0, proxySize.width), height: max(0, proxySize.height)))
                            }
                        }
                } else {
                    observer
                }
            }
        )
    }

    public func readHeight(
        update strategy: SizeUpdateStrategy = .once,
        onChange: @escaping (CGFloat) -> Void
    ) -> some View {
        readSize(update: strategy) { onChange($0.height) }
    }

    public func readWidth(
        update strategy: SizeUpdateStrategy = .once,
        onChange: @escaping (CGFloat) -> Void
    ) -> some View {
        readSize(update: strategy) { onChange($0.width) }
    }
}

extension View {
    public func storeSize(
        update strategy: SizeUpdateStrategy = .once,
        in size: Binding<CGSize>,
        block: @escaping (CGSize) -> Void = { _ in }
    ) -> some View {
        readSize(update: strategy) {
            size.wrappedValue = $0
            block($0)
        }
    }

    public func storeSize(
        update strategy: SizeUpdateStrategy = .once,
        in size: Binding<CGSize?>,
        block: @escaping (CGSize) -> Void = { _ in }
    ) -> some View {
        readSize(update: strategy) {
            size.wrappedValue = $0
            block($0)
        }
    }

    public func storeSize(
        update strategy: SizeUpdateStrategy = .once,
        in size: Binding<CGSize>,
        block: @escaping () -> Void
    ) -> some View {
        storeSize(update: strategy, in: size, block: { _ in block() })
    }

    public func storeSize(
        update strategy: SizeUpdateStrategy = .once,
        in size: Binding<CGSize?>,
        block: @escaping () -> Void
    ) -> some View {
        storeSize(update: strategy, in: size, block: { _ in block() })
    }
}

extension View {
    public func storeHeight(
        update strategy: SizeUpdateStrategy = .once,
        in height: Binding<CGFloat>,
        block: @escaping (CGFloat) -> Void = { _ in }
    ) -> some View {
        readHeight(update: strategy) {
            height.wrappedValue = $0
            block($0)
        }
    }

    public func storeHeight(
        update strategy: SizeUpdateStrategy = .once,
        in height: Binding<CGFloat?>,
        block: @escaping (CGFloat) -> Void = { _ in }
    ) -> some View {
        readHeight(update: strategy) {
            height.wrappedValue = $0
            block($0)
        }
    }

    public func storeHeight(
        update strategy: SizeUpdateStrategy = .once,
        in height: Binding<CGFloat>,
        block: @escaping () -> Void
    ) -> some View {
        storeHeight(update: strategy, in: height, block: { _ in block() })
    }

    public func storeHeight(
        update strategy: SizeUpdateStrategy = .once,
        in height: Binding<CGFloat?>,
        block: @escaping () -> Void
    ) -> some View {
        storeHeight(update: strategy, in: height, block: { _ in block() })
    }
}

extension View {
    public func storeWidth(
        update strategy: SizeUpdateStrategy = .once,
        in width: Binding<CGFloat>,
        block: @escaping (CGFloat) -> Void = { _ in }
    ) -> some View {
        readWidth(update: strategy) {
            width.wrappedValue = $0
            block($0)
        }
    }

    public func storeWidth(
        update strategy: SizeUpdateStrategy = .once,
        in width: Binding<CGFloat?>,
        block: @escaping (CGFloat) -> Void = { _ in }
    ) -> some View {
        readWidth(update: strategy) {
            width.wrappedValue = $0
            block($0)
        }
    }

    public func storeWidth(
        update strategy: SizeUpdateStrategy = .once,
        in width: Binding<CGFloat>,
        block: @escaping () -> Void
    ) -> some View {
        storeWidth(update: strategy, in: width, block: { _ in block() })
    }

    public func storeWidth(
        update strategy: SizeUpdateStrategy = .once,
        in width: Binding<CGFloat?>,
        block: @escaping () -> Void
    ) -> some View {
        storeWidth(update: strategy, in: width, block: { _ in block() })
    }
}
