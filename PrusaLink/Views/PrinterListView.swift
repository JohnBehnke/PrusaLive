//
//  PrinterListView.swift
//  PrusaLink
//
//  Created by John Behnke on 12/12/24.
//

import SwiftUI
import SwiftData

struct PrinterListView: View {
    @State private var showSettingsView: Bool = false
    @Environment(\.modelContext) private var modelContext
    @Query private var printerConnections: [PrinterConnection]
    
    var body: some View {
        NavigationSplitView {
            Group {
                if printerConnections.isEmpty {
                    
                    
                    ContentUnavailableView("No printers added", systemImage: "questionmark", description: Text("Add a printer connection"))
                        .debugFrame()
                } else {
                    List {
                        ForEach(printerConnections) { connection in
                            NavigationLink {
                                VStack {
                                    Text(connection.ipAddress)
                                    Text(connection.apiKey)
                                }
                            } label: {
                                Text(connection.name)
                            }
                        }
                        
                    }
                }
            }
            .debugFrame(.blue)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addItem()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.showSettingsView.toggle()
                    } label: {
                        Image(systemName: "switch.2")
                    }
                }
            }
            .navigationTitle("Printers")
        } detail: {
            Text("Select an item")
        }
        .sheet(isPresented: $showSettingsView) {
            SettingsView()
        }
        
    }
    
    private func addItem() {
        withAnimation {
            let newConnection = PrinterConnection(
                name: "New Item",
                ipAddress: "192.168.1.1",
                apiKey: "abc123"
            )
            modelContext.insert(newConnection)
        }
    }
    
}

#Preview {
    PrinterListView()
        .modelContainer(for: PrinterConnection.self, inMemory: true)
}
