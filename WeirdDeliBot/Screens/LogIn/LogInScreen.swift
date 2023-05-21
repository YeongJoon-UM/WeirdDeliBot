//
//  LogInScreen.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2022/10/05.
//

import SwiftUI

struct LogInScreen: View {
    @ObservedObject var viewModel: LogInViewModel = LogInViewModel()
    @EnvironmentObject var rootViewModel: RootViewModel

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Spacer()
                Image("Logo") //임시 로고
                    .imageSize(100)
                    .padding(.bottom, 16)
                Text("이상한 배달봇")
                    .sizeCustomJUA(30)
                    .foregroundColor(.basic)
                    .padding(.bottom, 22)

                HStack(spacing: 0) {
                    if viewModel.isLogInFailed {
                        Image(systemName: "exclamationmark.triangle")
                            .imageSize(15)
                        Text("회원이 아니시거나,\n아이디 또는 비밀번호를 잘못 입력했습니다.")
                            .size11Regular()
                    }
                }
                .foregroundColor(.myRed)
                .frame(height: 27)
                .padding(.bottom, 16)
                
                
                    
                    
                    
                TextField("아이디", text: $viewModel.account)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                        .placeholder(when: viewModel.account.isEmpty) {
                            Text("아이디")
                                .foregroundColor(.myGray.opacity(0.5))
                        }
                        .frame(height: 63)
                        .size18Regular()
                        .padding(.leading, 32)
                        .background(Rectangle().fill(Color.myWhite).cornerRadius(10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.myGray.opacity(0.5), lineWidth: 1)
                                
                        }
                        .padding(.bottom, 16)
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
                        .padding(.leading, 32)
                        .background(Rectangle().fill(Color.myWhite).cornerRadius(10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.myGray.opacity(0.5), lineWidth: 1)
                                
                        }
                        .padding(.bottom, 24)
                        .padding(.horizontal, 28)
                
                
                        //isInfoNotEmpty가 True일 때만 작동.
                Group {  //Extra argument in call Error 해결을 위한 Grouping
                    if viewModel.isInfoNotEmpty {
                        CustomButton(action: {viewModel.logIn()}, text: "로그인", textColor: .myWhite, height: 63, backgroundColor: .basic)
                            .padding(.bottom, 16)
                    } else {
                        HStack(spacing: 0) {
                            Spacer()
                            Text("로그인")
                            Spacer()
                        }
                            .size18Regular()
                            .frame(height: 63)
                            .foregroundColor(.myWhite)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.myGray.opacity(0.5)))
                            .padding(.horizontal, 28)
                            .padding(.bottom, 16)
                    }
                    
                    NavigationLink(destination: EmptyView()) {
                        HStack(spacing: 0) {
                            Spacer()
                            Text("회원가입")
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
                    .padding(.bottom, 60)
                    
                    NavigationLink(destination: EmptyView()) {
                        Text("비밀번호를 잊으셨나요?")
                            .size18Regular()
                            .foregroundColor(.basic)
                    }
                    
                }
                .onChange(of: self.viewModel.token) { token in
                    if (token != nil) {
                        self.rootViewModel.setToken(token: token!, isSave: viewModel.isAutoLogIn)
                    }
                }

                Spacer()
            }
        }
    }
}


struct LogInScreen_Previews: PreviewProvider {
    static var previews: some View {
        LogInScreen()
    }
}
