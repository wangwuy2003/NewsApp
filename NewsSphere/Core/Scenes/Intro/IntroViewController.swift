//
//  IntroVC.swift
//  Face_AI_IOS
//
//  Created by Tran Nghia Pro on 17/9/24.
//

import UIKit

class IntroViewController: UIViewController {
    
    @IBOutlet weak var bgAds: UIView!
    @IBOutlet weak var heightBgAds: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    
    private var currentPageIndex = 0
    private var isScrollingByButton = false
    private var titleModel: [String] = []
    private var subtitleModel: [String] = []
    private var imgModel: [String] = ["bg_intro_0", "bg_intro_1", "bg_intro_2"]
    
    let bgNative1 = UIView()
    
    private var firstNative1 = true
    private var firstNative2 = true
    private var firstNative3 = true
    
    enum Priority: UILayoutPriority.RawValue {
        
        case high = 1000
        case low = 999
        
        var p: UILayoutPriority {
            return UILayoutPriority(rawValue: self.rawValue)
        }
    }
    
    let highPriority = Priority.high.p
    let lowPriority = Priority.low.p
    
    private let presenter : IntroPresenter
    
    init(presenter: IntroPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configModel()
        configCollectionView()
    }
    
    private func addFirstView() {
        bgNative1.frame = bgAds.bounds
        bgAds.addSubview(bgNative1)
        bgNative1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bgNative1.topAnchor.constraint(equalTo: bgAds.topAnchor),
            bgNative1.bottomAnchor.constraint(equalTo: bgAds.bottomAnchor),
            bgNative1.leadingAnchor.constraint(equalTo: bgAds.leadingAnchor),
            bgNative1.trailingAnchor.constraint(equalTo: bgAds.trailingAnchor)
        ])
    }
    
    func removeAllChildViewControllers() {
        // Duyệt qua tất cả child view controllers
        for child in children {
            // Gọi willMove(toParent: nil)
            child.willMove(toParent: nil)
            // Xóa view của child view controller khỏi hệ thống phân cấp view của parent
            child.view.removeFromSuperview()
            // Gọi removeFromParent() để hoàn tất việc xóa
            child.removeFromParent()
        }
    }
    
    private func configCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "IntroCVC", bundle: nil), forCellWithReuseIdentifier: "IntroCVC")
    }
    
    private func configModel() {
        titleModel = [Localized.Intro.intro1Title,
                      Localized.Intro.intro2Title,
                      Localized.Intro.intro3Title]
        subtitleModel = [Localized.Intro.intro1Subtitle,
                         Localized.Intro.intro2Subtitle,
                         Localized.Intro.intro3Subtitle]
        nextBtn.setTitle(Localized.Intro.next, for: .normal)
        nextBtn.setCornerRadius(16)
    }
    
    private func nextCell(index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.performBatchUpdates({ [weak self] in
            guard let self  = self else { return }
            self.collectionView.reloadData()
        }) { [weak self] _ in
            guard let self = self else { return }
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
            self.collectionView.collectionViewLayout.invalidateLayout()
        }
    }
    
    private func pushContainerVC() {
//        let vc = IAPVC()
//        vc.nameIAP = "Intro"
//        vc.isSplashPush = true
//        self.navigationController?.setViewControllers([vc], animated: false)
    }

    @IBAction func continueClicked(_ sender: Any) {
        if isScrollingByButton == false {
            switch currentPageIndex {
            case 0:
                nextCell(index: 1)
            case 1:
                nextCell(index: 2)
            case 2:
                presenter.navigateToLogin()
                Application.shared.markOnboardingCompleted()
            default:
                break
            }
        }
    }
}

extension IntroViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroCVC", for: indexPath) as? IntroCVC else { return UICollectionViewCell() }
        let index = indexPath.row
        cell.bgIntro.image = UIImage(named: imgModel[index])
        cell.titleLbl.text = titleModel[index]
        cell.subtitleLbl.text = subtitleModel[index]
        cell.setupCurrent(at: index)
        return cell
    }
}

extension IntroViewController: UICollectionViewDelegate {
    
}

extension IntroViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // Bắt đầu cuộn, đặt biến cờ thành true
        isScrollingByButton = true
    }
    
    internal func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        isScrollingByButton = false
    }
    
    private func scrollViewDidEndDeclaring(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        isScrollingByButton = false
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        let currentPage = Int((scrollView.contentOffset.x + width / 2) / width)
        if currentPage != currentPageIndex {
            if currentPage >= 0 && currentPage <= 2 {
                currentPageIndex = currentPage
            }
        }
    }
}

extension IntroViewController {
    
}


