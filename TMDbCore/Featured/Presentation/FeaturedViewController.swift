//
//  FeaturedViewController.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 11/10/2017.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class FeaturedViewController: UIViewController {
	// MARK: - Outlets

	@IBOutlet private var showsLabel: UILabel!
	@IBOutlet private var showsStackView: UIStackView!
	@IBOutlet private var moviesLabel: UILabel!
	@IBOutlet private var moviesStackView: UIStackView!

	// MARK: - Properties

    //Dependencias
	private let presenter: FeaturedPresenter
	private let cardPresenter: CardPresenter
    private let searchNavigator: SearchNavigator
    
	private let disposeBag = DisposeBag()

	// MARK: - Initialization
    //Inyección de dependencias por constructor
	init(presenter: FeaturedPresenter,
         cardPresenter: CardPresenter,
         searchNavigator: SearchNavigator) {
		self.presenter = presenter
		self.cardPresenter = cardPresenter
        self.searchNavigator = searchNavigator

		super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        searchNavigator.installSearch(viewController: self)
        presenter.view = self
		presenter.didLoad()
    }
}

extension FeaturedViewController: FeaturedView {
    func setShowsHeaderTitle(_ title: String) {
		showsLabel.text = title
	}

	func setMoviesHeaderTitle(_ title: String) {
		moviesLabel.text = title
	}

	func update(with shows: [Show]) {
		showsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

		let cardViews: [UIView] = shows.map { show in
			let cardView = CardView.instantiate()
			cardPresenter.present(show: show, in: cardView)
			cardView.tapGestureRecognizer.rx.event
				.subscribe(onNext: { [weak self] _ in
					self?.presenter.didSelect(show: show)
				})
				.disposed(by: disposeBag)

			return cardView
		}

		cardViews.forEach { showsStackView.addArrangedSubview($0) }
	}

	func update(with movies: [Movie]) {
		moviesStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

		let cardViews: [UIView] = movies.map { movie in
			let cardView = CardView.instantiate()
			cardPresenter.present(movie: movie, in: cardView)
			cardView.tapGestureRecognizer.rx.event
				.subscribe(onNext: { [weak self] _ in
					self?.presenter.didSelect(movie: movie)
				})
				.disposed(by: disposeBag)

			return cardView
		}

		cardViews.forEach { moviesStackView.addArrangedSubview($0) }
	}
}
