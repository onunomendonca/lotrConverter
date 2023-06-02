//
//  Currency.swift
//  LOTR Converter
//
//  Created by Nuno Mendonça on 31/05/2023.
//

import Foundation

enum CurrencyValue: Double, CaseIterable, Codable {
    
    case euro = 1000
    case copperPenny = 640
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    func convert(amountString: String, to currency: Currency) -> String {

        guard let startAmount = Double(amountString) else {

            return ""
        }
        
        let convertedAmount = (startAmount / self.rawValue) * currency.value.rawValue
        
        if convertedAmount > 0 {
            
            return String(format: "%.2f", convertedAmount)
        } else {

            return "0"
        }
    }
    
    func create() -> Currency {
        
        switch self {
            
        case .copperPenny:
            return Currency(value: .copperPenny, text: .copperPenny, image: .copperPenny)
        case .euro:
            return Currency(value: .euro, text: .euro, image: .euro)
        case .silverPenny:
            return Currency(value: .silverPenny, text: .silverPenny, image: .silverPenny)
        case .silverPiece:
            return Currency(value: .silverPiece, text: .silverPiece, image: .silverPiece)
        case .goldPenny:
            return Currency(value: .goldPenny, text: .goldPenny, image: .goldPenny)
        case .goldPiece:
            return Currency(value: .goldPiece, text: .goldPiece, image: .goldPiece)
        }
    }
}

enum CurrencyText: String, CaseIterable, Codable {
    
    case euro = "Euro"
    case copperPenny = "Copper Penny"
    case silverPenny = "Silver Penny"
    case silverPiece = "Silver Piece"
    case goldPenny = "Gold Penny"
    case goldPiece = "Gold Piece"
}

enum CurrencyImage: String, CaseIterable, Codable {
    
    case euro = "euro"
    case copperPenny = "copperpenny"
    case silverPenny = "silverpenny"
    case silverPiece = "silverpiece"
    case goldPenny = "goldpenny"
    case goldPiece = "goldpiece"
}

struct Currency: Codable, Equatable {
    
    var value: CurrencyValue
    var text: CurrencyText
    var image: CurrencyImage
}
