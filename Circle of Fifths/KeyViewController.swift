//
//  KewViewController2.swift
//  Circle of Fifths
//
//  Created by Ben Zacharia on 8/7/17.
//  Copyright © 2017 Ben Zacharia. All rights reserved.
//

import UIKit

class KeyViewController: UITableViewController {
    
    var key: Key = Key(pitch: .c, isMinor: false)
    
    var isMelodicMinorUp = true
    var naturalMinorAudioPath: String?
    var harmonicMinorAudioPath: String?
    var melodicMinorAudioPath: String?
    var majorAudioPath: String?
    var chordsAudioPath: String?
    
    @IBOutlet weak var relativeButton: UIButton!
    @IBOutlet weak var parallelButton: UIButton!
    
    var audioPlayer: SamplesAudioPlayer = SamplesAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = key.name
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        
        configureButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureButtons() {
        relativeButton.backgroundColor = .clear
        relativeButton.layer.cornerRadius = 5
        relativeButton.layer.borderWidth = 1
        relativeButton.layer.borderColor = UIColor.blue.cgColor
        parallelButton.backgroundColor = .clear
        parallelButton.layer.cornerRadius = 5
        parallelButton.layer.borderWidth = 1
        parallelButton.layer.borderColor = UIColor.blue.cgColor
        
        if key.getRelativeKey() != nil {
            relativeButton.isEnabled = true
        } else {
            relativeButton.isEnabled = false
        }
        
        if key.getParallelKey() != nil {
            parallelButton.isEnabled = true
        } else {
            parallelButton.isEnabled = false
        }
    }
    
    // MARK: - Table Functions
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return key.isMinor ? 4 : 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ScaleCell", for: indexPath) as? ScaleCell else {
            showAlertWith(title: KeyErrors.scaleCellError.errorTitle, message: KeyErrors.scaleCellError.errorMessage)
            fatalError()
        }
        
        if (key.isMinor) {
            //set up each cell
            if (indexPath.row == 0) {
                cell.scaleLabel.text = "Natural Minor Scale"
                if let naturalScaleImage : UIImage = UIImage(named:"\(FileNameConstants.scale.rawValue)\(key.pitch.name)minNatural.png") {
                    cell.scaleImage.image = naturalScaleImage
                } else {
                    cell.scaleImage.image = #imageLiteral(resourceName: "EmptyStaff")
                }
                
                if let testNaturalMinorAudioPath = Bundle.main.path(forResource: "\(FileNameConstants.scale.rawValue)\(key.pitch.name)minNatural", ofType: "mp3") {
                    naturalMinorAudioPath = testNaturalMinorAudioPath
                    cell.scaleAudioButton.isEnabled = true
                } else {
                    cell.scaleAudioButton.isEnabled = false
                }
                
                cell.scaleArrow.isHidden = true
                
            } else if (indexPath.row == 1) {
                cell.scaleLabel.text = "Harmonic Minor Scale"
                if let harmonicScaleImage : UIImage = UIImage(named:"\(FileNameConstants.scale.rawValue)\(key.pitch.name)minHarmonic.png") {
                    cell.scaleImage.image = harmonicScaleImage
                } else {
                    cell.scaleImage.image = #imageLiteral(resourceName: "EmptyStaff")
                }
                
                if let testHarmonicMinorAudioPath = Bundle.main.path(forResource: "\(FileNameConstants.scale.rawValue)\(key.pitch.name)minHarmonic", ofType: "mp3") {
                    harmonicMinorAudioPath = testHarmonicMinorAudioPath
                    cell.scaleAudioButton.isEnabled = true
                } else {
                    cell.scaleAudioButton.isEnabled = false
                }
                
                cell.scaleArrow.isHidden = true
                
            } else if (indexPath.row == 2) {
                cell.scaleLabel.text = "Melodic Minor Scale"
                if let melodicUpScaleImage : UIImage = UIImage(named:"\(FileNameConstants.scale.rawValue)\(key.pitch.name)minMelodicUp.png") {
                    cell.scaleImage.image = melodicUpScaleImage
                } else {
                    cell.scaleImage.image = #imageLiteral(resourceName: "EmptyStaff")
                }
                
                if let testMelodicMinorAudioPath = Bundle.main.path(forResource: "\(FileNameConstants.scale.rawValue)\(key.pitch.name)minMelodicUp", ofType: "mp3") {
                    melodicMinorAudioPath = testMelodicMinorAudioPath
                    cell.scaleAudioButton.isEnabled = true
                } else {
                    cell.scaleAudioButton.isEnabled = false
                }
                
            } else if (indexPath.row == 3) {
                cell.scaleLabel.text = "Chords"
                if let chordImage : UIImage = UIImage(named:"\(FileNameConstants.chord.rawValue)\(key.pitch.name)min.png") {
                    cell.scaleImage.image = chordImage
                } else {
                    cell.scaleImage.image = #imageLiteral(resourceName: "EmptyStaff")
                }
                
                if let testChordAudioPath = Bundle.main.path(forResource: "\(FileNameConstants.chord.rawValue)\(key.pitch.name)min", ofType: "mp3") {
                    chordsAudioPath = testChordAudioPath
                    cell.scaleAudioButton.isEnabled = true
                } else {
                    cell.scaleAudioButton.isEnabled = false
                }
                
                cell.scaleArrow.isHidden = true
                
            }
        } else {
            if (indexPath.row == 0) {
                cell.scaleLabel.text = "Major Scale"
                if let scaleImage : UIImage = UIImage(named:"\(FileNameConstants.scale.rawValue)\(key.pitch.name)maj.png") {
                    cell.scaleImage.image = scaleImage
                } else {
                    cell.scaleImage.image = #imageLiteral(resourceName: "EmptyStaff")
                }
                
                if let testMajorAudioPath = Bundle.main.path(forResource: "\(FileNameConstants.scale.rawValue)\(key.pitch.name)maj", ofType: "mp3") {
                    majorAudioPath = testMajorAudioPath
                    cell.scaleAudioButton.isEnabled = true
                } else {
                    cell.scaleAudioButton.isEnabled = false
                }
                
                cell.scaleArrow.isHidden = true
                
            } else if (indexPath.row == 1) {
                cell.scaleLabel.text = "Chords"
                if let chordImage : UIImage = UIImage(named:"\(FileNameConstants.chord.rawValue)\(key.pitch.name)maj.png") {
                    cell.scaleImage.image = chordImage
                } else {
                    cell.scaleImage.image = #imageLiteral(resourceName: "EmptyStaff")
                }
                
                if let testChordAudioPath = Bundle.main.path(forResource: "\(FileNameConstants.chord.rawValue)\(key.pitch.name)maj", ofType: "mp3") {
                    chordsAudioPath = testChordAudioPath
                    cell.scaleAudioButton.isEnabled = true
                } else {
                    cell.scaleAudioButton.isEnabled = false
                }
                
                cell.scaleArrow.isHidden = true
            }
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    // MARK: - Button Clicks
    
    @IBAction func relativeButtonClick() {
        if let relativeKey = key.getRelativeKey() {
            key = relativeKey
            tableView.reloadData()
            viewDidLoad()
        } else {
            showAlertWith(title: KeyErrors.noRelativeKey.errorTitle, message: KeyErrors.noRelativeKey.errorMessage)
        }
    }
   
    @IBAction func parallelButtonClick() {
        if let parallelKey = key.getParallelKey() {
            key = parallelKey
            tableView.reloadData()
            viewDidLoad()
        } else {
            showAlertWith(title: KeyErrors.noParallelKey.errorTitle, message: KeyErrors.noParallelKey.errorMessage)
        }
    }
    
    @IBAction func audioButtonClick(_ sender: AnyObject) {
        guard let cell = sender.superview??.superview as? ScaleCell else {
            showAlertWith(title: KeyErrors.audioCellError.errorTitle, message: KeyErrors.audioCellError.errorMessage)
            return
        }
        
        if let indexPath = tableView.indexPath(for: cell) {
            if (key.isMinor) {
                if (indexPath.row == 0) {
                    if let naturalMinorAudioPath = naturalMinorAudioPath {
                        audioPlayer.playSample(for: URL(fileURLWithPath: naturalMinorAudioPath))
                    }
                } else if (indexPath.row == 1) {
                    if let harmonicMinorAudioPath = harmonicMinorAudioPath {
                        audioPlayer.playSample(for: URL(fileURLWithPath: harmonicMinorAudioPath))
                    }
                } else if (indexPath.row == 2) {
                    if let melodicMinorAudioPath = melodicMinorAudioPath {
                        audioPlayer.playSample(for: URL(fileURLWithPath: melodicMinorAudioPath))
                    }
                } else if (indexPath.row == 3) {
                    if let chordsAudioPath = chordsAudioPath {
                        audioPlayer.playSample(for: URL(fileURLWithPath: chordsAudioPath))
                    }
                }
            } else {
                if (indexPath.row == 0) {
                    if let majorAudioPath = majorAudioPath {
                        audioPlayer.playSample(for: URL(fileURLWithPath: majorAudioPath))
                    }
                } else if (indexPath.row == 1) {
                    if let chordsAudioPath = chordsAudioPath {
                        audioPlayer.playSample(for: URL(fileURLWithPath: chordsAudioPath))
                    }
                }
            }
        }
    }
    
    //Arrows are used for melodic minor only because it is the only scale that is different based on direction
    @IBAction func arrowButtonClick(_ sender: AnyObject) {
        guard let cell = sender.superview??.superview as? ScaleCell else {
            showAlertWith(title: KeyErrors.arrowCellError.errorTitle, message: KeyErrors.arrowCellError.errorMessage)
            return
        }
        
        if let indexPath = tableView.indexPath(for: cell) {
            if (indexPath.row == 2) {
                //reset cells based on whether we were on up or down
                if (isMelodicMinorUp) {
                    if let melodicDownScaleImage : UIImage = UIImage(named:"\(FileNameConstants.scale.rawValue)\(key.pitch.name)minMelodicDown.png") {
                        cell.scaleImage.image = melodicDownScaleImage
                    } else {
                        cell.scaleImage.image = #imageLiteral(resourceName: "EmptyStaff")
                    }
                    
                    if let testMelodicMinorAudioPath = Bundle.main.path(forResource: "\(FileNameConstants.scale.rawValue)\(key.pitch.name)minMelodicDown", ofType: "mp3") {
                        melodicMinorAudioPath = testMelodicMinorAudioPath
                        cell.scaleAudioButton.isEnabled = true
                    } else {
                        melodicMinorAudioPath = nil
                        cell.scaleAudioButton.isEnabled = false
                    }
                    
                    cell.scaleArrow.setImage(#imageLiteral(resourceName: "ArrowUp"), for: .normal)
                    isMelodicMinorUp = false
                } else {
                    if let melodicUpScaleImage : UIImage = UIImage(named:"\(FileNameConstants.scale.rawValue)\(key.pitch.name)minMelodicUp.png") {
                        cell.scaleImage.image = melodicUpScaleImage
                    } else {
                        cell.scaleImage.image = #imageLiteral(resourceName: "EmptyStaff")
                    }
                    
                    if let testMelodicMinorAudioPath = Bundle.main.path(forResource: "\(FileNameConstants.scale.rawValue)\(key.pitch.name)minMelodicUp", ofType: "mp3") {
                        melodicMinorAudioPath = testMelodicMinorAudioPath
                        cell.scaleAudioButton.isEnabled = true
                    } else {
                        melodicMinorAudioPath = nil
                        cell.scaleAudioButton.isEnabled = false
                    }
                    
                    cell.scaleArrow.setImage(#imageLiteral(resourceName: "ArrowDown"), for: .normal)
                    isMelodicMinorUp = true
                }
            }
        }
    }
    
    // MARK: - Alerts
    
    func showAlertWith(title: String, message: String, style: UIAlertControllerStyle = .alert) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: dismissAlert)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func dismissAlert(sender: UIAlertAction) -> Void {
        
    }
}







