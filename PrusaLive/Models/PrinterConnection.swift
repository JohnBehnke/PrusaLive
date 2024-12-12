//
//  PrinterConnection.swift
//  PrusaLive
//
//  Created by John Behnke on 12/12/24.
//

import Foundation
import SwiftData

@Model
final class PrinterConnection: Identifiable {
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
