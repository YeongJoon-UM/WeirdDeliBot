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
                    .font(.system(size: 19))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if isOptionShow {
                    Text("\(cart.beverage.price)₩")
                        .font(Font.system(size: 19))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                } else {
                    Text("\(cart.totalPrice)₩")
                        .font(Font.system(size: 19))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            if cart.beverage.price != cart.totalPrice {
                if isOptionShow {
                    if cart.shot.amount != 0 {
                        HStack {
                            Text(cart.shot.name)
                                .font(.system(size: 19))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("\(cart.shot.amount)")
                                .font(.system(size: 19))
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                            Text("\(cart.shot.price * cart.shot.amount)₩")
                                .font(.system(size: 19))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    if cart.cream.amount != 0 {
                        HStack {
                            Text(cart.cream.name)
                                .font(.system(size: 19))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("\(cart.cream.amount)")
                                .font(.system(size: 19))
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                            Text("\(cart.cream.price * cart.cream.amount)₩")
                                .font(.system(size: 19))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    if cart.sizeUp.amount != 0 {
                        HStack {
                            Text(cart.sizeUp.name)
                                .font(.system(size: 19))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("\(cart.sizeUp.price * cart.sizeUp.amount)₩")
                                .font(.system(size: 19))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    
                    HStack {
                        Text("Total")
                            .font(.system(size: 19))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(cart.totalPrice)₩")
                            .font(.system(size: 19))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }.padding(.top, 8)
                    
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
