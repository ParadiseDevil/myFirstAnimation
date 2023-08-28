//
//  ViewController.swift
//  TestTaskOne
//
//  Created by Дамир Шаймуханбетов on 21.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let colorMenu = UIColor(red: 0, green: 146 / 274, blue: 128 / 274, alpha: 1)

    //MARK: Properties
    private var imageOnView: UIImageView!
    private var controlPanel: UIView!
    private var menuButton: UIButton!
    
    private var panelButtons = [UIButton]()
    private var checkPressButton: Bool!
    
    private var delay: TimeInterval = 0
    private var delayArray: [TimeInterval] = []

    //MARK: -
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
    
    private func setUpPanelButtons() {
        
        for index in 0 ... AllConstants.numberOfButtonInMenu.rawValue - 1 {
            let button = UIButton(type: .system)
            // action for button
            button.addTarget(self, action: #selector(deleteButton(sender: )), for: .touchUpInside)
                 
            // init panel button
            button.isEnabled = false
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
    
    // MARK: -
    // MARK: Constraints
    private func setUpContraints() {
        // ControlPanel
        NSLayoutConstraint.activate([
            controlPanel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            controlPanel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            controlPanel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            controlPanel.heightAnchor.constraint(equalToConstant: CGFloat(AllConstants.heightMenu.rawValue))
        ])
        
        // menuButton
        NSLayoutConstraint.activate([
            menuButton.trailingAnchor.constraint(equalTo: controlPanel.trailingAnchor, constant: -4),
            menuButton.topAnchor.constraint(equalTo: controlPanel.topAnchor),
            menuButton.widthAnchor.constraint(equalToConstant: CGFloat(AllConstants.widthButtonMenu.rawValue)),
            menuButton.heightAnchor.constraint(equalToConstant: CGFloat(AllConstants.heighButtonMenu.rawValue))
        ])
            
        // Image
        NSLayoutConstraint.activate([
            imageOnView.topAnchor.constraint(equalTo: self.view.topAnchor),
            imageOnView.bottomAnchor.constraint(equalTo: self.controlPanel.topAnchor),
            imageOnView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            imageOnView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        ])
        

    }

    //MARK: -
    //MARK: ACTION
    @objc func deleteButton(sender: UIButton) {
        sender.isHidden = true
    }
    
    @objc func showMenu(sender: UIButton) {
        sender.isEnabled = false
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
//            panelButtons[index].isEnabled = false
            // animation
            UIView.animate(withDuration: 1.5, delay: delayArray[index], options: .curveEaseOut) { [weak self] in
                guard let self = self else {return }
                self.panelButtons[index].frame.origin.y = self.menuButton.frame.minY - self.menuButton.frame.height - 40 - (self.panelButtons[index].frame.height  + 15) * CGFloat(index)
            } completion: { [weak self] (_) in
                guard let self = self else {return }
                self.panelButtons[index].isEnabled = true
            }
            self.panelButtons[index].isHidden = false
            self.menuButton.isEnabled = true



            
        }
    }
    
    private func downMenu(){
        for index in 0 ..< AllConstants.numberOfButtonInMenu.rawValue {
            panelButtons[index].frame.origin.y = self.menuButton.frame.minY - self.menuButton.frame.height - 40 - (self.panelButtons[index].frame.height  + 15) * CGFloat(index)
            
            panelButtons[index].isEnabled = false
            
            // animation
            UIView.animate(withDuration: 1.5, delay: delayArray[index], options: .curveEaseOut) { [weak self] in
                guard let self = self else {return }
                self.panelButtons[index].center = self.menuButton.center
            } completion: { [weak self] (_) in
                guard let self = self else {return }
                self.panelButtons[index].isHidden = true
                self.menuButton.isEnabled = true

            }

           
            
        }
        
        
    }
}
