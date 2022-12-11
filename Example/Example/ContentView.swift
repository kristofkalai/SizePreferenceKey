//
//  ContentView.swift
//  Example
//
//  Created by Kristof Kalai on 2022. 12. 11..
//

import SizePreferenceKey
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .readSize {
                    print("Image size: \($0)")
                }
            Text("Hello, world!")
                .readSize {
                    print("Text size: \($0)")
                }
        }
        .padding()
        .readSize {
            print("Content size: \($0)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
