//
//  ブランチメニュー選択肢の更新
//   update_branch(company選択肢のid, オブジェクトのモデル名小文字)
//      オブジェクトモデル名小文字はフォームをuserとtrackで共有するため
//      フォーム作成時のオブジェクトモデル名を小文字で与えることで
//      フォーム内idをすり合わせする
//
//      Ajaxでbranches#update_branch_menusメソッドを呼び出しjsでメニューとして
//      HTML内のbranch_select内のinnerHTMLを書き換える
//

function update_branch(val, objectkind) {
    
   $.ajax({
        url: "/branches/update_branch_menus",
        type: "POST",
        data: {company : val, object: objectkind},
        dataType: "script",
    });

}