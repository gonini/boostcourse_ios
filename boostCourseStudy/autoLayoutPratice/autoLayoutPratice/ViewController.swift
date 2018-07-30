//
//  ViewController.swift
//  autoLayoutPratice
//
//  Created by 이혜주 on 2018. 7. 30..
//  Copyright © 2018년 leehyeju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "gom"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let greetingTextView: UITextView = {
        let textView = UITextView()
        textView.text = "hello!"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(bearImageView)
        view.addSubview(greetingTextView)
        
        setLayout()
    }

    private func setLayout() {
        
        NSLayoutConstraint.activate([
            // NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 150),
            // imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            bearImageView.heightAnchor.constraint(equalToConstant: 200),
            bearImageView.widthAnchor.constraint(equalToConstant: 200),
            bearImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            bearImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            
            greetingTextView.topAnchor.constraint(equalTo: bearImageView.bottomAnchor, constant: 120),
            greetingTextView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            greetingTextView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            greetingTextView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
            ])
        
        //이런 식의 작성도 가능하다.
        //imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        
    }


}

