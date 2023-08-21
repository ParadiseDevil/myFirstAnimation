//
//  ViewController.swift
//  TestTaskOne
//
//  Created by Дамир Шаймуханбетов on 21.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var imageOnView: UIImageView!
    private var controlPanel: UIView!
    
    private var menuButton: UIButton!
    private var panelButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScreen()
    }

    private func setUpScreen() {
        
        let colorMenu = UIColor(red: 0, green: 146 / 274, blue: 128 / 274, alpha: 1)
        
        self.controlPanel = UIView()
        self.imageOnView = UIImageView()
        self.menuButton = UIButton()
        
        controlPanel.translatesAutoresizingMaskIntoConstraints = false
        imageOnView.translatesAutoresizingMaskIntoConstraints = false
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        
        controlPanel.backgroundColor = colorMenu
        
//        self.view.backgroundColor = .gray
        
        imageOnView.image = UIImage(named: "image")
        imageOnView.contentMode = .scaleToFill
        
        menuButton.setTitle("Menu", for: .normal)
        menuButton.setTitleColor(.white, for: .normal)
        menuButton.backgroundColor = colorMenu
        menuButton.layer.borderWidth = 3
        menuButton.layer.borderColor = UIColor.white.cgColor
        
        
        self.view.addSubview(controlPanel)
        self.view.addSubview(imageOnView)
        self.view.addSubview(menuButton)
        
        setUpContraints()
        
    }
    
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

}

