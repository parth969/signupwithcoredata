//
//  ViewController.swift
//  Myfirstapp_1
//
//  Created by Yogesh Patel on 12/12/19.
//  Copyright © 2019 yogesh patel. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var appdel:AppDelegate?
    var managedContext:NSManagedObjectContext? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appdel = UIApplication.shared.delegate as? AppDelegate
        
        self.managedContext = (self.appdel?.persistentContainer.viewContext)
        // Do any additional setup after loading the view.
    }
    
    var UserId = 0
    @IBOutlet weak var uname: UITextField!
    
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confpass: UITextField!
    
    
    @IBAction func btnsave(_ sender: UIButton) {
        
        let profileDescription = NSEntityDescription.entity(forEntityName: "Registration", in: self.managedContext!)
        
        let profile = NSManagedObject.init(entity: profileDescription!, insertInto: self.managedContext!)
        
        profile.setValue(uname.text!, forKey: "username")
         profile.setValue(Email.text!, forKey: "emailid")
         profile.setValue(password.text!, forKey: "password")
         profile.setValue(confpass.text!, forKey: "confirmpassword")
        
        do{
            try self.managedContext?.save()
        }
        catch{
            print("Error in save!")
        }
        
    }
    
    
    
    
    
    
    


}

