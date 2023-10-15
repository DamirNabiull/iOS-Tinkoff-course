//
//  ContactsViewController.swift
//  Hw4
//
//  Created by Damir Nabiullin on 15.10.2023.
//

import UIKit

class ContactsViewController: UIViewController {
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.9, height: 90)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collectionView
    }()
    
    private lazy var viewModel = ContactsViewModel(collectionView: collectionView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setUpView()
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = viewModel.makeDataSource()
        viewModel.add(ContactsCollectioner.defaulContacts)
        
        collectionView.delegate = self
    }
    
    private func setUpView() {
        navigationItem.title = "Contacts"
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ContactsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.present(
            ContactViewController(contactData: viewModel.items[indexPath.row]),
            animated: true)
    }
}
