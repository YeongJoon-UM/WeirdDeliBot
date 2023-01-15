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
        
        VStack() {
            VStack{
                HStack {
                    Image(viewModel.carts[index].beverage.image)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .scaledToFit()
                    
                    VStack {
                        Text(viewModel.carts[index].beverage.name)
                            .font(.system(size: 19, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(.bottom, 8)
                        Text(viewModel.carts[index].beverage.desc)
                            .frame(maxWidth: .infinity, minHeight: 70 , alignment: .topLeading)
                        Text("\(viewModel.carts[index].beverage.price)₩")
                            .font(Font.system(size: 19, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                            .padding(.top, 10)
                    }

                }
                .padding(.bottom, 11)
                Divider()
                    .padding(.bottom, 0)
                    
            }
            
            Text("Options")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 19))
                .padding(.leading, 16)
                .padding(.top, 0)
                
            VStack{
                HStack {
                    Text(viewModel.carts[index].shot.name)
                        .frame(width: 100)
                        .font(.system(size: 16))
                        .padding(.leading, 8)
                    HStack {
                        if viewModel.carts[index].shot.amount != 0 {
                            Text("+\(viewModel.carts[index].shot.price * viewModel.carts[index].shot.amount)₩")
                                .font(.system(size: 16))
                        }
                    }.frame(width: 170, height: 50)
                    
                    HStack {
                        if(viewModel.carts[index].shot.amount >= 3) {
                            Image(systemName: "plus.square")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                        } else {
                            Image(systemName: "plus.square")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .onTapGesture {
                                    viewModel.addOptionAmount(option: &viewModel.carts[index].shot)
                                }
                        }
                    }
                    .frame(width: 20)
                            
                    
                    Text("\(viewModel.carts[index].shot.amount)")
                        .frame(width: 20)
                    
                    HStack {
                        if(viewModel.carts[index].shot.amount == 0) {
                            Image(systemName: "minus.square")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                        } else {
                            Image(systemName: "minus.square")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .onTapGesture {
                                    viewModel.subOptionAmount(option: &viewModel.carts[index].shot)
                                }
                        }
                    }
                    .frame(width: 20)
                    .padding(.trailing, 8)
                }

                HStack {
                    Text(viewModel.carts[index].cream.name)
                        .frame(width: 100)
                        .font(.system(size: 16))
                        .padding(.leading, 8)
                    HStack {
                        if viewModel.carts[index].cream.amount != 0 {
                            Text("+\(viewModel.carts[index].cream.price * viewModel.carts[index].cream.amount)₩")
                                .font(Font.system(size: 16))
                        }
                    }.frame(width: 170, height: 50)
                    
                    HStack {
                        if(viewModel.carts[index].cream.amount >= 2) {
                            Image(systemName: "plus.square")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                        } else {
                            Image(systemName: "plus.square")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .onTapGesture {
                                    viewModel.addOptionAmount(option: &viewModel.carts[index].cream)
                                }
                        }
                    }
                    .frame(width: 20)
                            
                    
                    Text("\(viewModel.carts[index].cream.amount)")
                        .frame(width: 20)
                    
                    HStack {
                        if(viewModel.carts[index].cream.amount == 0) {
                            Image(systemName: "minus.square")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                        } else {
                            Image(systemName: "minus.square")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .onTapGesture {
                                    viewModel.subOptionAmount(option: &viewModel.carts[index].cream)
                                }
                        }
                    }
                    .frame(width: 20)
                    .padding(.trailing, 8)
                }
                
                HStack {
                    Text(viewModel.carts[index].sizeUp.name)
                        .frame(width: 100)
                        .font(.system(size: 16))
                        .padding(.leading, 8)
                    HStack {
                        if viewModel.carts[index].sizeUp.amount != 0 {
                            Text("+\(viewModel.carts[index].sizeUp.price * viewModel.carts[index].sizeUp.amount)₩")
                                .font(Font.system(size: 16))
                        }
                    }.frame(width: 170, height: 50)
                    
                    HStack {
                        if(viewModel.carts[index].sizeUp.amount >= 1) {
                            Image(systemName: "plus.square")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                        } else {
                            Image(systemName: "plus.square")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .onTapGesture {
                                    viewModel.addOptionAmount(option: &viewModel.carts[index].sizeUp)
                                }
                        }
                    }
                    .frame(width: 20)
                            
                    
                    Text("\(viewModel.carts[index].sizeUp.amount)")
                        .frame(width: 20)
                    
                    HStack {
                        if(viewModel.carts[index].sizeUp.amount == 0) {
                            Image(systemName: "minus.square")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                        } else {
                            Image(systemName: "minus.square")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .onTapGesture {
                                    viewModel.subOptionAmount(option: &viewModel.carts[index].sizeUp)
                                }
                        }
                    }
                    .frame(width: 20)
                    .padding(.trailing, 8)
                }
            }
            
            Spacer()
            
            Text("Total : \(viewModel.cartTotalPrice)₩")
                .font(Font.system(size: 19, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom, 30)
                .padding(.trailing, 16)
            
            Button(action: {
                self.presentation.wrappedValue.dismiss()    //option 모두 고른 menu를 cart에 넣고 직전 화면으로 돌아감.
            }) {
                Text("수정하기")
                    .frame(width: 227, height: 50)
                    .font(Font.system(size: 20))
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


