//
//  AddPrinterConnectionView.swift
//  PrusaLive
//
//  Created by John Behnke on 12/12/24.
//

import SwiftUI

struct AddPrinterConnectionView: View {
    
    @State private var pritnerName: String = ""
    @State private var printerIP: String = ""
    @State private var printerUsername: String = ""
    @State private var printerAPIKey: String = ""
    @State private var printerType: PrinterType = .mini
    

    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        Form {
            Section("Name"){
                TextField("My Printer", text: $pritnerName)
            }
            
            Section("IP Address") {
                TextField("192.168.1.1", text: $printerIP).textContentType(.URL)
            }
            
            Section("Username") {
                TextField("maker", text: $printerUsername)
            }
            
            Section("API Key") {
                SecureField("onlyiamaprusa", text: $printerAPIKey)
            }
            Section("Type") {
                Picker("", selection: $printerType) {
                    ForEach(PrinterType.allCases, id: \.self) {
                        Text($0.formattedName)
                    }
                }
            }
            Section {
                Button {
                    
                } label: {
                    HStack(alignment: .center) {
                        Spacer()
                        Text("Add Printer")
                            .bold()
                            .foregroundStyle(.white)
                            .disabled(isAddButtonDisabled)
                        Spacer()
                        
                    }
                }
            }
            .listRowBackground(Color.orange.opacity(isAddButtonDisabled ? 0.5 : 1))
            
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
        .navigationTitle("Add Printer")
    }
    
    var isAddButtonDisabled: Bool {
        pritnerName.isEmpty  || printerIP.isEmpty || printerUsername.isEmpty || printerAPIKey.isEmpty
    }
}

#Preview {
    AddPrinterConnectionView()
}
