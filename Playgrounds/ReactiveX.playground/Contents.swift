//: Playground - noun: a place where people can play

@testable import TMDbCore

import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

enum APIError: Error {
    case invalidKey
    case notAnImage
}

struct UserResponse: Decodable {
    struct User: Decodable {
        struct Name: Decodable {
            let title: String
            let first: String
            let last: String
        }
        let name: Name
        let email: String
        struct Picture: Decodable {
            let large: URL
            let medium: URL
            let thumbnail: URL
        }
        let picture: Picture
        struct Id: Decodable {
            let name: String?
            let value: String?
        }
        let id: Id
    }
    let results: [User]
}



let empty = Observable<Int>.empty()
let single = Observable.just("Hello")
let some = Observable.from(["😀", "🤡"])
let error = Observable<Data>.error(APIError.invalidKey)
let hello = Observable<String>.create { (observer) -> Disposable in
    observer.onNext("Hello")
    observer.onCompleted()
    return Disposables.create()
}

//Nos suscribimos con con subscribe(on: (Event<String>) -> void)
error.subscribe { (event) in
    switch event {
    case .next(let value):
        print(value)
    case .error(let error):
        print(error)
    case .completed:
        print("complited")
    }
}
//Otra forma de subscribirse es
single.subscribe(onNext: { (value) in
    print(value)
}, onError: { (error) in
    print(error)
}, onCompleted: {
    print("complited")
}) {
    print("disposed")
}

// Petición a la API randomuser.me/api
let session = URLSession(configuration: .default)
let apiURL = URL(string: "https://randomuser.me/api")!
let decoder = JSONDecoder()

func data(with url: URL) -> Observable<Data> {
    return Observable<Data>.create { observer in
        let task = session.dataTask(with: url) { data, _, error in
            if let error = error {
                observer.onError(error)
            } else {
                observer.onNext(data ?? Data())
                observer.onCompleted()
            }
        }
        task.resume()
        return Disposables.create {
            print("cancelled")
            task.cancel()
        }
    }
}

func randomUser() -> Observable<UserResponse> {
    return data(with: apiURL).map { data in
        try decoder.decode(UserResponse.self, from: data)
    }
}

func image(with url: URL) -> Observable<UIImage> {
    return data(with: url).map {
        guard let image = UIImage(data: $0) else {
            throw APIError.notAnImage
        }
        return image
    }
}

//let d2 = randomUse.subscribe(onNext: { data in
//    print(String(data: data, encoding: .utf8)!)
//})
//d2.dispose()

let disposeBag = DisposeBag()

let disposable = randomUser()
    .map { $0.results[0] }
    .flatMap {
        return image(with: $0.picture.large)
        
    }
    .observeOn(MainScheduler.instance)
    .subscribe(onNext: {
        let temp = $0
        print($0)
    }, onError: { error in
        print(error)
    }).disposed(by: disposeBag)



