//
//  NewsBodyTableViewCell.swift
//  TUHub
//
//  Created by Connor Crawford on 3/8/17.
//  Copyright © 2017 Temple University. All rights reserved.
//

import UIKit

class NewsBodyTableViewCell: UITableViewCell {

    weak var tableView: UITableView?
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var contentTextView: UITextView!
    
    func updateImageView(with image: UIImage?) {
        newsImageView.image = image
        tableView?.beginUpdates()
        tableView?.endUpdates()
    }
    
    func setUp(with newsItem: NewsItem, from tableView: UITableView) {
        newsImageView.image = newsItem.image
        contentTextView.attributedText = newsItem.content!
        self.tableView = tableView
    }
    
}
