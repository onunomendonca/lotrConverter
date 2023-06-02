//
//  ConversionSection.swift
//  LOTR Converter
//
//  Created by Nuno Mendonça on 01/06/2023.
//

import SwiftUI

enum ConversionSectionSide {
    
    case left
    case right
}

struct ConversionSection: View {
    
    @State var side: ConversionSectionSide
    @State var showSelectCurrency = false
    
    @State var typing = false

    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    
    @Binding var leftAmount: String
    @Binding var rightAmount: String
    
    var body: some View {
        
        let isSideLeft = side == .left
        
        let currency = isSideLeft ? leftCurrency : rightCurrency
        var amountTemp = ""
        let amount = isSideLeft ? leftAmount : rightAmount
        
        VStack {
            
            HStack {
                Image(currency.image.rawValue)
                    .resizable().scaledToFit()
                    .frame(height: 33)
                
                Text(currency.text.rawValue)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding(.bottom, -5)
            .onTapGesture {
                showSelectCurrency.toggle()
            }
            .sheet(isPresented: $showSelectCurrency) {
                SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
            }
            
            TextField("Amount", text: isSideLeft ? $leftAmount : $rightAmount) { isTyping in
                typing = isTyping
                amountTemp = amount
            }
            .padding(7)
            .background(Color(.systemGray6))
            .cornerRadius(7)
            .keyboardType(.decimalPad)
            .onChange(of: typing ? amount : amountTemp) { _ in
                
                if isSideLeft {
                    rightAmount = self.leftCurrency.value.convert(amountString: leftAmount,
                                                                       to: rightCurrency)
                } else {
                    self.leftAmount = rightCurrency.value.convert(amountString: rightAmount,
                                                                  to: leftCurrency)
                }
                
            }
            .onChange(of: currency) { _ in
                
                if isSideLeft {
                    self.leftAmount = self.rightCurrency.value.convert(amountString: rightAmount,
                                                                       to: leftCurrency)
                } else {
                    self.rightAmount = leftCurrency.value.convert(amountString: leftAmount,
                                                                  to: rightCurrency)
                }
            }
        }
    }
}

struct ConversionSection_Previews: PreviewProvider {
    static var previews: some View {
        ConversionSection(side: .left, leftCurrency: .constant(.init(value: .copperPenny, text: .copperPenny, image: .copperPenny)), rightCurrency: .constant(.init(value: .euro, text: .euro, image: .euro)), leftAmount: .constant(""), rightAmount: .constant(""))
    }
}
