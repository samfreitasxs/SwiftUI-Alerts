//
//  AlertsTests2.swift
//  AlertsTests2
//
//  Created by Samuel Freitas on 31/10/24.
//

import XCTest
@testable import Alerts
import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var isShowingBasicAlert = false
    @Published var isShowingEnterValueAlert = false
    @Published var isShowingLoginAlert = false
    @Published var error: MyappError = .noNetwork
    @Published var valueString = ""
}


final class ContentViewModelTests: XCTestCase {
    var viewModel: ContentViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = ContentViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testBasicAlertIsPresented() {
        viewModel.isShowingBasicAlert = true
        XCTAssertTrue(viewModel.isShowingBasicAlert, "O alerta básico deveria estar exibido.")
    }
    
    func testEnterDataAlertIsPresented() {
        viewModel.isShowingEnterValueAlert = true
        XCTAssertTrue(viewModel.isShowingEnterValueAlert, "O alerta de entrada de valor deveria estar exibido.")
    }
    
    func testLoginAlertIsPresented() {
        viewModel.error = .invalidPassword
        viewModel.isShowingLoginAlert = true
        XCTAssertTrue(viewModel.isShowingLoginAlert, "O alerta de login deveria estar exibido.")
        XCTAssertEqual(viewModel.error, .invalidPassword, "O erro de login deveria ser 'invalidPassword'.")
    }
}
