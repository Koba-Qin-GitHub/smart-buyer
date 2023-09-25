
// API_KEY
const mouser_apiKey = gon.mouser_apiKey





// ページが完全に読み込まれた直後に実行
window.onload = function(){
  // document.getElementById("favorite_new_btn").classList.add("hidden");
  // document.getElementById("favorite_delete_btn").classList.remove("hidden");

  // search();
  // favorite_new_btn();
  // favorite_check()
  
}

// function gon(){
//   const favorite_blank_check = gon.favorite_blank_check
//   console.log(favorite_blank_check);
// }




// データ取得のイベント(単語入力  → 検索) 
function search() { 
  // document.getElementById('search_form').onsubmit = function(event) {      // クリックされた時に発動
    // event.preventDefault();
    var item = gon.item
    var search_word = item.name
    
    console.log(search_word);

    // console.log(document.getElementById('search_word'));
    
    // const search_word = document.getElementById('search_word').value;
    // console.log(search_word);
  


 
    // if(favorite_check = True) {
    //   window.alert('「正式品番」として検索しましたが、ヒットしませんでした。');
    // } else if(result === 1) {
    //   response_item_info(response);
    // } else {
    //     window.alert('複数ヒットしました。完全一致の「正式品番」を入力してください');
    // }

    // 各処理へ分岐
    // post(search_word);
    ajaxRequest(search_word);
  // };
}



//itemsテーブルを保存するための非同期通信
// function post (search_word){
//     const form = document.getElementById("search_form");
//     const formData = new FormData(form);
//     const XHR = new XMLHttpRequest();
//     XHR.open("POST", "/items", true);
//     XHR.responseType = "json";
//     XHR.send(formData);                             // JavaScript より リクエスト送信
    

    // XHR.onload = () => {
    //   const item_id = XHR.response.item.id;
    //   favorite(item_id);
    // };
// }






// Mouser_APIからのデータ取得(非同期通信)
function ajaxRequest(search_word) {
  $.ajax({
    url: 'https://api.mouser.com/api/v1/search/partnumber?apiKey=' + mouser_apiKey ,
    crossDomain: true,
    method: 'post',
    headers: {
      'accept': 'application/json'
    },
    contentType: 'application/json',
    data: JSON.stringify({
      'SearchByPartRequest': {
        'mouserPartNumber': search_word,
        'partSearchOptions': ''
      }
    })

  // 非同期通信が成功した時
  }).done(function(response) {
    var result = response.SearchResults.NumberOfResult;
    // console.log(response);
    // Mouser_APIでの「検索結果数」のよる条件分岐
    if(result === 0) {
      window.alert('「正式品番」として検索しましたが、ヒットしませんでした。');
    } else if(result === 1) {
      response_item_info(response);
    } else {
        window.alert('複数ヒットしました。完全一致の「正式品番」を入力してください');
    }

  // 非同期通信が失敗した時
  }).fail(function(){
    window.alert('通信エラーのため、検索することができませんでした。');
  });
}





// 検索ヒットが１件の場合
function response_item_info (res) {
  var result_PartNumber = res.SearchResults.Parts[0].ManufacturerPartNumber;
  var result_Stock = res.SearchResults.Parts[0].AvailabilityInStock;
  var result_Image = res.SearchResults.Parts[0].ImagePath;
  var result_Manufacturer = res.SearchResults.Parts[0].Manufacturer;
  var result_Price = res.SearchResults.Parts[0].PriceBreaks[0].Price;
  var result_ItemUrl = res.SearchResults.Parts[0].ProductDetailUrl;

  document.getElementById('result_PartNumber').textContent = `正式品番：${result_PartNumber}`; 
  document.getElementById('result_Stock').textContent = `在庫数量：${result_Stock} 個`; 
  document.getElementById('result_Image').src = result_Image; 
  document.getElementById('result_Manufacturer').textContent = `メーカー：${result_Manufacturer}`; 
  document.getElementById('result_Price').textContent = `　単価　：${result_Price}〜`; 
  document.getElementById('result_ItemUrl').textContent = `ECサイト商品詳細ページへ`; 
  document.getElementById('result_ItemUrl').setAttribute('href', result_ItemUrl);



  // 「在庫あり」「在庫無し」判定の表示
  const judge_exist = document.getElementById("stock_exist")
  const judge_none = document.getElementById("stock_none")
  
  if(result_Stock === 0) {
    // # 「在庫あり」を表示
    judge_none.classList.remove("hidden");
    judge_none.classList.add("judge_none");
    
  } else if(result_Stock >= 1) {
    
    // # 「在庫無し」を表示
    judge_exist.classList.remove("hidden");
    judge_exist.classList.add("judge_exist");

  } else {

  }


  console.log("mouser_レスポンスOK");
  // console.log(favorite_blank_check);

}









// お気に入り登録・削除 処理
// function favorite(item_id){
//   const first_url = location.protocol + "//" + location.host   // 「https://localhost:3001/」の取得
//   var url = first_url + "/items/" + item_id + "/favorites";
//   console.log(url);

//   document.getElementById('favorite_new').setAttribute('href', url);
//   document.getElementById('favorite_delete').setAttribute('href', url);

  
//   document.getElementById("favorite_new_btn").classList.remove("hidden");
//   document.getElementById("favorite_delete_btn").classList.add("hidden");
  
  // const favorite_blank_check = gon.favorite_blank_check
  // console.log(favorite_blank_check);

//   console.log("お気に入りボタン_URL_OK");
// }


// お気に入り登録 アニメーション
function favorite_new_btn(){
  console.log("OK!");
  const favorite_new = document.getElementById("favorite_new_btn");
  favorite_new.addEventListener("click", (e) => {
    e.preventDefault();

    console.log("favorite_new_btn OK!!!");
  });
  // };
  
  // document.getElementById('favorite_new_btn').onsubmit = function(event) {      // クリックされた時に発動
  //   event.preventDefault();
  
  // document.getElementById("favorite_icon").classList.remove("hidden");
  // document.getElementById("favorite_icon").classList.add("favorite_icon");

  // };

  // document.getElementById('favorite_delete').onclick = function(){
  //   document.getElementById("favorite_new_btn").classList.remove("hidden");
  //   document.getElementById("favorite_delete_btn").classList.add("hidden");
  // };

  // if(favorite_save_result === true) {
  //   document.getElementById("favorite_new_btn").classList.add("hidden");
  //   document.getElementById("favorite_delete_btn").classList.remove("hidden");
  // } else {
  //   document.getElementById("favorite_new_btn").classList.remove("hidden");
  //   document.getElementById("favorite_delete_btn").classList.add("hidden");
  // }
}





