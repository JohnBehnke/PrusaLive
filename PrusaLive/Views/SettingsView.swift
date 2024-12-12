//
//  SettingsView.swift
//  PrusaLive
//
//  Created by John Behnke on 12/12/24.
//

import SwiftUI
import BehnkeFoundation
import Flannel

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            Form {
                Section(
                    header: Text("Developer Menu"),
                    footer:
                        Footline()
                ) {
                    NavigationLink {
                        LogView()
                    } label: {
                        Label {
                            Text("Log Viewer")
                        } icon: {
                            Image(systemName: "tree.fill")
                                .settingsIcon(.green)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        self.dismiss()
                    } label: {
                        Text("Done")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
