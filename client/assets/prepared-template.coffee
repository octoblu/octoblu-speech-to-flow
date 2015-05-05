module.exports = {
  "name": "I'm awesome 8",
  "flow": {
    "name": "I'm Home 8",
    "nodes": [
      {
        "id": "9100b177-a6ab-41ba-8cd2-2497f03baadc",
        "name": "Trigger",
        "type": "operation:trigger",
        "uuid": "37f0a74a-2f17-11e4-9617-a6c5e4d22fb7",
        "category": "operation",
        "inputLocations": [
          27.5
        ],
        "outputLocations": [
          27.5
        ],
        "defaults": {
          "category": "operation",
          "name": "Trigger",
          "type": "operation:trigger"
        },
        "output": 1,
        "input": 0,
        "x": 1,
        "y": 1
      },
      {
        "id": "29033da8-2e1d-432c-868c-031b91935644",
        "category": "device",
        "connector": "meshblu-wemo",
        "name": "Belkin Wemo",
        "staticMessage": {
          "on": true,
          "color": "white"
        },
        "useStaticMessage": true,
        "type": "device:wemo",
        "inputLocations": [
          27.5
        ],
        "outputLocations": [
          27.5
        ],
        "defaults": {
          "category": "device",
          "connector": "meshblu-wemo",
          "name": "Belkin Wemo",
          "type": "device:wemo"
        },
        "output": 1,
        "input": 1,
        "x": 300,
        "y": 0
      }
    ],
    "links": [
      {
        "from": "9100b177-a6ab-41ba-8cd2-2497f03baadc",
        "fromPort": 0,
        "to": "29033da8-2e1d-432c-868c-031b91935644",
        "toPort": 0
      }
    ],
    "zoomScale": 1,
    "zoomX": 600,
    "zoomY": 400
  }
}
