//
//  PrinterListView.swift
//  PrusaLive
//
//  Created by John Behnke on 12/12/24.
//

import SwiftUI
import SwiftData

struct PrinterListView: View {
    @State private var showSettingsView: Bool = false
    @State private var showAddPrinterConnectionView: Bool = false
    @Environment(\.modelContext) private var modelContext
    @Query private var printerConnections: [PrinterConnection]
    
    var body: some View {
        NavigationSplitView {
            Group {
                if printerConnections.isEmpty {
                    
                        ContentUnavailableView {
                            // 1
                            Label("No Printers", systemImage: "questionmark.square")
                            
                        } description: {
                            Text("Add a printer connection via PrusaLink")
                        } actions: {
                            // 2
                            Button {
                                addPrinter()
                            } label: {
                                Text("Add Printer")
                                    .padding()
                                    .bold()
                                    .foregroundStyle(.white)
                            }
                            .padding(.horizontal, 50)

                            .background(
                                RoundedRectangle(
                                    cornerRadius: 20,
                                    style: .continuous
                                )
                                .fill(Color.orange.gradient)

                                
                            )
                        }
                        .padding(.bottom, 50)
                            
                    
                } else {
                    List {
                        Section("Online") {
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
                        Section("Offline") {
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
            }
            .toolbar {
                if !printerConnections.isEmpty {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            addPrinter()
                        } label: {
                            Image(systemName: "plus")
                        }
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
        .sheet(isPresented: $showAddPrinterConnectionView) {
            AddPrinterConnectionView()
        }
        
    }
    
    private func addPrinter() {
        showAddPrinterConnectionView.toggle()
    }
    
}

#Preview("Empty View") {
    PrinterListView()
        .modelContainer(for: PrinterConnection.self, inMemory: true)
}


#Preview("Sample Data View") {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(
        for: PrinterConnection.self,
        configurations: config
    )
    
    
    
    for sampleConnection in PrinterConnection.samplePrinterConnections {
        container.mainContext.insert(sampleConnection)
    }
    
    return PrinterListView()
        .modelContainer(container)
}
