module.exports = {
  "name": "I'm Home",
  "nodes": [
    {
      "id": "1234",
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
      "resourceType": "flow-node",
      "defaults": {
        "category": "operation",
        "name": "Trigger",
        "type": "operation:trigger"
      },
      "output": 1,
      "input": 0,
      "x": 1,
      "y": 1,
      "formTemplatePath": "/pages/node_forms/button_form.html"
    },
    {
      "id": "1234",
      "category": "device",
      "name": "Office Light",
      "staticMessage": {
        "on": true,
        "color": "white"
      },
      "resourceType": "flow-node",
      "useStaticMessage": true,
      "type": "device:wemo",
      "uuid": "2836e14d-ef41-40b3-8861-24ae5464da97",
      "inputLocations": [
        27.5
      ],
      "outputLocations": [
        27.5
      ],
      "defaults": {
        "category": "device",
        "name": "Office Light",
        "type": "device:wemo"
      },
      "output": 1,
      "input": 1,
      "x": 301,
      "y": 1,
      "formTemplatePath": "/pages/node_forms/device_form.html"
    }
  ],
  "links": [
    {
      "from": "1234",
      "fromPort": 0,
      "to": "1234",
      "toPort": 0
    }
  ],
  "zoomScale": 1,
  "zoomX": 600,
  "zoomY": 400
}
