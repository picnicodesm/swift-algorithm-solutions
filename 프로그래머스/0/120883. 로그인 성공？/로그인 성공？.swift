import Foundation

func solution(_ id_pw:[String], _ db:[[String]]) -> String {
    enum State {
        case success, fail, wrongPw
    }
    
    var state: State = .fail
    
    for item in db {
        if id_pw[0] == item[0] { 
            state = .wrongPw
            if id_pw[1] == item[1] {
                state = .success
            }
        }
    }
    
    return state == .success ? "login" : state == .wrongPw ? "wrong pw" : "fail"
}