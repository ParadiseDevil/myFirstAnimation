//
//  ViewController.swift
//  TestTaskOne
//
//  Created by Дамир Шаймуханбетов on 21.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let colorMenu = UIColor(red: 0, green: 146 / 274, blue: 128 / 274, alpha: 1)

    private var imageOnView: UIImageView!
    private var controlPanel: UIView!
    private var menuButton: UIButton!
    
    private var panelButtons = [UIButton]()
    private var checkPressButton: Bool!
    
    private var delay: TimeInterval = 0
    private var delayArray: [TimeInterval] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScreen()
        setUpPanelButtons()

    }

    //MARK: INIT
    private func setUpScreen() {
        
        
        self.controlPanel = UIView()
        self.imageOnView = UIImageView()
        self.menuButton = UIButton()
        
        controlPanel.translatesAutoresizingMaskIntoConstraints = false
        imageOnView.translatesAutoresizingMaskIntoConstraints = false
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        
        // init control panel
        controlPanel.backgroundColor = colorMenu
        
        // init image
        imageOnView.image = UIImage(named: "image")
        imageOnView.contentMode = .scaleToFill
        
        //init buttonMenu
        menuButton.setTitle("Menu", for: .normal)
        menuButton.setTitleColor(.white, for: .normal)
        menuButton.backgroundColor = colorMenu
        menuButton.layer.borderWidth = 3
        menuButton.layer.borderColor = UIColor.white.cgColor
        menuButton.addTarget(self, action: #selector(showMenu(sender: )), for: .touchUpInside)
        checkPressButton = false
        

        
        self.view.addSubview(controlPanel)
        self.view.addSubview(imageOnView)
        self.view.addSubview(menuButton)
        setUpContraints()

        
        
        
        
    }
    // MARK: -
    // MARK: Constraints
    private func setUpContraints() {
        // ControlPanel
        let leftControlPanel = NSLayoutConstraint(item: controlPanel!, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0)
        let rightControlPanel = NSLayoutConstraint(item: controlPanel!, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0)
        let bottomControlPanel = NSLayoutConstraint(item: controlPanel!, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0)
        let heightControlPanel = NSLayoutConstraint(item: controlPanel!, attribute: .height, relatedBy: .equal, toItem: controlPanel, attribute: .height, multiplier: 0, constant: CGFloat(AllConstants.heightMenu.rawValue))
        
        self.view.addConstraints([leftControlPanel, rightControlPanel, bottomControlPanel, heightControlPanel])
        
        // menuButton
        let rightMenuButton = NSLayoutConstraint(item: menuButton!, attribute: .right, relatedBy: .equal, toItem: controlPanel, attribute: .right, multiplier: 1, constant: -4)
        let topMenuButton = NSLayoutConstraint(item: menuButton!, attribute: .top, relatedBy: .equal, toItem: controlPanel, attribute: .top, multiplier: 1, constant: 0)
        let heightMenuButton = NSLayoutConstraint(item: menuButton!, attribute: .height, relatedBy: .equal, toItem: menuButton, attribute: .height, multiplier: 0, constant: CGFloat(AllConstants.heighButtonMenu.rawValue))
        let widthMenuButton = NSLayoutConstraint(item: menuButton!, attribute: .width, relatedBy: .equal, toItem: menuButton, attribute: .width, multiplier: 0, constant: CGFloat(AllConstants.widthButtonMenu.rawValue))
        
        self.view.addConstraints([rightMenuButton, topMenuButton, heightMenuButton, widthMenuButton])
        
        // Image
        let leftImage = NSLayoutConstraint(item: imageOnView!, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0)
        let rightImage = NSLayoutConstraint(item: imageOnView!, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0)
        let topImage = NSLayoutConstraint(item: imageOnView!, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        let bottomImage = NSLayoutConstraint(item: imageOnView!, attribute: .bottom, relatedBy: .equal, toItem: controlPanel, attribute: .top, multiplier: 1, constant: 0)
        
        self.view.addConstraints([leftImage, rightImage, topImage, bottomImage])

    }
    
    private func setUpPanelButtons() {
        
        for index in 0 ... AllConstants.numberOfButtonInMenu.rawValue - 1 {
            let button = UIButton(type: .system)
            // action for button
            button.addTarget(self, action: #selector(deleteButton(sender: )), for: .touchUpInside)
                 
            // init panel button
            button.setTitle("\(index)", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = colorMenu
            
            button.frame.size = CGSize(width: AllConstants.heightAndWidthButtonControl.rawValue,
                                               height: AllConstants.heightAndWidthButtonControl.rawValue)
            button.layer.cornerRadius = button.frame.width / 2
            button.isHidden = true
            
            self.view.addSubview(button)
            panelButtons.append(button)
            
            delayArray.append(delay)
            delay += 0.2

        }
        
    }
    //MARK: -
    //MARK: ACTION
    @objc func deleteButton(sender: UIButton) {
        sender.isHidden = true
    }
    
    @objc func showMenu(sender: UIButton) {
        checkPressButton = !checkPressButton
        if checkPressButton {
            upMenu()
        } else {
            downMenu()
        }
        
    }
    
    private func upMenu() {
        for index in 0 ..< AllConstants.numberOfButtonInMenu.rawValue {
            panelButtons[index].center = self.menuButton.center
            // animation
            UIView.animate(withDuration: 2.0, delay: delayArray[index], options: .curveEaseOut) {
                self.panelButtons[index].frame.origin.y = self.menuButton.frame.minY - self.menuButton.frame.height - 40 - (self.panelButtons[index].frame.height  + 15) * CGFloat(index)
            }
            panelButtons[index].isHidden = false
            
        }
    }
    
    private func downMenu(){
        for index in 0 ..< AllConstants.numberOfButtonInMenu.rawValue {
            self.panelButtons[index].frame.origin.y = self.menuButton.frame.minY - self.menuButton.frame.height - 40 - (self.panelButtons[index].frame.height  + 15) * CGFloat(index)
            // animation
            UIView.animate(withDuration: 2.0, delay: delayArray[index], options: .curveEaseOut) {
                self.panelButtons[index].center = self.menuButton.center
            } completion: { (_) in
                self.panelButtons[index].isHidden = true
            }
           
            
        }
        
        
    }
}
