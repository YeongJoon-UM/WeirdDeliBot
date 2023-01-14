//
//  MenuDescRow.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//

import SwiftUI

struct MenuOptionRow : View {
   
    @StateObject var viewModel: MenuOptionViewModel
    
    var body: some View {
        VStack{
            HStack {
                Text(viewModel.shot.name)
                    .frame(width: 100)
                    .font(.system(size: 16))
                    .padding(.leading, 8)
                HStack {
                    if viewModel.shot.amount != 0 {
                        Text("+\(viewModel.shot.price * viewModel.shot.amount)₩")
                            .font(.system(size: 16))
                    }
                }.frame(width: 170, height: 50)
                
                HStack {
                    if(viewModel.shot.amount >= 3) {
                        Image(systemName: "plus.square")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                    } else {
                        Image(systemName: "plus.square")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .onTapGesture {
                                viewModel.addOptionAmount(option: &viewModel.shot)
                            }
                    }
                }
                .frame(width: 20)
                        
                
                Text("\(viewModel.shot.amount)")
                    .frame(width: 20)
                
                HStack {
                    if(viewModel.shot.amount == 0) {
                        Image(systemName: "minus.square")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                    } else {
                        Image(systemName: "minus.square")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .onTapGesture {
                                viewModel.subOptionAmount(option: &viewModel.shot)
                            }
                    }
                }
                .frame(width: 20)
                .padding(.trailing, 8)
            }

            HStack {
                Text(viewModel.cream.name)
                    .frame(width: 100)
                    .font(.system(size: 16))
                    .padding(.leading, 8)
                HStack {
                    if viewModel.cream.amount != 0 {
                        Text("+\(viewModel.cream.price * viewModel.cream.amount)₩")
                            .font(Font.system(size: 16))
                    }
                }.frame(width: 170, height: 50)
                
                HStack {
                    if(viewModel.cream.amount >= 2) {
                        Image(systemName: "plus.square")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                    } else {
                        Image(systemName: "plus.square")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .onTapGesture {
                                viewModel.addOptionAmount(option: &viewModel.cream)
                            }
                    }
                }
                .frame(width: 20)
                        
                
                Text("\(viewModel.cream.amount)")
                    .frame(width: 20)
                
                HStack {
                    if(viewModel.cream.amount == 0) {
                        Image(systemName: "minus.square")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                    } else {
                        Image(systemName: "minus.square")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .onTapGesture {
                                viewModel.subOptionAmount(option: &viewModel.cream)
                            }
                    }
                }
                .frame(width: 20)
                .padding(.trailing, 8)
            }
            
            HStack {
                Text(viewModel.sizeUp.name)
                    .frame(width: 100)
                    .font(.system(size: 16))
                    .padding(.leading, 8)
                HStack {
                    if viewModel.sizeUp.amount != 0 {
                        Text("+\(viewModel.sizeUp.price * viewModel.sizeUp.amount)₩")
                            .font(Font.system(size: 16))
                    }
                }.frame(width: 170, height: 50)
                
                HStack {
                    if(viewModel.sizeUp.amount >= 1) {
                        Image(systemName: "plus.square")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                    } else {
                        Image(systemName: "plus.square")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .onTapGesture {
                                viewModel.addOptionAmount(option: &viewModel.sizeUp)
                            }
                    }
                }
                .frame(width: 20)
                        
                
                Text("\(viewModel.sizeUp.amount)")
                    .frame(width: 20)
                
                HStack {
                    if(viewModel.sizeUp.amount == 0) {
                        Image(systemName: "minus.square")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                    } else {
                        Image(systemName: "minus.square")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .onTapGesture {
                                viewModel.subOptionAmount(option: &viewModel.sizeUp)
                            }
                    }
                }
                .frame(width: 20)
                .padding(.trailing, 8)
            }
        }
    }
}

