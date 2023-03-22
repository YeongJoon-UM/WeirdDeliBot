//
//  LogInScreen.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//

import SwiftUI

struct LogInScreen: View {
    @ObservedObject var viewModel: LogInViewModel = LogInViewModel()
    @EnvironmentObject var rootViewModel: RootViewModel

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                HStack {
                    Image(systemName: "circle.fill") //임시 로고
                            .sizeCustom(30)
                            .padding([.trailing], 7)
                    Text("DazzleBot")
                            .size18Bold()
                }


                HStack {
                    if viewModel.isLogInFailed {
                        Image(systemName: "exclamationmark.triangle")
                        Text("회원이 아니시거나, 아이디 또는 비밀번호를 잘못 입력했습니다.")
                    }
                }
                        .size11Regular()
                        .foregroundColor(.main)
                        .frame(height: 35)
                        .padding(.horizontal, 80)
                        .padding(.top, 37)


                Text("로그인")
                        .size14Regular()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 24, leading: 82, bottom: 0, trailing: 0))

                TextField("아이디", text: $viewModel.account)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                        .frame(width: 227, height: 30)
                        .size12Regular()
                        .padding([.leading], 10)
                        .background(Capsule().fill(Color.base))


                SecureField("비밀번호", text: $viewModel.password)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                        .frame(width: 227, height: 30)
                        .size12Regular()
                        .padding([.leading], 10)
                        .background(Capsule().fill(Color.base))
                /*
                HStack {
                    ZStack {
                        Capsule()
                                .frame(width: 24, height: 12)
                                .foregroundColor(Color(viewModel.isAutoLogIn ? UIColor(.main) : UIColor(.base)))
                        ZStack {
                            Circle()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(.textSub)
                        }
                                .offset(x: viewModel.isAutoLogIn ? 6 : -6)
                                .animation(.spring())
                    }
                            .onTapGesture {
                                self.viewModel.isAutoLogIn.toggle()
                            }

                    Text("자동 로그인")
                            .size11Regular()
                            .foregroundColor(Color(viewModel.isAutoLogIn ? UIColor(.main) : UIColor(.textMain)))

                }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 7, leading: 85, bottom: 51, trailing: 0))
                        .onChange(of: self.viewModel.token) { token in
                            if (token != nil) {
                                self.rootViewModel.setToken(token: token!, isSave: viewModel.isAutoLogIn)
                            }
                        }
                */
                //isInfoNotEmpty가 True일 때만 작동.
                Group {  //Extra argument in call Error 해결을 위한 Grouping
                    if viewModel.isInfoNotEmpty {
                        Button(action: {
                            viewModel.logIn()
                        }) {
                            Text("로그인")          //button이 아닌 label에 frame을 줘서 버튼 클릭 범위를 늘림
                                .frame(width: 227, height: 40)
                                .size14Regular()
                                .foregroundColor(.textSub)
                                .background(Capsule().fill(Color.main))
                                .padding([.bottom], 7)
                        }
                        .padding(.top, 50)
                    } else {
                        Text("로그인")
                            .frame(width: 227, height: 40)
                            .size14Regular()
                            .foregroundColor(.textSub)
                            .background(Capsule().fill(Color.sub))
                            .padding(.top, 50)
                            .padding([.bottom], 7)
                    }
                    

                    NavigationLink(destination:
                                    //SignUpScreen().environmentObject(viewModel)
                    EmptyView()) {
                        Text("회원가입")      //button이 아닌 label에 frame을 줘서 버튼 클릭 범위를 늘림
                                .frame(width: 227, height: 40)
                                .size14Regular()
                                .foregroundColor(.main)
                                .background(Capsule().stroke(Color.main))
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
