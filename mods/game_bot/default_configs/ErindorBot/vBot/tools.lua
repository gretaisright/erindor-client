-- tools tab
setDefaultTab("Tools")

macro(60000, "Send message on advertising", function()
  local trade = getChannelId("advertising")
  if not trade then
    trade = getChannelId("trade")
  end
  if trade and storage.autoTradeMessage:len() > 0 then
    sayChannel(trade, storage.autoTradeMessage)
  end
end)
UI.TextEdit(storage.autoTradeMessage or "Write your message", function(widget, text)
  storage.autoTradeMessage = text
end)

UI.Separator()
