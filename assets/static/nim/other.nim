include karax / prelude

var lines: seq[kstring] = @[]

proc createDom(): VNode =
  result = buildHtml(tdiv):
    button:
      text "click me!"
      proc onclick(ev: Event; n: VNode) =
        lines.add "Hello new user"
    for x in lines:
      tdiv:
        text x

setRenderer createDom