//
//  ViewController.swift
//  230918_StroringData
//
//  Created by hasan bilgin on 19.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //data varsa alıcaktır
        let storedName=UserDefaults.standard.object(forKey: "name")
        let storedBirthday=UserDefaults.standard.object(forKey: "birthday")
        
        //Casting as? vs as!
        //storedName as? String //demek storedName(any) i String mi diye bilmeden çevirebilirsen Stringe çevir
        //storedName as! String //demek storedName Stringtir direk Stringe çevirebilirsin
        //alttaki anlamı Stringe çevirebilirse myName direk atar çeviremezse ife girmicektir
        if let newName=storedName as? String{
            nameLabel.text="Name: \(newName)"
        }
        
        if let newbirthday=storedBirthday as? String{
            birthdayLabel.text="Birthday: \(newbirthday)"
        }
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        
        //set edilmesi küçük data tutumak için
        //androiddeki SharedPreferences mantığı
        UserDefaults.standard.set(nameTextField.text, forKey: "name")
        UserDefaults.standard.set(birthdayTextField.text, forKey: "birthday")
        
        //eskiden bu metot senkronize ediyordu artık gerek yok
        // UserDefaults.standard.synchronize()
        
        //"Name: \(nameTextField.text)" ifadesinde nameTextField.text yazılan neyse direke string olarak yansıtılcak bu şekilde ifade ederiz \(...)
        //! koyarak bunlar kesinlikle stringtir stringe çevirebilirsin
        nameLabel.text="Name: \(nameTextField.text!)"
        birthdayLabel.text="Birthday: \(birthdayTextField.text!)"
    }
    
    
    
    @IBAction func deleteClicked(_ sender: Any) {
        let storedName=UserDefaults.standard.object(forKey: "name")
        let storedBirthday=UserDefaults.standard.object(forKey: "birthday")
        
        //if let newName=storedName as? String{
        //benzer burda storeName değişkeni ne ise bunu al Stringe çevirebilirsen ve buda tabiki nilden farklı olduğu için ife girecek
        if (storedName as? String) != nil{
            //silme
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text="Name: "
        }
        
        if (storedBirthday as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text="Birthday: "
        }
    }
    
    //Swift bazı yerlerde boşluk olması gerektiini söle if 5!=4 gibi hata verir 5 != 4 yazılmalıdır
    
    
}

