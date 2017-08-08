//
//  ViewController.swift
//  Circle of Fifths
//
//  Created by Ben Zacharia on 7/25/17.
//  Copyright © 2017 Ben Zacharia. All rights reserved.
//(16.0, 185.5, 343.0, 296.0) 7plus
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var key: Key? = nil
    
    @IBOutlet weak var circleButton: UIButton!
    @IBOutlet weak var keyPicker: UIPickerView!
    
    let pitchData = [Pitch.a.rawValue, Pitch.b.rawValue, Pitch.c.rawValue, Pitch.d.rawValue, Pitch.e.rawValue, Pitch.f.rawValue, Pitch.g.rawValue]
    let accidentalData = [Accidental.natural.rawValue, Accidental.flat.rawValue, Accidental.sharp.rawValue]
    let majorMinorData = ["Major", "Minor"]
    var pickerData: [[String]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Circle of Fifths"
        keyPicker.delegate = self
        keyPicker.dataSource = self
        pickerData = [
            pitchData,
            accidentalData,
            majorMinorData
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Click Events

    @IBAction func circleClick(_ sender: UIButton, forEvent event: UIEvent) {
        let touches = event.touches(for: sender)
        let touch = touches?.first!
        let location = touch?.location(in: sender)
        
        let point = Point(x: Double(location!.x), y: Double(location!.y))
        key = nil //initialize to nil so we can stop segue if no key is selected
        for (keyName, rect) in keyLocations {
            if point.isInRectangle(rect) {
                key = keyName.key
            }
        }
    }
    
    // MARK: - Picker Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let pitch = pickerData[0][keyPicker.selectedRow(inComponent: 0)]
        let accidental = pickerData[1][keyPicker.selectedRow(inComponent: 1)]
        if (pitch == Pitch.b.rawValue && accidental == Accidental.sharp.rawValue) {//B# - no Key
            keyPicker.selectRow(1, inComponent: 1, animated: true)
        } else if (pitch == Pitch.e.rawValue && accidental == Accidental.sharp.rawValue) {//E# - no Key
            keyPicker.selectRow(1, inComponent: 1, animated: true)
        } else if (pitch == Pitch.f.rawValue && accidental == Accidental.flat.rawValue) {//Fb - no Key
            keyPicker.selectRow(0, inComponent: 1, animated: true)
        } else if (pitch == Pitch.a.rawValue && accidental == Accidental.sharp.rawValue) {//A# - no major
            keyPicker.selectRow(1, inComponent: 2, animated: true)
        } else if (pitch == Pitch.c.rawValue && accidental == Accidental.flat.rawValue) {//Cb - no minor
            keyPicker.selectRow(0, inComponent: 2, animated: true)
        } else if (pitch == Pitch.d.rawValue && accidental == Accidental.flat.rawValue) {//Db - no minor
            keyPicker.selectRow(0, inComponent: 2, animated: true)
        } else if (pitch == Pitch.d.rawValue && accidental == Accidental.sharp.rawValue) {//D# - no major
            keyPicker.selectRow(1, inComponent: 2, animated: true)
        } else if (pitch == Pitch.g.rawValue && accidental == Accidental.flat.rawValue) {//Gb - no minor
            keyPicker.selectRow(0, inComponent: 2, animated: true)
        } else if (pitch == Pitch.g.rawValue && accidental == Accidental.sharp.rawValue) {//G# - no major
            keyPicker.selectRow(1, inComponent: 2, animated: true)
        }
        pickerView.reloadAllComponents()// force the update as values adjacent to selected value were not updating color accordingly
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let pitch = pickerData[0][keyPicker.selectedRow(inComponent: 0)]
        let accidental = pickerData[1][keyPicker.selectedRow(inComponent: 1)]
        
        let enabledValue = NSAttributedString(string: pickerData[component][row], attributes: [NSForegroundColorAttributeName:UIColor.black])
        let disabledValue = NSAttributedString(string: pickerData[component][row], attributes: [NSForegroundColorAttributeName:UIColor.gray])
        
        if (pitch == Pitch.b.rawValue && component == 1 && row == 2) {//B# - no Key
            return disabledValue
        } else if (pitch == Pitch.e.rawValue && component == 1 && row == 2) {//E# - no Key
            return disabledValue
        } else if (pitch == Pitch.f.rawValue && component == 1 && row == 1) {//Fb - no Key
            return disabledValue
        } else if (pitch == Pitch.a.rawValue && accidental == Accidental.sharp.rawValue && component == 2 && row == 0) {//A# - no major
            return disabledValue
        } else if (pitch == Pitch.c.rawValue && accidental == Accidental.flat.rawValue && component == 2 && row == 1) {//Cb - no minor
            return disabledValue
        } else if (pitch == Pitch.d.rawValue && accidental == Accidental.flat.rawValue && component == 2 && row == 1) {//Db - no minor
            return disabledValue
        } else if (pitch == Pitch.d.rawValue && accidental == Accidental.sharp.rawValue && component == 2 && row == 0) {//D# - no major
            return disabledValue
        } else if (pitch == Pitch.g.rawValue && accidental == Accidental.flat.rawValue && component == 2 && row == 1) {//Gb - no minor
            return disabledValue
        } else if (pitch == Pitch.g.rawValue && accidental == Accidental.sharp.rawValue && component == 2 && row == 0) {//G# - no major
            return disabledValue
        }
        
        return enabledValue
    }
    
    // MARK: - Navigation
    
    //if you click the circle but do not click a key do nothing
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (identifier == "ShowKeyFromCircle" && key == nil) {
            return false
        } else {
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowKeyFromCircle" {
            let keyViewController = segue.destination as! KeyViewController
            if let key = key {
                keyViewController.key = key
            }
            key = nil
        }
        
        if segue.identifier == "ShowKeyFromPicker" {
            let pitch = pickerData[0][keyPicker.selectedRow(inComponent: 0)]
            let accidental = pickerData[1][keyPicker.selectedRow(inComponent: 1)]
            let majorMinor = pickerData[2][keyPicker.selectedRow(inComponent: 2)]
            let isMinor = majorMinor == "Minor" ? true : false
            let keyViewController = segue.destination as! KeyViewController
            keyViewController.key = Key(pitch: Pitch(rawValue: pitch)!, accidental: Accidental(rawValue: accidental)!, isMinor: isMinor)
        }
    }
}

