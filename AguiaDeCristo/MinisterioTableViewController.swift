//
//  MinisterioTableViewController.swift
//  AguiaDeCristo
//
//  Created by Thiago Tosetti Lopes on 12/02/16.
//  Copyright © 2016 tDesign. All rights reserved.
//

import UIKit

class MinisterioTableViewController: UITableViewController {

    private let CellID = "CellID"
    private let CellID1 = "CellID1"
    private let CellID2 = "CellID2"
    
    typealias Ministerio = [String: String]
    typealias Ministerios = [Ministerio]
    private var minist: Ministerios!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMinisterio()
    }
    
    // MARK: -
    private func loadMinisterio() {
        let pacote = NSBundle.mainBundle()
        let arquivo = pacote.URLForResource("aguia", withExtension: "json")!
        
        // carregamos o arquivo na memoria
        let data = NSData(contentsOfURL: arquivo)!
        
        // NSJSON - transforma JSON em Swift
        let JSON = try! NSJSONSerialization.JSONObjectWithData(data, options: [])
        
        // downcast para minist
        minist = JSON as! Ministerios
    }



    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // return minist.count
        return 3
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellID, forIndexPath: indexPath) as! MinisterioTableViewCell

        // Configure the cell...
        cell.textLabel?.text = minist[indexPath.row]["ID"]

        return cell
    }


    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return false
    }
    
    

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // smurfSelecionado
        let indiceSelecionado = tableView.indexPathForSelectedRow!
        let itemSelecionado = minist[indiceSelecionado.row]
        
        
        let detailViewController = segue.destinationViewController as! DetailViewController
        detailViewController.title = minist[indiceSelecionado.row]["ID"]
        detailViewController.item = itemSelecionado
        
    }
    

}
