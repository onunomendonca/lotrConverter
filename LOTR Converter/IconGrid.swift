//
//  IconGrid.swift
//  LOTR Converter
//
//  Created by Nuno Mendonça on 31/05/2023.
//

import SwiftUI

enum IconGridSide: String {
    
    case left
    case right
}

struct IconGrid: View {
    
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    @Binding var currency: Currency
    let side: IconGridSide
    
    var body: some View {
        LazyVGrid(columns: gridLayout) {

            ForEach(0..<6) { i in

                if CurrencyValue.allCases[i] == self.currency.value {

                    CurrencyIcon(currencyImage: self.currency.image.rawValue,
                                 currencyText: self.currency.text.rawValue)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                        .stroke(lineWidth: 3)
                        .opacity(0.5))
                        .shadow(color: .black, radius: 9)
                } else {
                    
                    let newCurrency = CurrencyValue.allCases[i].create()
                    
                    CurrencyIcon(currencyImage: newCurrency.image.rawValue,
                                 currencyText: newCurrency.text.rawValue)
                    .onTapGesture {
                        
                        self.currency = newCurrency
                        
                        let userDefaults = UserDefaults.standard
                        do {
                            try userDefaults.setObject(newCurrency, forKey: side.rawValue)
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        }
        .padding([.bottom, .trailing, .leading])
    }
}

struct IconGrid_Previews: PreviewProvider {
    static var previews: some View {
        IconGrid(currency: .constant(Currency(value: .copperPenny, text: .copperPenny, image: .copperPenny)), side: .left)
            .previewLayout(.sizeThatFits)
    }
}
