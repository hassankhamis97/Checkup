//
//  TestNamingGroupViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/2/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class TestNamingGroupViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    struct tableGuid {
        
        var letters:String
        var names:[String]
    }
    
    var tsetsNames:[tableGuid]!
    var allNames=[String]()
    var filteredNames=[String]()
    var filteredNamesFromSection=[String]()
    var filteredNamesFromSearch=[String]()
    
    var searching=false
    
    
     var delegate:fillDataCells?
    
    @IBAction func doneBtn(_ sender: Any) {
        if(filteredNames.isEmpty){
            
            
            for i in filteredNamesFromSection{
                delegate?.fillData(dataObj: i)
            }
        }
        else{
            for i in filteredNamesFromSearch{
                delegate?.fillData(dataObj: i)
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tsetsNames=[tableGuid(letters: "A", names: ["ACTH (Adreno Corticotropic Hormone)",
                                                    "Adenosine Deaminase" ,"AFP (Alpha Feto Protein)"," Alberts Stain","Albumin ","Ammonia"]),tableGuid(letters: "B", names: ["Bleeding / Clotting Time)",
                                                                                                                                                                              "Blood Culture","Blood Urea Nitrogen","Beta HCG"," Bilirubin Test"]),tableGuid(letters: "C", names: ["C-Peptide ","CA 15.3 ","CA 27.29 ","CBC "," Chlamydia","Cytomegalovirus (CMV)"]),tableGuid(letters: "D", names: ["Dimer","Dengue IgG","DNA","Dengue NS1 Test"
                                                                                                                                                                              ]),tableGuid(letters: "E", names: ["Estradiol (E2) Test"]),tableGuid(letters: "F", names: ["Factor V Leiden", "Ferritin","FNAC","Folic Acid","Fungal Culture"]),tableGuid(letters: "G", names: ["Globulin","Glucose Tolerance ","Gram Stain"]),tableGuid(letters: "H", names: ["HbA1C","HBeAb (Hepatitis B Antibody)"," HBsAg","HCV Antibody","HDL Cholesterol","Helicobacter Pylori","Hemoglobin (Hb)","Hemoglobin Electrophoresis","Hepatitis A ","Hepatitis E ","Herpes Simplex Virus (HSV)","Homocysteine","HGH ","HLA B27","HSG Test","   HIV"]),tableGuid(letters: "i", names: ["Insulin","Iron"]),tableGuid(letters: "j", names: ["no available test"]),tableGuid(letters: "K", names: ["Karyotype","Kidney / Renal Function"]),tableGuid(letters: "L", names: ["Karyotype","L. E. Cells","LDH","LDL Cholesterol","LH (Luteinizing Hormone)","Lipase"
                                                                                                                                                                                , "Lipoprotein A / LP(a)","Lithium","Liver Function(LFT)","Lupus Anticoagulant (LAC)"]),tableGuid(letters: "M", names: ["Magnesium","Malaria (Malarial Parasite)"," Microalbumin","Microfilaria Parasite"]),tableGuid(letters: "N", names: ["no available test"]),tableGuid(letters: "O", names: ["no available test"]),tableGuid(letters: "P", names: ["Paratyphi"," PCV (Packed Cell Volume","Peripheral Blood Smear","  Phosphorus","Plasma Lactate (Lactic Acid)","Platelet Count","Pleural Fluid Analysis"," Potassium ","Pregnancy"," Progesterone","Prolactin","Protein"]),tableGuid(letters: "Q", names: ["no available test"]),tableGuid(letters: "R", names: ["Reticulocyte Count"," Rheumatoid Arthritis (RA) Factor","Rubella"]),tableGuid(letters: "S", names: ["Semen Analysis","Sex Hormone","SGOT","SGPT"," Sickling"," Sodium"
                                                                                                                                                                                ]),tableGuid(letters: "T", names: [" T3 (Triiodothyronine)"," T4 (Thyroxine)","Testosterone","TSH","Typhidot"]),tableGuid(letters: "U", names: ["Urea"," Uric Acid"]),tableGuid(letters: "V", names: [" VDRL","Vitamin A","Vitamin B12","Vitamin C","Vitamin D","Vitamin E","VLDL"]),tableGuid(letters: "W", names: [" Widal"]),tableGuid(letters: "X", names: [" No available tests"]),tableGuid(letters: "Y", names: [" No available tests"]),tableGuid(letters: "Z", names: [" No available tests"])]
        
        for items in tsetsNames{
            for i in items.names
            {
                allNames.append(i)
            }
        }
    }
    
    
}

extension TestNamingGroupViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        if(searching)
        {
            return 1
            
        }
        else{
            return tsetsNames.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searching)
        {
            
            return filteredNames.count
        }
        else{
            return tsetsNames[section].names.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        if(searching)
        {
            cell.textLabel?.text=filteredNames[indexPath.row]
        }
            
        else{
            cell.textLabel?.text=tsetsNames[indexPath.section].names[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType==UITableViewCell.AccessoryType.checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType=UITableViewCell.AccessoryType.none
            
            if(searching){
                
                var x=filteredNames[indexPath.row]
                          for i in 0..<filteredNamesFromSearch.count{
                              if (filteredNamesFromSearch[i]==x)
                              {
                               filteredNamesFromSearch.remove(at: i)
                           }
                           }
            }
            
            var x=tsetsNames[indexPath.section].names[indexPath.row]
           for i in 0..<filteredNamesFromSection.count{
               if (filteredNamesFromSection[i]==x)
               {
                filteredNamesFromSection.remove(at: i)
            }
            }
        }
            
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType=UITableViewCell.AccessoryType.checkmark
            
            if(searching)
            {
                var x=filteredNames[indexPath.row]
                filteredNamesFromSearch.append(x)
            }
            else{
                var x=tsetsNames[indexPath.section].names[indexPath.row]
                           filteredNamesFromSection.append(x)
            }
           
            
        }
        
        
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            if(searching)
            {
                return("")
            }
            else{
                
                return tsetsNames[section].letters
            }
        }
        
        
    }
    
    
}
extension TestNamingGroupViewController:UISearchBarDelegate
{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredNames = allNames.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        self.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text=""
        searching = false
        tableView.reloadData()

    }
    

    
}
