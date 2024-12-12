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
    var apiKey: String
    
    
    init(name: String, ipAddress: String, apiKey: String) {
        self.name = name
        self.ipAddress = ipAddress
        self.apiKey = apiKey
    }
}
