//
//  InsertCodeScreen.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/25.
//

import SwiftUI

struct InsertCodeScreen: View {
    @EnvironmentObject var viewModel: SignUpViewModel
    @EnvironmentObject var rootViewModel: RootViewModel
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Text("이메일 인증")
                .sizeCustomJUA(30)
                .foregroundColor(.basic)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 32)
                .padding(.bottom, 44)
            
            Text(viewModel.user.account)
                .size18Regular()
                .foregroundColor(.myBlack)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 36)
                .padding(.bottom, 29)
            
            ZStack {
                TextField("", text: $viewModel.verfityCode)
                    .onChange(of: viewModel.verfityCode) { code in
                        if code.regexMatches(codeRegex) {
                            viewModel.sendCode()
                        } else {
                            viewModel.isCodeVerified = nil
                        }
                    }
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                    .keyboardType(.decimalPad)
                    .placeholder(when: viewModel.verfityCode.isEmpty) {
                        Text("인증코드")
                            .foregroundColor(.myGray.opacity(0.5))
                    }
                    .frame(height: 63)
                    .size18Regular()
                    .padding(.leading, 20)
                if viewModel.isCodeVerified != nil {
                    let image: String = viewModel.isCodeVerified! ? "checkmark.circle" : "exclamationmark.circle"
                    Image(systemName: image)
                        .imageSize(24)
                        .foregroundColor(viewModel.isCodeVerified! ? .basic : .myRed)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 20)
                }
            }
                .background(Rectangle().fill(Color.myWhite).cornerRadius(10))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(viewModel.codeFieldColor(), lineWidth: 1)
                }
                .padding(.bottom, 12)
                .padding(.horizontal, 28)
            
            HStack(spacing: 0) {
                Image(systemName: "exclamationmark.triangle")
                    .imageSize(15)
                    .padding(.trailing, 8)
                Text("메일이 안왔다면, 스팸 메일함을 확인해주세요")
                    .size11Regular()
                Spacer()
            }
            .foregroundColor(.myRed)
            .padding(.leading, 40)
            .padding(.bottom, 70)
            
            Button(action: { viewModel.signUp() }) {
                HStack(spacing: 0) {
                    Spacer()
                    Text("인증코드 재발송")
                        .size18Regular()
                        .foregroundColor(.basic)
                    Spacer()
                }
            }
            .frame(height: 63)
            .onTapGesture {
                viewModel.signUp()
            }
            .background(Color.myWhite)
            .cornerRadius(10)
            .shadow(radius: 3)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.basic, lineWidth: 1)
            }
            .padding(.horizontal, 28)
            
            if viewModel.isCodeVerified == true {
                NavigationLink(destination: SignUpSuccessScreen()
                    .environmentObject(viewModel)
                    .environmentObject(rootViewModel)) {
                        HStack(spacing: 0) {
                            Spacer()
                            Text("회원가입")
                                .size18Regular()
                                .foregroundColor(.myWhite)
                            Spacer()
                        }
                    }
                    .frame(height: 63)
                    .background(Color.basic)
                    .cornerRadius(10)
                    .shadow(radius: 3)
                    .padding(.horizontal, 28)
                
            } else {
                HStack(spacing: 0) {
                    Spacer()
                    Text("회원가입")
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
        .customToolBar("", showCartButton: false, showInfoButton: false)
    }
}


struct InsertCodeScreen_Previews: PreviewProvider {
    static var previews: some View {
        InsertCodeScreen()
    }
}
