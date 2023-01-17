//
//  CartRow.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/01/02.
//

import SwiftUI

struct CartRow: View {
    var cart: Cart
    @State var isOptionShow: Bool = false
    
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 0) {
                Image(cart.beverage.image)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .scaledToFit()
                
                Text(cart.beverage.name)
                    .size19Bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8)
                
                if isOptionShow {
                    Text("\(cart.beverage.price)₩")
                        .size19Regular()
                        .frame(maxWidth: .infinity, alignment: .trailing)
                } else {
                    Text("\(cart.totalPrice)₩")
                        .size19Bold()
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            if cart.beverage.price != cart.totalPrice {
                if isOptionShow {
                    VStack(spacing: 0) {
                        if cart.shot.amount != 0 {
                            HStack(spacing: 0) {
                                Text(cart.shot.name)
                                    .size19Regular()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("\(cart.shot.amount)")
                                    .size19Regular()
                                    .frame(maxWidth: .infinity, alignment: .center)
                                
                                Text("\(cart.shot.price * cart.shot.amount)₩")
                                    .size19Regular()
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                        if cart.cream.amount != 0 {
                            HStack(spacing: 0) {
                                Text(cart.cream.name)
                                    .size19Regular()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("\(cart.cream.amount)")
                                    .size19Regular()
                                    .frame(maxWidth: .infinity, alignment: .center)
                                
                                Text("\(cart.cream.price * cart.cream.amount)₩")
                                    .size19Regular()
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                        if cart.sizeUp.amount != 0 {
                            HStack(spacing: 0) {
                                Text(cart.sizeUp.name)
                                    .size19Regular()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("\(cart.sizeUp.price * cart.sizeUp.amount)₩")
                                    .size19Regular()
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                        
                        HStack(spacing: 0) {
                            Text("Total")
                                .size19Bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("\(cart.totalPrice)₩")
                                .size19Bold()
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }.padding(.top, 8)
                    }
                    .padding(.top, 8)
                }
                Button(action: { isOptionShow.toggle() }) {
                    if isOptionShow {
                        Image(systemName: "chevron.up")
                    } else {
                        Image(systemName: "chevron.down")
                    }
                }
                .buttonStyle(.plain)
                .frame(width: 12, height: 12)
            } 
        }
    }
}
