//
//  OverViewController.swift
//  WorkOutTracker
//
//  Created by Vlada Filipova on 02/12/2024.
//

import UIKit

class OverViewController: BaseController {
    
    private let navBar = OverViewNavigationBar()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false //запрещаем скролить таски
        view.backgroundColor = .clear
        
        return view
    }()
}

extension OverViewController {
    override func setupViews() {
        super.setupViews()
        
        view.setupView(navBar)
        view.setupView(collectionView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        navigationController?.navigationBar.isHidden = true
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM, dd"
        
//        header.configure(with: dateFormatter.string(from: Date()))
//        cell.configure(with: "Warm Up Cardio", subtitle: "Stair Climber * 10 minutes", isDone: true)
//        cell.layoutIfNeeded()
//        cell.roundCorners([.allCorners], radius: 15)
        
        collectionView.register(TasksCellView.self, forCellWithReuseIdentifier: TasksCellView.id)
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.id)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
//MARK: - UICollectionViewDataSource
extension OverViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TasksCellView.id, for: indexPath) as? TasksCellView else { return UICollectionViewCell() }
        
        cell.configure(with: "Test", subtitle: "Test", isDone: true)
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension OverViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 32)
    }
}
