# -----------------------------------------------------------------------------------------------------------------------------
# ファイルフィールドで選択されたファイルサイズをチェックする
# サイズオーバーしていれば警告文をalertする。
# -----------------------------------------------------------------------------------------------------------------------------
@cmn_file_size_check = (selector, size_mb) ->
  $(selector).bind 'change', ->
    if @files[0] != undefined
      size_in_megabytes = @files[0].size / 1024 / 1024
      if size_in_megabytes > size_mb
        alert "Maximum file size is #{size_mb}MB. Please choose a smaller file."
      return

# -----------------------------------------------------------------------------------------------------------------------------
# スクロール位置が一番上か
# -----------------------------------------------------------------------------------------------------------------------------
@scroll_top = (selector) ->
  if $(selector).scrollTop() == 0
    return true
  else
    return false

# -----------------------------------------------------------------------------------------------------------------------------
# スクロール位置が一番下か
# -----------------------------------------------------------------------------------------------------------------------------
@scroll_bottom = (selector) ->
  # overflowした分も含めた要素の高さ
  scrollHeight = $(selector).get(0).scrollHeight
   # 要素の表示されている範囲の高さ(padding含む)
  innerHeight = $(selector).innerHeight()
  # スクロールバーの上端位置
  scrollTop = $(selector).scrollTop()

  if (scrollHeight - innerHeight) <= scrollTop
    return true
  else
    return false
