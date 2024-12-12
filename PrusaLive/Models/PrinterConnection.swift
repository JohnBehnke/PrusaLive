//
//  PrinterConnection.swift
//  PrusaLive
//
//  Created by John Behnke on 12/12/24.
//

import Foundation
import SwiftData

@Model
class PrinterConnection: Identifiable {
    var id: UUID = UUID()
    var name: String
    var ipAddress: String
    var username: String
    var apiKey: String
    var type: PrinterType
    
    init(name: String, ipAddress: String, username: String, apiKey: String, type: PrinterType) {
        self.name = name
        self.ipAddress = ipAddress
        self.username = username
        self.apiKey = apiKey
        self.type = type
    }
}

extension PrinterConnection {
    static var samplePrinterConnections: [PrinterConnection] {
        [
            PrinterConnection(
                name: "Mini Me",
                ipAddress: "192.168.1.1",
                username: "prusa3d1",
                apiKey: "prusa3d11",
                type: .mini
            ),
            PrinterConnection(
                name: "The Big Boy",
                ipAddress: "192.168.1.2",
                username: "prusa3d2",
                apiKey: "prusa3d22",
                type: .xl
            ),
            PrinterConnection(
                name: "The 4S",
                ipAddress: "192.168.1.3",
                username: "prusa3d4",
                apiKey: "prusa3d33",
                type: .mk4s
            ),
            PrinterConnection(
                name: "Oldy But Goody",
                ipAddress: "192.168.1.4",
                username: "prusa3d4",
                apiKey: "prusa3d44",
                type: .mk25s
            )
        ]
    }
}
