//
//  ChildViewViewController.swift
//  DataPassingVIPExample
//
//  Created by Yani Buchkov on 21.11.18.
//  Copyright (c) 2018 Yani Buchkov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ChildViewDisplayLogic: class {
    func displayGreeting(viewModel: Child.ShowGreetings.ViewModel)
    func displayTellParent(viewModel: Child.TellParent.ViewModel)
}

class ChildViewViewController: UIViewController, ChildViewDisplayLogic {
    
    // MARK: - ChildViewDisplayLogic
    func displayGreeting(viewModel: Child.ShowGreetings.ViewModel) {
        label.text = viewModel.greeting
    }
    
    func displayTellParent(viewModel: Child.TellParent.ViewModel) {
        router?.routeToParent(segue: nil)
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    
    // MARK: - Clean-swift connections
    var interactor: ChildViewBusinessLogic?
    var router: (NSObjectProtocol & ChildViewRoutingLogic & ChildViewDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        ChildViewConfigurator.shared.config(viewController: self)
    }
    
    // MARK: Routing
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showGreeting()
    }
    
    private func showGreeting() {
        let request = Child.ShowGreetings.Request()
        interactor?.showGreeting(request: request)
    }
    
    private func tellParent() {
        let name = textField.text
        let request = Child.TellParent.Request(name: name ?? "Optional")
        interactor?.tellParent(request: request)
    }
    
    // MARK: - IBAction
    @IBAction func btnPressed(_ sender: UIButton) {
        tellParent()
    }
}
