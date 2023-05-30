//
//  SignUpScreen.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/25.
//

import SwiftUI

struct SignUpScreen: View {
    @ObservedObject var viewModel: SignUpViewModel
    @Binding var path: NavigationPath
    @Environment(\.presentationMode) var presentation
    
    init(path: Binding<NavigationPath>) {
        self.viewModel = SignUpViewModel()
        self._path = path
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Text("회원가입")
                .sizeCustomJUA(30)
                .foregroundColor(.basic)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 32)
                .padding(.bottom, 24)
            
            TextField("", text: $viewModel.user.account)
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                    .placeholder(when: viewModel.user.account.isEmpty) {
                        Text("이메일 아이디")
                            .foregroundColor(.myGray.opacity(0.5))
                    }
                    .frame(height: 63)
                    .size18Regular()
                    .padding(.leading, 20)
                    .background(Rectangle().fill(Color.myWhite).cornerRadius(10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(viewModel.isEmailValid() ? Color.basic : Color.myGray.opacity(0.5), lineWidth: 1)
                            
                    }
                    .padding(.bottom, 8)
                    .padding(.horizontal, 28)
            
            SecureField("", text: $viewModel.password)
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                    .placeholder(when: viewModel.password.isEmpty) {
                        Text("비밀번호")
                            .foregroundColor(.myGray.opacity(0.5))
                    }
                    .frame(height: 63)
                    .size18Regular()
                    .padding(.leading, 20)
                    .background(Rectangle().fill(Color.myWhite).cornerRadius(10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(viewModel.isPasswordEqual() ? Color.basic : Color.myGray.opacity(0.5), lineWidth: 1)
                            
                    }
                    .padding(.bottom, 8)
                    .padding(.horizontal, 28)
            
            SecureField("", text: $viewModel.checkPassword)
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                    .placeholder(when: viewModel.checkPassword.isEmpty) {
                        Text("비밀번호 확인")
                            .foregroundColor(.myGray.opacity(0.5))
                    }
                    .frame(height: 63)
                    .size18Regular()
                    .padding(.leading, 20)
                    .background(Rectangle().fill(Color.myWhite).cornerRadius(10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(viewModel.isPasswordEqual() ? Color.basic : Color.myGray.opacity(0.5), lineWidth: 1)
                            
                    }
                    .padding(.bottom, 8)
                    .padding(.horizontal, 28)
            
            TextField("", text: $viewModel.user.name)
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                    .placeholder(when: viewModel.user.name.isEmpty) {
                        Text("이름")
                            .foregroundColor(.myGray.opacity(0.5))
                    }
                    .frame(height: 63)
                    .size18Regular()
                    .padding(.leading, 20)
                    .background(Rectangle().fill(Color.myWhite).cornerRadius(10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(!viewModel.user.name.isEmpty ? Color.basic : Color.myGray.opacity(0.5), lineWidth: 1)
                            
                    }
                    .padding(.bottom, 8)
                    .padding(.horizontal, 28)
            
            ZStack(alignment: .top) {
                VStack(spacing: 0) {
                    PhoneNumberFormatter(placeholder: "", text: $viewModel.user.phone)
                        .placeholder(when: viewModel.user.phone.isEmpty) {
                            Text("휴대폰 번호")
                                .foregroundColor(.myGray.opacity(0.5))
                        }
                        .frame(height: 63)
                        .size18Regular()
                        .padding(.leading, 23)
                        .background(Rectangle().fill(Color.myWhite).cornerRadius(10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(viewModel.isPhoneValid() ? Color.basic : .myGray.opacity(0.5), lineWidth: 1)
                            
                        }
                        .padding(.horizontal, 28)
                        .padding(.bottom, 55)
                    
                    if viewModel.isSignUpValid() {
                        Button(action: {
                            viewModel.setInfo()
                            viewModel.signUp()
                            path.append(viewModel.user)
                            
                        }) {
                            HStack(spacing: 0) {
                                Spacer()
                                Text("이메일 인증")
                                    .size18Regular()
                                    .foregroundColor(.basic)
                                Spacer()
                            }
                        }
                        .frame(height: 63)
                        .background(Color.myWhite)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.basic, lineWidth: 1)
                        }
                        .padding(.horizontal, 28)
                        
                    } else {
                        HStack(spacing: 0) {
                            Spacer()
                            Text("이메일 인증")
                            Spacer()
                        }
                            .size18Regular()
                            .frame(height: 63)
                            .foregroundColor(.myGray.opacity(0.5))
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.myWhite))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.myGray.opacity(0.5), lineWidth: 1)
                                
                            }
                            .padding(.horizontal, 28)
                        
                    }
                }
                .padding(.top, 71)

                DropdownMenu(selectedOption: $viewModel.location, placeholder: "자주 주문하는 장소", options: DropdownMenuOption.locations)
                
            }
            Spacer()
        }
        .onAppear() {
            viewModel.resetInfo()
        }
        .navigationDestination(for: SignUpRequest.self) { _ in
            VerifyCodeScreen(user: viewModel.user, path: $path)
        }
        .customToolBar("", showCartButton: false, showInfoButton: false)
    }
}

