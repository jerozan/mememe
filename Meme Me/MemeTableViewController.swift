//
//  MemeTableViewController.swift
//  Meme Me
//
//  Created by Jerozan Jeyendrarasa on 5/13/15.
//  Copyright (c) 2015 Jero Jeyen. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController, UITableViewDataSource {
    
    var memes: [Meme]!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        memes = appDelegate.memes
        
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("memeCellIdentifier")as! UITableViewCell
        let meme = self.memes[indexPath.row]
        
        // set image and send date
        cell.imageView?.image = meme.memeImg
        cell.textLabel?.text = meme.topText + " " + meme.bottomText
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("memeDetailViewControllerIdentifier") as! MemeDetailViewController
        
        detailController.currentMeme = self.memes[indexPath.row]
        
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    @IBAction func addMeme(sender: UIBarButtonItem) {
        let vc = self.storyboard!.instantiateViewControllerWithIdentifier("memeEditorViewControllerIdentifier")! as! ViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }
}
