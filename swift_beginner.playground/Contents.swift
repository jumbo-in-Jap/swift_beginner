//: Playground - noun: a place where people can play

import UIKit

// swift 2.0で覚えたい構文
// http://www.slideshare.net/tomohirokumagai54/swift-20-cswift

//// 早期Exit -------------------------------

var maybeNil:Int? = 10

func nilCheck(){
    guard let nilVal = maybeNil else{
        print("Nilだよ")
        return
    }
    
    var a = Dictionary<String,Int>()
    a["key"] = 1
    
    // 配列の値が存在し、なおかつ1でなければreturnする
    // 構文が複雑になるのであまり好まれない気もする・・・
    guard let value = a["key"] where value != 1 else {
        print("nil")
        return
    }

    
    // これ以降使える
    let _ = nilVal

}

nilCheck()

/*
「特定の処理を引数がnil立った場合に進ませたくない」というときに重宝します。
return
break
continue
throw
のいずれかをいれなければコンパイルエラーになるので書き忘れを防げる

＊参考
http://llcc.hatenablog.com/entry/2015/06/13/235129
http://qiita.com/mishimay/items/75fb0958f33079ff0e8a
http://qiita.com/mishimay/items/75fb0958f33079ff0e8a
*/


//// defer --------------------------------

func deferSample() {
    // playgorund だと動かない、Runしてみてください
    defer {
        print("defered 1")
    }
    defer {
        print("defered 2")
    }
    defer {
        print("defered 3")
    }
    print("Hello, World!")
}

deferSample() // 3,2,1の順番で実行される

/*
「メソッド内で必ずしなければいけない後始末」などに
使ってください。「fileをいじって、closeする処理」「メモリ解放」
「ローディングアニメーション解除」などがそれにあたります

＊参考
http://cuto.unirita.co.jp/gostudy/post/defer/
https://mynavi-agent.jp/it/geekroid/2015/09/swift6ios9swift20.html
*/

//// try catch -------------------------------

enum ValidationError:ErrorType{
    case NotSetValue(value: Int)
}

do {
    // throw error
    let val = 10
    throw ValidationError.NotSetValue(value: val)
    
}catch ValidationError.NotSetValue(let setValue){ // ここの値の渡り方が少し特殊
    print("Is Invaldate Value 10")
}catch let error as NSError{ // NSErrorにキャストもできる
    print("Other Exception catch")
}

/*
「アプリならビルドしておかしければ気づけるじゃん・・・」はもう古いのです。
時代はException、他の実装者が自分の用意したメソッドを正しく使えるように
きちんと例外を使いましょう

実装例
「PageViewContorllerをinitするときに変な使い方をしないでよ！」というのを
エラーメッセージでちゃんんと教えてあげる
https://github.com/kitasuke/PagingMenuController/blob/47d8fd747ec98abb1b305fd567fce6671214e236/Pod/Classes/PagingMenuController.swift#L494
*/


//// tupple value check -------------------------------

let tupleVal = (10, 20)

// 複雑なif文を回避dできる
switch tupleVal{
    // 範囲指定できる
    case (0...5, 0...5):  print("first match")
    case (0...10, 0...20):print("second match")
    
    // where 構文
    case (let leftVal, let rightVal) where leftVal < 100 && rightVal < 100:
    print("third match")
    
    default:print("default")
}

/*
この辺りはすぐ用途が思いつくはず「TableViewのindexの値の範囲でアクションを決めたい」など
*/


//// Protocol Extension

// 描き途中

/*

ServiceクラスはProtocolとして実装は持たず、interfaceとしてのみ動くべきなのでは
http://d.hatena.ne.jp/torazuka/20110127/service
https://github.com/d108/MVVM-in-Swift/blob/4f96206c41db25a9547b3144776dea28a503465c/RWTFlickrSearch/ViewModel/SwiftViewModelServices.swift

なんでもクラスにしない・・・Protocol Oriented Programming
http://qiita.com/mono0926/items/bb52e657df6978713334

*/
