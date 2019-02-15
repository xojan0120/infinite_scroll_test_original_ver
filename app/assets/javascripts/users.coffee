$(document).on "turbolinks:load", ->
  $(".users").on "scroll", (event) ->
    current_url = location.pathname + location.search

    if scroll_top(event.target)
      # ブラウザの履歴(記憶している1つ前のURL)を現在のURLで置き換え
      state = { url: current_url }
      history.replaceState(state, null, current_url)

      # 現在のURLから現在のページ数を取得
      current_page = parseInt($.url(current_url).param('page'))
      if isNaN(current_page)
        current_page = 1

      # 次のページ数
      next_page = current_page + 1

      # 次ページを読み込む
      url  = "/users/index?page=" + next_page
      ajax = $.ajax({ url: url, data: "GET", dataType: "script" })
      ajax.done (data, status, xhr) ->
        if status == "success" # ステータスコードをチェックする場合は、xhr.status == 200
          # ブラウザのURLを次ページのURLにする
          state = { url: url }
          history.pushState(state, null, url)

  $(window).on "popstate", (event) ->
    history_url = event.originalEvent.state.url
    window.location.href = history_url
