//
//  ContentView.swift
//  Alerts
//
//  Created by Samuel Freitas on 28/10/24.
//
import SwiftUI

struct ContentView: View {
    @State private var isShowingBasicAlert = false
    
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
            Button ("Cancel", role: .cancel) { }
        } message: {
            Text("No network detected. Connect to wi-fi or cellular and try again.")
        }
        
        Button("Enter Data") {
            
        }
        
        Button("Log In") {
            
           }
        }
    }
}
#Preview {
    ContentView()
}
