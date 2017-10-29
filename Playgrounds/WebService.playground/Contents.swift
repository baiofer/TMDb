@testable import TMDbCore

import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()
let assembly = CoreAssembly(navigationController: UINavigationController())
let webService = assembly.webServiceAssembly.webService

let endpoint = Endpoint.configuration
let urlRequest = endpoint.request(with: URL(string: "https://api.themoviedb.org/3")!, adding: ["api_key" : "fistro"])
print(urlRequest)

// Load configuration

webService.load(Configuration.self, from: .configuration)
	.subscribe(onNext: { print($0.images.baseURL) })
	.disposed(by: disposeBag)

webService.load(Page<Show>.self, from: .showsOnTheAir(page:1))
    .subscribe(onNext: { print($0) }, onError: { print($0) })
    .disposed(by: disposeBag)

let region = Locale.current.regionCode!
webService.load(Page<Movie>.self, from: .moviesNowPlaying(region: "ES", page: 1))
    .subscribe(onNext: { print($0) }, onError: { print($0) })
    .disposed(by: disposeBag)

