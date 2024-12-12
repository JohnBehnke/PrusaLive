//
//  PrinterType.swift
//  PrusaLive
//
//  Created by John Behnke on 12/12/24.
//

enum PrinterType: String, CaseIterable, Codable {
    case mk4
    case mk4s
    case mk39s
    case mk35s
    case mk3
    case mk3s
    case mk3splus
    case mk25
    case mk25s
    case mini
    case miniplus
    case xl
    
    var formattedName: String {
        switch self {
        case .mk4: return "MK4"
        case .mk4s: return "MK4S"
        case .mk39s: return "MK3.9S"
        case .mk35s: return "MK3.5S"
        case .mk3: return "MK3"
        case .mk3s: return "MK3S"
        case .mk3splus: return "MK3S+"
        case .mk25: return "MK2.5"
        case .mk25s: return "MK2.5S"
        case .mini: return "Mini"
        case .miniplus: return "Mini+"
        case .xl: return "XL"
        }
    }
}
