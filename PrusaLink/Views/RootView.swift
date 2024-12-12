//
//  RootView.swift
//  PrusaLink
//
//  Created by John Behnke on 12/12/24.
//

import SwiftUI

struct RootView: View {
   
    var body: some View {
        TabView {
            Tab("Printers", systemImage: "printer") {
                PrinterListView()
            }
            Tab("Settings", systemImage: "gear") {
                EmptyView()
            }
        }
    }
}

#Preview {
    RootView()
}

