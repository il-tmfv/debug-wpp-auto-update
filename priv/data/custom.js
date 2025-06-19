window.custom = {};
window.custom.messageStore = {
  adminsMessages: [],
  incomingMessages: [],
}


window.custom.findAndClickRefreshButton = function () {
  const refreshButton = document.querySelector('[data-ref]').querySelector('span').querySelector('button')

  if (refreshButton){
      refreshButton.click()
      return true;
  }

  return false
}


window.custom.findAndClickUpdateButton = function () {
  const updateButton = document.querySelector('[data-testid="alert-update"]')

  if (updateButton){
      updateButton.click()
      return true;
  }

  return false
}

window.custom.findQrCode = function () {
  const qrCode = document.querySelector('[data-ref]')

  if (qrCode){
      return {"fullCode": qrCode.dataset.ref};
  }

  return false
}

window.custom.messageStore.checkMessageStoringEnable = function() {
  if (WPP.ev.ev._events["chat.new_message"] && WPP.ev.ev._events["chat.new_message"].length == 1){
    return true
  }else{
    return false
  }
}

window.custom.messageStore.initMessageStoring = function () {

  if (window.custom.messageStore.checkMessageStoringEnable() == false){
    WPP.on('chat.new_message', (msg) => {
      console.log(msg)
      console.log(`msg.id._serialized : ${msg.id._serialized}`)
      console.log(`msg.body : ${msg.body}`)
      console.log(`msg.id.fromMe : ${msg.id.fromMe}`)
      console.log(`msg.from.server: ${msg.from.server}`)
      console.log(`msg.type : ${msg.type}`)
      console.log(`msg.to._serialized: ${msg.to._serialized}`)

      ReplyToMessageId =
              typeof(msg.quotedMsg) == "undefined" ? null :
              typeof(msg.quotedMsg.id) == "undefined" ? `${msg.quotedParticipant != msg.id.remote}_${msg.id.remote}_${msg.quotedStanzaID}` :
              msg.quotedMsg.id._serialized;

      if(msg.id.fromMe == false && msg.from.server != "g.us" && msg.type == "chat"){

        if(msg.body && msg.body != ""){

          const newMsg = {
            chat_id: msg.to._serialized,
            sender_id: msg.from._serialized,
            sender_name: msg.senderObj.name,
            pushname: msg.senderObj.pushname,
            message: {id: msg.id._serialized,
                      reply_to_message_id: ReplyToMessageId,
                      text: msg.body,
                      timestamp: msg.t,
                      type: "text"},
            admin_message: {}
          }

          window.custom.messageStore.incomingMessages.push(newMsg)
        }
      };

      if(msg.id.fromMe == true && msg.from.server != "g.us" && msg.type == "chat"){

        const admNewMsg = {
          chat_id: msg.to._serialized,
          sender_id: msg.from._serialized,
          sender_name: msg.senderObj.name,
          pushname: msg.senderObj.pushname,
          message: {},
          admin_message: {id: msg.id._serialized,
                          reply_to_message_id: ReplyToMessageId,
                          text: msg.body,
                          timestamp: msg.t,
                          type: "text"}
        }

        window.custom.messageStore.adminsMessages.push(admNewMsg)
      }

      if(msg.id.fromMe == false && msg.from.server != "g.us" && ["image", "document", "video", "audio", "ptt"].includes(msg.type)){
          const newMsg = {
            chat_id: msg.to._serialized,
            sender_id: msg.from._serialized,
            sender_name: msg.senderObj.name,
            pushname: msg.senderObj.pushname,
            message: {id: msg.id._serialized,
                      reply_to_message_id: ReplyToMessageId,
                      file_data: {download_url: msg.deprecatedMms3Url,
                                  mime_type: msg.mimetype,
                                  media_key: msg.mediaKey,
                                  caption: msg.caption
                                },
                      timestamp: msg.t,
                      type: msg.type},
            admin_message: {}
          }

          window.custom.messageStore.incomingMessages.push(newMsg)
      };

      if(msg.id.fromMe == true && msg.from.server != "g.us" && ["image", "document", "video", "audio", "ptt"].includes(msg.type)){

        const admNewMsg = {
          chat_id: msg.to._serialized,
          sender_id: msg.from._serialized,
          sender_name: msg.senderObj.name,
          pushname: msg.senderObj.pushname,
          message: {},
          admin_message: {id: msg.id._serialized,
                          reply_to_message_id: ReplyToMessageId,
                          file_data: {download_url: msg.deprecatedMms3Url,
                                      mime_type: msg.mimetype,
                                      media_key: msg.mediaKey,
                                      caption: msg.caption
                                    },
                          timestamp: msg.t,
                          type: msg.type}
        }

        window.custom.messageStore.adminsMessages.push(admNewMsg)
      }
    });

    return true
  }else{

    return false
  }
}

window.custom.messageStore.getIncomingMessageStore = function () {
  let incMsg = window.custom.messageStore.incomingMessages

  try{
    return incMsg

  } finally {
    console.log(`incoming messages Readed`)

    if(incMsg.length > 0){
      window.custom.messageStore.incomingMessages = []
    }
  }
}

window.custom.messageStore.getAdminsMessageStore = function () {
  let admMsg = window.custom.messageStore.adminsMessages

  try{
    return admMsg
  } finally {
    console.log(`admin messages Readed`)

    if(admMsg.length > 0){
      window.custom.messageStore.adminsMessages = []
    }
  }
}

window.custom.messageStore.getAllMessageStore = function () {
  let incMsg = window.custom.messageStore.incomingMessages
  let admMsg = window.custom.messageStore.adminsMessages

  try{
    return incMsg.concat(admMsg)

  } finally {
    console.log(`all messages Readed`)

    if(incMsg.length > 0){
      window.custom.messageStore.incomingMessages = []
    }
    if(admMsg.length > 0){
      window.custom.messageStore.adminsMessages = []
    }
  }
}


