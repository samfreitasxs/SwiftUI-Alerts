//
//  ContentView.swift
//  Alerts
//
//  Created by Samuel Freitas on 28/10/24.
//
import SwiftUI

struct ContentView: View {
    @State private var isShowingBasicAlert = false
    @State private var isShowingEnterValueAlert = false
    @State private var isShowingLoginAlert = false
    @State private var error: MyappError = .noNetwork
    
    @State private var valueString = ""
    
    var body: some View {
    VStack (spacing: 40) {
        Button("Fetch Data") {
            // Network call Tails
            isShowingBasicAlert = true
        }
        .alert("No Network", isPresented: $isShowingBasicAlert) {
            Button (" Try Again") {
                //Do try again code
            }
            
            Button ("Delete", role: .destructive){
                //Do delete code
            }
            Button ("Cancel", role: .cancel) {  }
        } message: {
            Text("No network detected. Connect to wi-fi or cellular and try again.")
        }
        
        Button("Enter Data") {
            isShowingEnterValueAlert = true
        }
        .alert("Enter Value", isPresented: $isShowingEnterValueAlert) {
            TextField("Value",text: $valueString)
            Button ("Submit") {
                //Submit value
            }
            
            Button ("Cancel", role: .cancel){
                
            }
        } message: {
            Text( "Enter the dollar value of your item. ")
        }
        
        Button("Log In") {
            error = .invalidPassword
            isShowingLoginAlert = true
           }
        .alert(isPresented: $isShowingLoginAlert, error: error) { error in
            if error == .invalidUserName {
                TextField("Username", text: $valueString )
                
                Button("Submit") {
                }
                
                Button ("Cancel", role: .cancel) {
                    
                }
            }
                
        } message: { error in
            Text ( error.failureReason)
            }
        }
    }
}
#Preview {
    ContentView()
}


enum MyappError: LocalizedError {
    case invalidUserName
    case invalidPassword
    case noNetwork
    
    var errorDescription: String? {
        switch self {
        case.invalidUserName:
            "Invalid Username"
        case.invalidPassword:
            "Invalid Password"
        case.noNetwork:
            "Connection "
        }
    }
    
    var failureReason: String {
        switch self {
        case.invalidUserName:
            "The username entered does not exist in our database."
        case.invalidPassword:
            "The password entered for usernamen is incorrect."
        case.noNetwork:
            "Unable to detect a network connection. Please connect to wi-fi or cellular and try again."
        }
    }
}
