//
//  FeaturedPresenter.swift
//  TMDbCore
//
//  Created by Fernando Jarilla on 11/10/2017.
//  Copyright © 2017 Fernando Jarilla. All rights reserved.
//

import RxSwift

protocol FeaturedView: class {
    var title: String? { get set }
	func setShowsHeaderTitle(_ title: String)
	func setMoviesHeaderTitle(_ title: String)

	func update(with shows: [Show])
	func update(with movies: [Movie])
}

final class FeaturedPresenter {
    //Dependencias
    private let detailNavigator: DetailNavigator
    private let repository: FeaturedRepositoryProtocol
    
    //Inyección de las dependencias por constructor
    init(detailNavigator: DetailNavigator, repository: FeaturedRepositoryProtocol) {
        self.detailNavigator = detailNavigator
        self.repository = repository
    }
    
	weak var view: FeaturedView?
    private let disposeBag = DisposeBag()

	func didLoad() {
        view?.title = (NSLocalizedString("Featured", comment: ""))
		view?.setShowsHeaderTitle(NSLocalizedString("ON TV", comment: ""))
		view?.setMoviesHeaderTitle(NSLocalizedString("IN THEATERS", comment: ""))

		loadContents()
	}

	func didSelect(show: Show) {
		detailNavigator.showDetail(withIdentifier: show.identifier, mediaType: .show)
	}

	func didSelect(movie: Movie) {
		detailNavigator.showDetail(withIdentifier: movie.identifier, mediaType: .movie)
	}
}

private extension FeaturedPresenter {
    func loadContents() {
        let showsOnTheAir = repository.showsOnTheAir().map { $0.prefix(3) }
        let moviesNowPlaying = repository.moviesNowPlaying(region: Locale.current.regionCode!)
            .map { $0.prefix(3) }
        Observable.combineLatest(showsOnTheAir, moviesNowPlaying) { shows, movies in
            return (shows, movies)
        }
        .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] shows, movies in
                guard let `self` = self else { return }
                self.view?.update(with: Array(shows))
                self.view?.update(with: Array(movies))
        })
        .disposed(by: disposeBag)
    }
}
