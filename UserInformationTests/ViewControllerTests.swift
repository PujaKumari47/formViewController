//
//  ViewControllerTests.swift
//  UserInformation
//
//  Created by Puja Kumari on 5/22/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import XCTest
@testable import UserInformation

class ViewControllerTests: XCTestCase {
    
    var viewController: ViewController!
    override func setUp() {
        super.setUp()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        //load view hierarchy
        _ = viewController.view
    }
    
    func testTextFieldDidBeginEditing() {
        let sampleTextField = MockTextField()
        viewController.textFieldDidBeginEditing(sampleTextField)
        sampleTextField.textFieldDidBeginEditing(sampleTextField)
        XCTAssert(sampleTextField.completionInvoked)
      
    }
    func testNumberOfComponentsInPickerView() {
        let section = viewController.numberOfComponents(in: viewController.heightPickerView)
        XCTAssertEqual(section, 1)
    }
   
    
    func testPickerNumberOfRows() {
        let rows = viewController.pickerView(viewController.heightPickerView, numberOfRowsInComponent: 0)
        XCTAssertEqual(rows,viewController.height.count )
        XCTAssertNotNil(rows)
        let rowsSex = viewController.pickerView(viewController.sexPickerView, numberOfRowsInComponent: 0)
        XCTAssertEqual(rowsSex, viewController.sex.count)
        XCTAssertNotNil(rowsSex)
    }
    func testPickerTitleForRows() {
        let title = viewController.pickerView(viewController.heightPickerView, titleForRow: 0, forComponent: 0)
        XCTAssertEqual(title, "165Cm")
        XCTAssertNotNil(title)
        let titleWeight = viewController.pickerView(viewController.weightPickerView, titleForRow: 0, forComponent: 0)
        XCTAssertEqual(titleWeight, "57Kg")
        XCTAssertNotNil(title)
        let titleSex = viewController.pickerView(viewController.sexPickerView, titleForRow: 0, forComponent: 0)
        XCTAssertEqual(titleSex, "Male")
        XCTAssertNotNil(title)
    }
    func testDidSelectRow() {
        let selectedRow = viewController.pickerView(viewController.heightPickerView, didSelectRow: 0, inComponent: 0)
        XCTAssertNotNil(selectedRow)
        let weightSelectedRow = viewController.pickerView(viewController.weightPickerView, didSelectRow: 0, inComponent: 0)
        XCTAssertNotNil(weightSelectedRow)
        let sexSelectedRow = viewController.pickerView(viewController.sexPickerView, didSelectRow: 0, inComponent: 0)
        XCTAssertNotNil(sexSelectedRow)
        
    }
    func testTextFieldShouldReturn() {
        let textField = MockTextField()
        viewController.textFieldShouldReturn(textField)
    }
    func testDonePickerChanged() {
        var datePicker = MockDatePickerField()
        viewController.datePickerValueChanged(sender: datePicker)
        let date = "May 22 ,2017"
        //XCTAssertEqual(viewController.dobTextField.text, date)
        XCTAssertNotNil(viewController.dobTextField.text)
    }
    
    func testDonePicker() {
        let buttonDonePicker = MockDonePicker()
        viewController.donePicker(sender: buttonDonePicker)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    
}
class MockTextField:UITextField,UITextFieldDelegate{
    
    var completionInvoked = false
    
  func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField did begin editing method called")
        completionInvoked = true
    }
}
class MockDatePickerField: UIDatePicker {
    
}
class MockDonePicker: UIBarButtonItem {
    
}
