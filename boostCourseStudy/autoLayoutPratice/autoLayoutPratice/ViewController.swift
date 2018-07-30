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
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let greetingTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Hello!!!", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun?", attributes: [NSAttributedStringKey.foregroundColor : UIColor.gray]))
        
        textView.attributedText = attributedText
        
//        textView.text = "hello!"
//        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(bearImageView)
        view.addSubview(greetingTextView)
        
        setLayout()
    }

    private func setLayout() {
        
        let topImageContainerView = UIView()
        
        view.addSubview(topImageContainerView)
        topImageContainerView.addSubview(bearImageView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topImageContainerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5),
            topImageContainerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
    
            bearImageView.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.5),
            bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
            bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            
            greetingTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            greetingTextView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            greetingTextView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            greetingTextView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
            ])
        
        //이런 식의 작성도 가능하다.
        //imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        
    }


}

