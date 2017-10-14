@testable import TMDbCore
//import Kingfisher

import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()
let assembly = CoreAssembly()

//Creacción del imageRepository sin assembly, creando el objeto directamente
//let config = WebServiceConfiguration.default
//let webService = WebService(configuration: .default)
//let imageRepository = ImageRepository(webService: webService,
//                                      imageManager: KingfisherManager.shared)

let imageRepository = assembly.imageLoadingAssembly.imageRepository

imageRepository.image(at: "ncEmkHADNggjR0dlerOIHqmiY0O.jpg", size: .w780)
	.subscribe(onNext: {
		let image = $0
		print(image)
	})
	.disposed(by: disposeBag)
