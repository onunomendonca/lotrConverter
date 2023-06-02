//
//  ExchangeRate.swift
//  LOTR Converter
//
//  Created by Nuno Mendonça on 31/05/2023.
//

import SwiftUI

struct ExchangeRate: View {

    @State var leftImage: String
    @State var text: String
    @State var rightImage: String

    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
                
            Text(text)
                
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

struct ExchangeRate_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRate(leftImage: "goldpenny", text: "1 Gold Penny = 4 Silver Pieces", rightImage: "silverpiece")
            .previewLayout(.sizeThatFits)
    }
}
