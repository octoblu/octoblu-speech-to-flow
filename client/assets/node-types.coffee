module.exports = [
  {
    "resourceType": "flow-node-type",
    "name": "Belkin Wemo",
    "class": "device-wemo",
    "type": "device:wemo",
    "category": "device",
    "uuid": "2836e14d-ef41-40b3-8861-24ae5464da97",
    "defaults": {
      "category": "device",
      "configureWhitelist": [
        "*"
      ],
      "connector": "meshblu-wemo",
      "discoverWhitelist": [
        "48982de8-fff1-4d0f-89bf-36dd59a98121"
      ],
      "gateblu": "1f116bfb-b25e-4d2e-b96c-cd828c778021",
      "geo": {
        "range": [
          1138311168,
          1138318591
        ],
        "country": "US",
        "region": "CA",
        "city": "Goleta",
        "ll": [
          34.5021,
          -120.1287
        ],
        "metro": 855
      },
      "ipAddress": "67.217.90.1",
      "messageSchema": {
        "type": "object",
        "properties": {
          "on": {
            "type": "boolean",
            "required": true
          }
        }
      },
      "name": "Wemo",
      "online": false,
      "onlineSince": "2015-05-04T22:57:35.358Z",
      "options": {
        "searchTimeout": 30000,
        "friendlyName": "WeMoDemo"
      },
      "optionsSchema": {
        "type": "object",
        "properties": {
          "friendlyName": {
            "type": "string",
            "required": true
          },
          "searchTimeout": {
            "type": "number",
            "required": true,
            "default": 10000
          }
        }
      },
      "owner": "48982de8-fff1-4d0f-89bf-36dd59a98121",
      "protocol": "websocket",
      "receiveWhitelist": [
        "*"
      ],
      "secure": false,
      "sendWhitelist": [
        "*"
      ],
      "timestamp": "2015-05-04T22:57:35.709Z",
      "type": "device:wemo",
      "uuid": "2836e14d-ef41-40b3-8861-24ae5464da97",
      "staticMessage": {},
      "useStaticMessage": true,
      "nodeType": {
        "_id": "53c9b82ff400e177dca325a4",
        "category": "device",
        "description": "Belkin Wemo home automation",
        "helpText": "A series of products from Belkin International, Inc. that allows users to control home electronics from anywhere.",
        "enabled": true,
        "name": "Belkin Wemo",
        "skynet": {
          "type": "device",
          "subtype": "wemo"
        },
        "connector": "meshblu-wemo",
        "type": "device:wemo"
      }
    },
    "input": 1,
    "output": 1,
    "helpText": "A series of products from Belkin International, Inc. that allows users to control home electronics from anywhere.",
    "formTemplatePath": "/pages/node_forms/device_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "MacBlu",
    "class": "device-gateblu",
    "type": "device:gateblu",
    "category": "device",
    "uuid": "1f116bfb-b25e-4d2e-b96c-cd828c778021",
    "defaults": {
      "autoRegister": true,
      "category": "device",
      "devices": [
        {
          "uuid": "2836e14d-ef41-40b3-8861-24ae5464da97",
          "token": "48375cd6a5342a22cc78fe1d42ac5da135cfa67f",
          "connector": "meshblu-wemo",
          "type": "device:wemo"
        }
      ],
      "discoverWhitelist": [
        "48982de8-fff1-4d0f-89bf-36dd59a98121"
      ],
      "geo": {
        "range": [
          1138311168,
          1138318591
        ],
        "country": "US",
        "region": "CA",
        "city": "Goleta",
        "ll": [
          34.5021,
          -120.1287
        ],
        "metro": 855
      },
      "ipAddress": "67.217.90.1",
      "logo": "https://ds78apnml6was.cloudfront.net/device/gateblu.svg",
      "name": "MacBlu",
      "nodeType": {
        "_id": "53c9b831f400e177dca325b0",
        "category": "device",
        "description": "Meshblu device connection manager",
        "helpText": "Meshblu device connection manager.",
        "enabled": true,
        "name": "Gateblu",
        "skynet": {
          "type": "device:gateblu"
        },
        "type": "device:gateblu"
      },
      "online": false,
      "onlineSince": "2015-05-04T22:57:28.350Z",
      "owner": "48982de8-fff1-4d0f-89bf-36dd59a98121",
      "protocol": "websocket",
      "resourceType": "node",
      "secure": false,
      "staticMessage": {},
      "timestamp": "2015-05-04T22:57:28.718Z",
      "type": "device:gateblu",
      "useStaticMessage": true,
      "uuid": "1f116bfb-b25e-4d2e-b96c-cd828c778021"
    },
    "input": 1,
    "output": 1,
    "helpText": "Meshblu device connection manager.",
    "formTemplatePath": "/pages/node_forms/device_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Test Hue",
    "class": "device-hue",
    "type": "device:hue",
    "category": "device",
    "uuid": "fc087956-44e5-4818-b54d-9522b7267cf7",
    "defaults": {
      "category": "device",
      "connector": "meshblu-hue",
      "discoverWhitelist": [
        "48982de8-fff1-4d0f-89bf-36dd59a98121"
      ],
      "gateblu": "236e659f-5fa9-48f0-98e6-4ab22e779324",
      "geo": {
        "range": [
          1185313024,
          1185313279
        ],
        "country": "US",
        "region": "AZ",
        "city": "Mesa",
        "ll": [
          33.4223,
          -111.8226
        ],
        "metro": 753
      },
      "ipAddress": "70.166.113.101",
      "messageSchema": {
        "type": "object",
        "properties": {
          "lightNumber": {
            "type": "number",
            "required": true
          },
          "useGroup": {
            "type": "boolean",
            "required": true,
            "default": false
          },
          "on": {
            "type": "boolean",
            "required": true
          },
          "color": {
            "type": "string",
            "required": true
          },
          "transitiontime": {
            "type": "number"
          },
          "alert": {
            "type": "string"
          },
          "effect": {
            "type": "string"
          }
        }
      },
      "name": "Test Hue",
      "online": false,
      "onlineSince": "2015-04-29T19:58:58.263Z",
      "options": {
        "apiUsername": "newdeveloper",
        "sensorPollInterval": 1000,
        "ipAddress": "192.168.1.1"
      },
      "optionsSchema": {
        "type": "object",
        "properties": {
          "ipAddress": {
            "type": "string",
            "required": true
          },
          "apiUsername": {
            "type": "string",
            "required": true,
            "default": "newdeveloper"
          },
          "sensorPollInterval": {
            "type": "integer",
            "required": true,
            "default": 1000
          }
        }
      },
      "owner": "48982de8-fff1-4d0f-89bf-36dd59a98121",
      "protocol": "websocket",
      "secure": false,
      "timestamp": "2015-04-29T19:58:58.486Z",
      "type": "device:hue",
      "uuid": "fc087956-44e5-4818-b54d-9522b7267cf7",
      "staticMessage": {},
      "useStaticMessage": true,
      "nodeType": {
        "_id": "53c9b82ff400e177dca325a3",
        "category": "device",
        "description": "Philips Hue light bulbs",
        "helpText": "Create your personal wireless lighting environment with the Philips Hue connected bulbs and wireless bridge.",
        "enabled": true,
        "name": "Philips Hue",
        "skynet": {
          "type": "device",
          "subtype": "hue"
        },
        "connector": "meshblu-hue",
        "type": "device:hue"
      }
    },
    "input": 1,
    "output": 1,
    "helpText": "Create your personal wireless lighting environment with the Philips Hue connected bulbs and wireless bridge.",
    "formTemplatePath": "/pages/node_forms/device_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Gateblu",
    "class": "device-gateblu",
    "type": "device:gateblu",
    "category": "device",
    "uuid": "236e659f-5fa9-48f0-98e6-4ab22e779324",
    "defaults": {
      "autoRegister": true,
      "configureWhitelist": [
        "*"
      ],
      "devices": [
        {
          "uuid": "fc087956-44e5-4818-b54d-9522b7267cf7",
          "token": "7c88b1c1fb93a0e40733c363ff011d63fe8a73c6",
          "connector": "meshblu-hue",
          "type": "device:hue"
        }
      ],
      "discoverWhitelist": [
        "48982de8-fff1-4d0f-89bf-36dd59a98121"
      ],
      "geo": {
        "range": [
          1185313024,
          1185313279
        ],
        "country": "US",
        "region": "AZ",
        "city": "Mesa",
        "ll": [
          33.4223,
          -111.8226
        ],
        "metro": 753
      },
      "ipAddress": "70.166.113.101",
      "logo": "https://ds78apnml6was.cloudfront.net/device/gateblu.svg",
      "name": "Gateblu",
      "online": false,
      "onlineSince": "2015-04-29T19:58:53.940Z",
      "owner": "48982de8-fff1-4d0f-89bf-36dd59a98121",
      "protocol": "websocket",
      "receiveWhitelist": [
        "*"
      ],
      "secure": false,
      "sendWhitelist": [
        "*"
      ],
      "timestamp": "2015-05-01T01:22:27.764Z",
      "type": "device:gateblu",
      "uuid": "236e659f-5fa9-48f0-98e6-4ab22e779324",
      "category": "device",
      "staticMessage": {},
      "useStaticMessage": true,
      "nodeType": {
        "_id": "53c9b831f400e177dca325b0",
        "category": "device",
        "description": "Meshblu device connection manager",
        "helpText": "Meshblu device connection manager.",
        "enabled": true,
        "name": "Gateblu",
        "skynet": {
          "type": "device:gateblu"
        },
        "type": "device:gateblu"
      }
    },
    "input": 1,
    "output": 1,
    "helpText": "Meshblu device connection manager.",
    "formTemplatePath": "/pages/node_forms/device_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Send Email",
    "class": "channel-email",
    "type": "channel:email",
    "category": "channel",
    "uuid": "4dbaa890-ee8f-11e4-83e5-1129589e64aa",
    "defaults": {
      "channelid": "542ce2ad47a930b1280b0d05",
      "channelActivationId": "55410aed484ac6130031b790",
      "uuid": "4dbaa890-ee8f-11e4-83e5-1129589e64aa",
      "name": "Send Email",
      "type": "channel:email",
      "category": "channel",
      "online": true,
      "useStaticMessage": true,
      "nodeType": {
        "_id": "9115e25c-8eed-40f8-a1d8-140a1ffea5be",
        "category": "channel",
        "description": "Send Email messages through Octoblu.",
        "helpText": "Send Email messages through Octoblu.",
        "enabled": true,
        "name": "Send Email",
        "skynet": {
          "type": "channel",
          "subtype": "email"
        },
        "channelid": "542ce2ad47a930b1280b0d05",
        "type": "channel:email"
      }
    },
    "input": 1,
    "output": 1,
    "helpText": "Send Email messages through Octoblu.",
    "formTemplatePath": "/pages/node_forms/channel_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Send SMS",
    "class": "channel-sms-send",
    "type": "channel:sms-send",
    "category": "channel",
    "uuid": "4dcad530-ee8f-11e4-b7cc-1d0715895eea",
    "defaults": {
      "channelid": "542c2f2eab1c05dde14544e0",
      "channelActivationId": "55410aee6f1b5c13007a934c",
      "uuid": "4dcad530-ee8f-11e4-b7cc-1d0715895eea",
      "name": "Send SMS",
      "type": "channel:sms-send",
      "category": "channel",
      "online": true,
      "useStaticMessage": true,
      "nodeType": {
        "_id": "7fadeaa0-4990-11e4-9bbb-e70e4226a18f",
        "category": "channel",
        "description": "Send SMS text messages through Octoblu.",
        "helpText": "Send SMS text messages through Octoblu.",
        "enabled": true,
        "name": "Send SMS",
        "skynet": {
          "type": "channel",
          "subtype": "sms-send"
        },
        "channelid": "542c2f2eab1c05dde14544e0",
        "type": "channel:sms-send"
      }
    },
    "input": 1,
    "output": 1,
    "helpText": "Send SMS text messages through Octoblu.",
    "formTemplatePath": "/pages/node_forms/channel_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "StockPrice",
    "class": "channel-stock-price",
    "type": "channel:stock-price",
    "category": "channel",
    "uuid": "4daa2dd0-ee8f-11e4-b7cc-1d0715895eea",
    "defaults": {
      "channelid": "53275d4841da719147d9e36a",
      "channelActivationId": "55410aed6f1b5c13007a934b",
      "uuid": "4daa2dd0-ee8f-11e4-b7cc-1d0715895eea",
      "name": "StockPrice",
      "type": "channel:stock-price",
      "category": "channel",
      "online": true,
      "useStaticMessage": true,
      "nodeType": {
        "_id": "53c9b836f400e177dca325bd",
        "category": "channel",
        "description": "Get YAHOO! Finance stock price",
        "helpText": "Get YAHOO! Finance stock price.",
        "enabled": true,
        "name": "StockPrice",
        "skynet": {
          "type": "channel",
          "subtype": "StockPrice"
        },
        "channelid": "53275d4841da719147d9e36a",
        "type": "channel:stock-price"
      }
    },
    "input": 1,
    "output": 1,
    "helpText": "Get YAHOO! Finance stock price.",
    "formTemplatePath": "/pages/node_forms/channel_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Twitter",
    "class": "channel-twitter",
    "type": "channel:twitter",
    "category": "channel",
    "uuid": "3a20f880-ee93-11e4-b7cc-1d0715895eea",
    "defaults": {
      "channelid": "5409f79403f1d8b163401370",
      "channelActivationId": "554111836f1b5c13007a9353",
      "uuid": "3a20f880-ee93-11e4-b7cc-1d0715895eea",
      "name": "Twitter",
      "type": "channel:twitter",
      "category": "channel",
      "online": true,
      "useStaticMessage": true,
      "nodeType": {
        "_id": "53c9b839f400e177dca325c7",
        "category": "channel",
        "description": "",
        "helpText": "An online social networking service that enables users to send and read short 140-character messages called \"tweets\".",
        "enabled": true,
        "name": "Twitter",
        "skynet": {
          "type": "channel",
          "subtype": "Twitter"
        },
        "channelid": "5409f79403f1d8b163401370",
        "type": "channel:twitter"
      }
    },
    "input": 1,
    "output": 1,
    "helpText": "An online social networking service that enables users to send and read short 140-character messages called \"tweets\".",
    "formTemplatePath": "/pages/node_forms/channel_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Weather",
    "class": "channel-weather",
    "type": "channel:weather",
    "category": "channel",
    "uuid": "5ed54070-ef9f-11e4-a3d6-0b31326ccd22",
    "defaults": {
      "channelid": "5337a38d76a65b9693bc2a9f",
      "channelActivationId": "5542d361b0f9bf130074d0b6",
      "uuid": "5ed54070-ef9f-11e4-a3d6-0b31326ccd22",
      "name": "Weather",
      "type": "channel:weather",
      "category": "channel",
      "online": true,
      "useStaticMessage": true,
      "nodeType": {
        "_id": "53c9b836f400e177dca325be",
        "category": "channel",
        "description": "",
        "helpText": "A super simple weather API, built as a simplified interface to the OpenWeatherMap API for maximizing development speed.",
        "enabled": true,
        "name": "Weather",
        "skynet": {
          "type": "channel",
          "subtype": "Weather"
        },
        "channelid": "5337a38d76a65b9693bc2a9f",
        "type": "channel:weather"
      }
    },
    "input": 1,
    "output": 1,
    "helpText": "A super simple weather API, built as a simplified interface to the OpenWeatherMap API for maximizing development speed.",
    "formTemplatePath": "/pages/node_forms/channel_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "When I am home turn the lights off",
    "class": "device-flow",
    "type": "device:flow",
    "category": "device",
    "uuid": "f9bb74b6-070d-493f-a8b1-5704b6c7b56c",
    "defaults": {
      "name": "When I am home turn the lights off",
      "uuid": "f9bb74b6-070d-493f-a8b1-5704b6c7b56c",
      "category": "device",
      "type": "device:flow",
      "staticMessage": {},
      "topic": "flow",
      "filterTopic": "message",
      "useStaticMessage": true,
      "nodeType": {}
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/device_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Simple Tweet When I am Home Flow",
    "class": "device-flow",
    "type": "device:flow",
    "category": "device",
    "uuid": "3c28cdde-344a-4462-9572-49e7b99e253d",
    "defaults": {
      "name": "Simple Tweet When I am Home Flow",
      "uuid": "3c28cdde-344a-4462-9572-49e7b99e253d",
      "category": "device",
      "type": "device:flow",
      "staticMessage": {},
      "topic": "flow",
      "filterTopic": "message",
      "useStaticMessage": true,
      "nodeType": {}
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/device_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Simple When I am Home Flow",
    "class": "device-flow",
    "type": "device:flow",
    "category": "device",
    "uuid": "c158abe4-8fc9-41e0-9de9-aae11853f74f",
    "defaults": {
      "name": "Simple When I am Home Flow",
      "uuid": "c158abe4-8fc9-41e0-9de9-aae11853f74f",
      "category": "device",
      "type": "device:flow",
      "staticMessage": {},
      "topic": "flow",
      "filterTopic": "message",
      "useStaticMessage": true,
      "nodeType": {}
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/device_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Flow b7e79437",
    "class": "device-flow",
    "type": "device:flow",
    "category": "device",
    "uuid": "b7e79437-943e-4b02-b525-5a003e7ed1ad",
    "defaults": {
      "name": "Flow b7e79437",
      "uuid": "b7e79437-943e-4b02-b525-5a003e7ed1ad",
      "category": "device",
      "type": "device:flow",
      "staticMessage": {},
      "topic": "flow",
      "filterTopic": "message",
      "useStaticMessage": true,
      "nodeType": {}
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/device_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Hello, Template",
    "class": "device-flow",
    "type": "device:flow",
    "category": "device",
    "uuid": "e095b761-182d-478b-a3d3-641c5ae95be0",
    "defaults": {
      "name": "Hello, Template",
      "uuid": "e095b761-182d-478b-a3d3-641c5ae95be0",
      "category": "device",
      "type": "device:flow",
      "staticMessage": {},
      "topic": "flow",
      "filterTopic": "message",
      "useStaticMessage": true,
      "nodeType": {}
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/device_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Flow cbaf03cd",
    "class": "device-flow",
    "type": "device:flow",
    "category": "device",
    "uuid": "cbaf03cd-4486-4691-b410-68d1d13f3a0a",
    "defaults": {
      "name": "Flow cbaf03cd",
      "uuid": "cbaf03cd-4486-4691-b410-68d1d13f3a0a",
      "category": "device",
      "type": "device:flow",
      "staticMessage": {},
      "topic": "flow",
      "filterTopic": "message",
      "useStaticMessage": true,
      "nodeType": {}
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/device_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "When I am home turn the lights on",
    "class": "device-flow",
    "type": "device:flow",
    "category": "device",
    "uuid": "3fafbc96-1c10-4081-973e-3680fa52cd38",
    "defaults": {
      "name": "When I am home turn the lights on",
      "uuid": "3fafbc96-1c10-4081-973e-3680fa52cd38",
      "category": "device",
      "type": "device:flow",
      "staticMessage": {},
      "topic": "flow",
      "filterTopic": "message",
      "useStaticMessage": true,
      "nodeType": {}
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/device_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Broadcast",
    "class": "broadcast",
    "helpText": "Broadcast message to any meshblu device or Octoblu flow",
    "category": "operation",
    "uuid": "2be62b90-6519-11e4-867f-276797c27ed6",
    "type": "operation:broadcast",
    "defaults": {
      "uuid": "*",
      "topic": "message"
    },
    "input": 1,
    "formTemplatePath": "/pages/node_forms/output_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Change",
    "class": "change",
    "helpText": "Compare the previous message and only send if the previous message is not equal to the current message",
    "category": "operation",
    "uuid": "219ecd2e-49f7-437f-9a87-7385c2c9a944",
    "type": "operation:change",
    "defaults": {
      "uuid": "*",
      "topic": "message"
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/change_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Collect",
    "class": "collect",
    "helpText": "Collect input data and output entire collection",
    "category": "operation",
    "uuid": "5431b4eb-133f-42ca-b96c-491b8a68d040",
    "type": "operation:collect",
    "defaults": {
      "topic": "message"
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/collect_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Comment",
    "class": "comment",
    "helpText": "Displays a comment in the flow",
    "category": "operation",
    "uuid": "37f0be60-2f17-11e4-9617-a6c5e4d22fb7",
    "type": "operation:comment",
    "defaults": {},
    "input": 0,
    "output": 0,
    "formTemplatePath": "/pages/node_forms/comment_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Compose",
    "class": "compose",
    "helpText": "Wait for all values to be received before sending the message",
    "category": "operation",
    "uuid": "46b72292-e288-4bc4-855c-019fb241c1ad",
    "type": "operation:compose",
    "defaults": {
      "composeKeys": [
        ""
      ]
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/compose_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Debounce",
    "class": "debounce",
    "helpText": "Debounce will delay the message until after the specified interval has elapsed since the last time it received a message",
    "type": "operation:debounce",
    "category": "operation",
    "uuid": "52a55b44-923d-4f56-9ad4-e7aa1262c6cb",
    "defaults": {
      "interval": 1000
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/debounce_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Debug",
    "class": "debug",
    "helpText": "Display the contents of the messages it receives in the debug panel",
    "category": "operation",
    "uuid": "37f0b88e-2f17-11e4-9617-a6c5e4d22fb7",
    "type": "operation:debug",
    "defaults": {
      "active": true,
      "debug": true,
      "complete": false
    },
    "color": "#87a980",
    "input": 1,
    "output": 0,
    "align": "right",
    "formTemplatePath": "/pages/node_forms/debug_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Delay",
    "class": "delay",
    "helpText": "Delay sending the message until after the specified interval has elapsed since the message was received",
    "type": "operation:delay",
    "category": "operation",
    "uuid": "37e73da4-2f17-11e4-9617-a6c5e4d22fb7",
    "defaults": {
      "timeout": 1000,
      "timeoutUnits": "milliseconds"
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/delay_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Demultiplex",
    "class": "demultiplex",
    "helpText": "Break an array of values into discreet messages",
    "type": "operation:demultiplex",
    "category": "operation",
    "uuid": "99b84aa0-338b-11e4-8c21-0800200c9a66",
    "defaults": {},
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/demultiplexer_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Meshblu device",
    "class": "device",
    "helpText": "Generic Meshblu device for specifying custom UUIDs",
    "category": "operation",
    "uuid": "be0d21d3-f6b0-4f21-ae3b-484d69f6063a",
    "type": "operation:device",
    "defaults": {},
    "input": 1,
    "output": 1,
    "align": "right",
    "formTemplatePath": "/pages/node_forms/generic_device_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Equal",
    "class": "equal",
    "helpText": "Filter out messages that do not pass an equality test. Reference incoming messages using {{msg.values}}  \n  \nSupported inputs include: date and numbers",
    "category": "operation",
    "uuid": "2bebd428-4818-48ea-b1f5-88a32199f17b",
    "type": "operation:equal",
    "defaults": {
      "value": 0
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/equal_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Function",
    "class": "function",
    "helpText": "Sends a custom message using javascript",
    "category": "operation",
    "uuid": "37f0a3a8-2f17-11e4-9617-a6c5e4d22fb7",
    "type": "operation:function",
    "defaults": {
      "output": 1,
      "func": "\nreturn msg;"
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/function_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Get Key",
    "class": "get-key",
    "helpText": "Get a value stored by Set Key",
    "category": "operation",
    "uuid": "6daa638e-ced8-4de9-be9b-dcd026be6348",
    "type": "operation:get-key",
    "defaults": {},
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/get_key_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Greater Than or Equal",
    "class": "greater-than-equal",
    "helpText": "Filter out messages that do not pass a greater than or equal test. Reference incoming messages using {{msg.values}}  \n  \nSupported inputs include: date and numbers",
    "category": "operation",
    "uuid": "c36c413c-c4df-4c5b-9861-fcd08bc81503",
    "type": "operation:greater-than-equal",
    "defaults": {
      "value": 0
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/greater_than_equal_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Greater Than",
    "class": "greater-than",
    "helpText": "Filter out messages that do not pass a greater than test. Reference incoming messages using {{msg.values}}  \n  \nSupported inputs include: date and numbers",
    "category": "operation",
    "uuid": "7c801bad-4e1d-4ad0-aabd-d1ace2fcc001",
    "type": "operation:greater-than",
    "defaults": {
      "value": 0
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/greater_than_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "http DELETE",
    "class": "http-request-delete",
    "helpText": "Perform an HTTP Delete request",
    "category": "operation",
    "uuid": "da37cc30-5326-11e4-ad12-c7f5132c4ef6",
    "type": "operation:http-delete-request",
    "defaults": {
      "method": "DELETE",
      "headerKeys": [
        "Content-Type"
      ],
      "headerValues": [
        "text/html"
      ]
    },
    "input": 1,
    "output": 1,
    "align": "right",
    "formTemplatePath": "/pages/node_forms/http_request_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "http POST",
    "class": "http-post-request",
    "helpText": "Perform an HTTP Post request",
    "category": "operation",
    "uuid": "95675c2c-5305-11e4-9e35-164230d1df67",
    "type": "operation:http-post-request",
    "defaults": {
      "method": "POST",
      "headerKeys": [],
      "headerValues": [],
      "bodyEncoding": "json",
      "bodyKeys": [
        ""
      ]
    },
    "input": 1,
    "output": 1,
    "align": "right",
    "formTemplatePath": "/pages/node_forms/http_request_body_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "http PUT",
    "class": "http-put-request",
    "helpText": "Perform an HTTP Put request",
    "category": "operation",
    "uuid": "adb9dfe0-5326-11e4-ad12-c7f5132c4ef6",
    "type": "operation:http-put-request",
    "defaults": {
      "method": "PUT",
      "headerKeys": [],
      "headerValues": [],
      "bodyEncoding": "json",
      "bodyKeys": [
        ""
      ]
    },
    "input": 1,
    "output": 1,
    "align": "right",
    "formTemplatePath": "/pages/node_forms/http_request_body_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "http GET",
    "class": "http-request",
    "helpText": "Perform an HTTP Get request",
    "category": "operation",
    "uuid": "37f0aefc-2f17-11e4-9617-a6c5e4d22fb7",
    "type": "operation:http-request",
    "defaults": {
      "method": "GET",
      "headerKeys": [
        "Content-Type"
      ],
      "headerValues": [
        "text/html"
      ]
    },
    "input": 1,
    "output": 1,
    "align": "right",
    "formTemplatePath": "/pages/node_forms/http_request_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Interval",
    "class": "interval",
    "helpText": "Emit a message at the specified interval.<br> ```{ \"on\": true || false, \"repeat\": 1000 } ```",
    "category": "operation",
    "uuid": "37f0a966-2f17-11e4-9617-a6c5e4d22fb7",
    "type": "operation:interval",
    "defaults": {
      "payloadType": "date",
      "repeat": 1000,
      "on": true
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/interval_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Less Than or Equal",
    "class": "less-than-equal",
    "helpText": "Filter out messages that do not pass a less or equal than test. Reference incoming messages using {{msg.values}}  \n  \nSupported inputs include: date and numbers",
    "category": "operation",
    "uuid": "e3d81634-2536-427f-b87f-5305916e28db",
    "type": "operation:less-than-equal",
    "defaults": {
      "value": 0
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/less_than_equal_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Less Than",
    "class": "less-than",
    "helpText": "Filter out messages that do not pass a less than test. Reference incoming messages using {{msg.values}}  \n  \nSupported inputs include: date and numbers",
    "category": "operation",
    "uuid": "c7852f9b-96e2-4f9e-b5b5-d349e32bbf9a",
    "type": "operation:less-than",
    "defaults": {
      "value": 0
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/less_than_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Math",
    "class": "math",
    "helpText": "Perform math operations",
    "category": "operation",
    "uuid": "03a54d95-141f-47cb-809f-dd98959ad927",
    "type": "operation:math",
    "defaults": {
      "topic": "message"
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/math_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Microblu device",
    "class": "microblu",
    "helpText": "Generic Microblu device for specifying custom UUIDs",
    "category": "operation",
    "uuid": "fb99604a-3ed3-4292-872b-a5b1ec1c16ab",
    "type": "operation:microblu",
    "defaults": {},
    "input": 1,
    "output": 1,
    "align": "right",
    "formTemplatePath": "/pages/node_forms/generic_microblu_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "On Start",
    "class": "on-start",
    "helpText": "Automatically trigger on flow start",
    "category": "operation",
    "uuid": "9d524707-1152-4765-9fb4-5e6cac65da50",
    "type": "operation:on-start",
    "input": 0,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/on_start_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Pluck",
    "class": "pluck",
    "helpText": "Extract a portion of the message. Use {{msg.foo}} to reference incoming fields",
    "category": "operation",
    "uuid": "86aef89e-6dfd-435f-863e-6deac12fc6ec",
    "type": "operation:pluck",
    "defaults": {
      "key": ""
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/pluck_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Range",
    "class": "range",
    "helpText": "Filter out messages that do not fall within the specified range. Reference incoming messages using {{msg.values}}  \n  \nSupported inputs include: date and numbers",
    "category": "operation",
    "uuid": "54cedc7a-24fd-425c-8f10-898bdc90bc39",
    "type": "operation:range",
    "defaults": {},
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/range_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "RSS request",
    "class": "rss",
    "helpText": "Perform a request to retrieve an RSS Feed. Response is auto translated to the Octoblu message format",
    "category": "operation",
    "uuid": "2aac8e4a-7695-4269-ba98-3678581f7a59",
    "type": "operation:rss",
    "defaults": {
      "method": "GET"
    },
    "input": 1,
    "output": 1,
    "align": "right",
    "formTemplatePath": "/pages/node_forms/http_request_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Sample",
    "class": "sample",
    "helpText": "Return a random element from an array",
    "category": "operation",
    "uuid": "236e8515-6218-4062-beb8-00ae81449bad",
    "type": "operation:sample",
    "defaults": {
      "topic": "message"
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/sample_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Schedule",
    "class": "schedule",
    "helpText": "Emits messages at the specified time using Cron syntax",
    "category": "operation",
    "uuid": "37f0ac4a-2f17-11e4-9617-a6c5e4d22fb7",
    "type": "operation:schedule",
    "defaults": {
      "payloadType": "date",
      "crontab": "* * * * *",
      "once": false
    },
    "input": 0,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/schedule_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Sentiment",
    "class": "sentiment",
    "helpText": "Performs sentiment analysis on the words in the key, sends msg.score",
    "category": "operation",
    "uuid": "37f0b3f2-2f17-11e4-9617-a6c5e4d22fb7",
    "type": "operation:sentiment",
    "defaults": {},
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/sentiment_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Set Key",
    "class": "set-key",
    "helpText": "Store a value for later retrieval",
    "category": "operation",
    "uuid": "5a6bb5a5-b2ef-4a9e-b15f-f0f646ee90d6",
    "type": "operation:set-key",
    "defaults": {},
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/set_key_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Template",
    "class": "template",
    "helpText": "Sends a custom message using handlebars (e.g. {{msg.text}})",
    "category": "operation",
    "uuid": "8f2e02ff-08da-446d-ab50-e5115f511cba",
    "type": "operation:template",
    "defaults": {},
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/template_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Throttle",
    "class": "throttle",
    "helpText": "Slow down the incoming messages so that one is emitted at each occurrence of the specified interval",
    "type": "operation:throttle",
    "category": "operation",
    "uuid": "794922ff-3792-4e4e-a0e2-a0823ed6b82e",
    "defaults": {
      "interval": 1000
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/throttle_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Trigger",
    "class": "trigger",
    "helpText": "Send a static message. Can also be triggered from other flows",
    "category": "operation",
    "uuid": "37f0a74a-2f17-11e4-9617-a6c5e4d22fb7",
    "type": "operation:trigger",
    "defaults": {
      "payloadType": "date",
      "once": false
    },
    "input": 0,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/button_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Unique",
    "class": "unique",
    "helpText": "Send an array of values and remove duplicates",
    "category": "operation",
    "uuid": "325ea182-f5e7-4182-a7f0-f94f651e4375",
    "type": "operation:unique",
    "defaults": {
      "topic": "message"
    },
    "input": 1,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/unique_form.html"
  },
  {
    "resourceType": "flow-node-type",
    "name": "Webhook",
    "class": "webhook",
    "helpText": "Create an HTTP endpoint for receiving push notifications from other services",
    "category": "operation",
    "uuid": "d5886aa5-4052-41be-8eed-9d1df32befb1",
    "type": "operation:webhook",
    "defaults": {},
    "input": 0,
    "output": 1,
    "formTemplatePath": "/pages/node_forms/webhook_form.html"
  }
]