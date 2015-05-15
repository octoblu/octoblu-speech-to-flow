module.exports = {
  "device:hue": {
    "on": {
      "staticMessage": {
        "on": true,
        "color": "white",
        "useGroup": true,
        "lightNumber": 0
      },
      "useStaticMessage": true
    },
    "off": {
      "staticMessage": {
        "on": false,
        "color": "white",
        "useGroup": true,
        "lightNumber": 0
      },
      "useStaticMessage": true
    }
  },
  "device:lifx": {
    "on": {
      "staticMessage": {
        "on": true,
        "color": "white",
        "useGroup": true,
        "lightNumber": 0
      },
      "useStaticMessage": true
    },
    "off": {
      "staticMessage": {
        "on": false,
        "color": "white",
        "useGroup": true,
        "lightNumber": 0
      },
      "useStaticMessage": true
    }
  },
  "device:wemo": {
    "on": {
      "staticMessage": {
        "on": true
      },
      "useStaticMessage": true
    },
    "off": {
      "staticMessage": {
        "on": false
      },
      "useStaticMessage": true
    }
  }
}
