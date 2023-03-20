//
//  SignUpError.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/02/16.
//

import Foundation

enum SignUpError {
    case accountOverlapValidError
    case accountOverlapCheckError
    case emailValidError
    case passwordValidError
    case passwordEqualityError
    case hold
    //대기 상태.
    case none
    //오류 없음.
}
