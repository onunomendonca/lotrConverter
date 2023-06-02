//
//  SelectCurrency.swift
//  LOTR Converter
//
//  Created by Nuno Mendonça on 31/05/2023.
//

import SwiftUI

struct SelectCurrency: View {
    
    // Com @binding estas variaveis vao estar associadas Às variaveis do ecra anterior.
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image("parchment")
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                //Currencies
                IconGrid(currency: $leftCurrency, side: .left)
                
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                // currencies
                IconGrid(currency: $rightCurrency, side: .right)
                
                
                Button("Done") {
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(15)
            }
        }
    }
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrency(leftCurrency: .constant(Currency(value: .silverPiece, text: .silverPiece, image: .silverPiece)), rightCurrency: .constant(Currency(value: .goldPenny, text: .goldPenny, image: .goldPenny)))
    }
}
