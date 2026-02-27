//
//  HomeViewController.swift
//  grocery-app
//
//  Created by PRO on 1/15/26.
//

import UIKit

// collection View

class HomeViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var imageViewHeader: UIImageView!
    @IBOutlet weak var labelContentView: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var categoriesNav: UIButton!
    @IBOutlet weak var featuredlabel: UILabel!
    @IBOutlet weak var featuredNav: UIButton!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    // fake data
    var categories: [String] = ["veg", "fruit", "meat", "veg", "fruit", "meat"]
    var products: [String] = ["veg", "fruit", "meat", "veg", "fruit", "meat", "veg", "fruit", "meat"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        productCollectionView.layoutIfNeeded()
        collectionViewHeight.constant = productCollectionView.contentSize.height
    }
    
    private func setupUI(){
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .systemBackground
        view.largeContentTitle = "Home"
        
        searchBar.placeholder = "Search keywords.."
        imageViewHeader.image = UIImage(named: "homeImageView")
        
        labelContentView.text = "20% off on your first purchase"
        labelContentView.font = .title(size: 18)
        
        categoriesLabel.text = "Categories"
        categoriesLabel.font = .title(size: 18)
        
        featuredlabel.text = "Featured products"
        featuredlabel.font = .title(size: 18)
        categoriesNav.setImage(UIImage(named: "navigationbar"), for: .normal)
        featuredNav.setImage(UIImage(named: "navigationbar"), for: .normal)
    }
    
    private func setupCollectionView() {
        configureCategoriesCollectionView()
        configProductsCollectionView()
    }
    
    private func configureCategoriesCollectionView() {
        let nib = UINib(nibName: "CategoriesCell", bundle: .main)
        categoriesCollectionView.register(nib, forCellWithReuseIdentifier: "CategoriesCell")
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        categoriesCollectionView.showsHorizontalScrollIndicator = false
        
        if let flowLayout = categoriesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
    }
    
    private func configProductsCollectionView() {
        let nib = UINib(nibName: "ProductsCell", bundle: .main)
        productCollectionView.register(nib, forCellWithReuseIdentifier: "ProductsCell")
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        productCollectionView.showsVerticalScrollIndicator = false
        productCollectionView.isScrollEnabled = false
        
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == productCollectionView {
            
            let padding: CGFloat = 16
            let spacing: CGFloat = 12
            let totalSpacing = spacing
            
            let width = (collectionView.frame.width - padding * 2 - totalSpacing) / 2
            
            return CGSize(width: width, height: 220)
        }
        
        return CGSize(width: 80, height: 100)
    }
    
    func setupCategoryCell(index: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCell", for: index ) as! CategoriesCell
        cell.imageView.image = UIImage(named: "Ellipse 10")
        cell.nameLabel.text = "vegetables"
        return cell
    }
    
    func setupProductsCell(index: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCell", for: index ) as! ProductsCell
        cell.productsImage.image = UIImage(named: "Group 32")
        cell.newLabel.text = "NEW"
        cell.btnTicked.setImage(UIImage(named: "loved"), for: .normal)
        cell.priceLabel.text = "$8.00"
        cell.titleLabel.text = "Fresh Peach"
        cell.titleLabel.font = .title(size: 18)
        cell.desLabel.text = "dozen"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoriesCollectionView:
            return categories.count
        case productCollectionView:
            return products.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoriesCollectionView:
            return setupCategoryCell(index: indexPath, collectionView: collectionView)
        case productCollectionView:
            return  setupProductsCell(index: indexPath, collectionView: collectionView)
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == categoriesCollectionView {
            return 18  // khoảng cách ngang giữa các cell = 18
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == productCollectionView {
            return 20  
        }
        
        return 8
    }
}
