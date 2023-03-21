//
//  CartEditScreen.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/01/15.
//

import SwiftUI

struct CartEditScreen: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var viewModel: CartViewModel
    let index: Int
    
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Image(viewModel.carts[index].beverage.image)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .scaledToFit()
                        .padding(.leading, 8)
                    VStack(spacing: 0) {
                        Text(viewModel.carts[index].beverage.name)
                            .size19Bold()
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(.bottom, 8)
                        Text(viewModel.carts[index].beverage.desc)
                            .frame(maxWidth: .infinity, minHeight: 70 , alignment: .topLeading)
                        Text("\(viewModel.carts[index].beverage.price)₩")
                            .size19Bold()
                            .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                            .padding(.top, 10)
                    }
                    .padding(.horizontal, 8)

                }
                .padding(.bottom, 11)
                Divider()
                    .padding(.horizontal, 8)
                    .padding(.bottom, 0)
                    
            }
            
            Text("Options")
                .frame(maxWidth: .infinity, alignment: .leading)
                .size19Regular()
                .padding(.leading, 16)
                .padding(.top, 8)
                
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text(viewModel.carts[index].shot.name)
                        .frame(width: 100)
                        .size16Regular()
                        .padding(.leading, 8)
                    HStack(spacing: 0) {
                        if viewModel.carts[index].shot.amount != 0 {
                            Text("+\(viewModel.carts[index].shot.price * viewModel.carts[index].shot.amount)₩")
                                .size16Regular()
                        }
                    }.frame(width: 170, height: 50)
                    
                    HStack(spacing: 0) {
                        if(viewModel.carts[index].shot.amount >= 3) {
                            Image(systemName: "plus.square")
                                .size20Regular()
                                .foregroundColor(.gray)
                        } else {
                            Image(systemName: "plus.square")
                                .size20Regular()
                                .foregroundColor(.black)
                                .onTapGesture {
                                    viewModel.addOptionAmount(option: &viewModel.carts[index].shot)
                                    viewModel.carts[index].totalPrice += 500
                                    viewModel.getCartTotalPrice()
                                }
                        }
                    }
                    .frame(width: 20)
                            
                    
                    Text("\(viewModel.carts[index].shot.amount)")
                        .frame(width: 30)
                    
                    HStack(spacing: 0) {
                        if(viewModel.carts[index].shot.amount == 0) {
                            Image(systemName: "minus.square")
                                .size20Regular()
                                .foregroundColor(.gray)
                        } else {
                            Image(systemName: "minus.square")
                                .size20Regular()
                                .foregroundColor(.black)
                                .onTapGesture {
                                    viewModel.subOptionAmount(option: &viewModel.carts[index].shot)
                                    viewModel.carts[index].totalPrice -= 500
                                    viewModel.getCartTotalPrice()
                                }
                        }
                    }
                    .frame(width: 20)
                    .padding(.trailing, 8)
                }

                HStack(spacing: 0) {
                    Text(viewModel.carts[index].cream.name)
                        .frame(width: 100)
                        .size16Regular()
                        .padding(.leading, 8)
                    HStack(spacing: 0) {
                        if viewModel.carts[index].cream.amount != 0 {
                            Text("+\(viewModel.carts[index].cream.price * viewModel.carts[index].cream.amount)₩")
                                .size16Regular()
                        }
                    }.frame(width: 170, height: 50)
                    
                    HStack(spacing: 0) {
                        if(viewModel.carts[index].cream.amount >= 2) {
                            Image(systemName: "plus.square")
                                .size20Regular()
                                .foregroundColor(.gray)
                        } else {
                            Image(systemName: "plus.square")
                                .size20Regular()
                                .foregroundColor(.black)
                                .onTapGesture {
                                    viewModel.addOptionAmount(option: &viewModel.carts[index].cream)
                                    viewModel.carts[index].totalPrice += 500
                                    viewModel.getCartTotalPrice()
                                }
                        }
                    }
                    .frame(width: 20)
                            
                    
                    Text("\(viewModel.carts[index].cream.amount)")
                        .frame(width: 30)
                    
                    HStack(spacing: 0) {
                        if(viewModel.carts[index].cream.amount == 0) {
                            Image(systemName: "minus.square")
                                .size20Regular()
                                .foregroundColor(.gray)
                        } else {
                            Image(systemName: "minus.square")
                                .size20Regular()
                                .foregroundColor(.black)
                                .onTapGesture {
                                    viewModel.subOptionAmount(option: &viewModel.carts[index].cream)
                                    viewModel.carts[index].totalPrice -= 500
                                    viewModel.getCartTotalPrice()
                                }
                        }
                    }
                    .frame(width: 20)
                    .padding(.trailing, 8)
                }
                
                HStack(spacing: 0) {
                    Text(viewModel.carts[index].sizeUp.name)
                        .frame(width: 100)
                        .size16Regular()
                        .padding(.leading, 8)
                    HStack(spacing: 0) {
                        if viewModel.carts[index].sizeUp.amount != 0 {
                            Text("+\(viewModel.carts[index].sizeUp.price * viewModel.carts[index].sizeUp.amount)₩")
                                .size16Regular()
                        }
                    }.frame(width: 170, height: 50)
                    
                    HStack(spacing: 0) {
                        if(viewModel.carts[index].sizeUp.amount >= 1) {
                            Image(systemName: "plus.square")
                                .size20Regular()
                                .foregroundColor(.gray)
                        } else {
                            Image(systemName: "plus.square")
                                .size20Regular()
                                .foregroundColor(.black)
                                .onTapGesture {
                                    viewModel.addOptionAmount(option: &viewModel.carts[index].sizeUp)
                                    viewModel.carts[index].totalPrice += 1000
                                    viewModel.getCartTotalPrice()
                                }
                        }
                    }
                    .frame(width: 20)
                            
                    
                    Text("\(viewModel.carts[index].sizeUp.amount)")
                        .frame(width: 30)
                    
                    HStack(spacing: 0) {
                        if(viewModel.carts[index].sizeUp.amount == 0) {
                            Image(systemName: "minus.square")
                                .size20Regular()
                                .foregroundColor(.gray)
                        } else {
                            Image(systemName: "minus.square")
                                .size20Regular()
                                .foregroundColor(.black)
                                .onTapGesture {
                                    viewModel.subOptionAmount(option: &viewModel.carts[index].sizeUp)
                                    viewModel.carts[index].totalPrice -= 1000
                                    viewModel.getCartTotalPrice()
                                }
                        }
                    }
                    .frame(width: 20)
                    .padding(.trailing, 8)
                }
            }
            
            Spacer()
            
            Text("Total : \(viewModel.carts[index].totalPrice)₩")
                .size19Bold()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom, 30)
                .padding(.trailing, 16)
            
            //viewModel.carts[index]의 값을 수정해도 insert 시 수정되지 않은 값으로 최초 입력되는 현상?
            let newCart: Cart = Cart(id: UUID(), beverage: viewModel.carts[index].beverage, shot: viewModel.carts[index].shot, cream: viewModel.carts[index].cream, sizeUp: viewModel.carts[index].sizeUp, totalPrice: viewModel.carts[index].totalPrice)
            
            Button(action: {
                viewModel.carts[index] = newCart
                //viewModel.carts[index] = viewModel.carts[index] //위 코드의 경우 동작하고 아래의 경우 동작하지 않음
                self.presentation.wrappedValue.dismiss()    //option 모두 고른 menu를 cart에 넣고 직전 화면으로 돌아감.
                
            }) {
                Text("수정하기")
                    .frame(width: 227, height: 50)
                    .size20Regular()
                    .foregroundColor(Color.white)
                    .background(Capsule().fill(Color.black))
                    .padding(.bottom, 20)
            }
        }
        
        .navigationTitle("Edit")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar{ ToolBarBackButton(presentation: presentation) }
    }
}


