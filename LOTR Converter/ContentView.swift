//
//  ContentView.swift
//  LOTR Converter
//
//  Created by Nuno Mendonça on 31/05/2023.
//

import SwiftUI

struct ContentView: View {

    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var leftCurrency: Currency = {

        do {
            return try UserDefaults.standard.getObject(forKey: IconGridSide.left.rawValue, castTo: Currency.self)
            
        } catch {

            return Currency(value: .goldPenny, text: .goldPenny, image: .goldPenny)
        }
    }()
    @State var rightCurrency: Currency = {

        do {
            return try UserDefaults.standard.getObject(forKey: IconGridSide.right.rawValue, castTo: Currency.self)
            
        } catch {

            return Currency(value: .silverPenny, text: .silverPenny, image: .silverPenny)
        }
    }()

    @State var showExchangeInfo = false
    
    var body: some View {
        ZStack {

            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)

            VStack {

                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)

                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)

                HStack {

                    ConversionSection(side: .left,
                                      leftCurrency: $leftCurrency,
                                      rightCurrency: $rightCurrency,
                                      leftAmount: $leftAmount,
                                      rightAmount: $rightAmount)

                    // Equal
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)

                    ConversionSection(side: .right,
                                      leftCurrency: $leftCurrency,
                                      rightCurrency: $rightCurrency,
                                      leftAmount: $leftAmount,
                                      rightAmount: $rightAmount)
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(50)
                
                Spacer()
                
                // Info
                HStack {
                    Spacer()
                    Button {
                        //Display exchange sheet
                        showExchangeInfo.toggle()
                        
                    } label: {
                        
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                }
                .padding(.trailing)
                .sheet(isPresented: $showExchangeInfo) {
                    ExchangeInfo()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
