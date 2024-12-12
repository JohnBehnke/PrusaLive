//
//  PrinterListView.swift
//  PrusaLink
//
//  Created by John Behnke on 12/12/24.
//

import SwiftUI
import SwiftData

struct PrinterListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var printerConnections: [PrinterConnection]
    
    var body: some View {
        NavigationSplitView {
            if printerConnections.isEmpty {
                ContentUnavailableView("No printers added", systemImage: "questionmark", description: Text("Add a printer connection"))
            }
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addItem()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationTitle("Printers")
        } detail: {
            Text("Select an item")
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
