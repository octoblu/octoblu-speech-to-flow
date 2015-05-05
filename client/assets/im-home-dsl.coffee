module.exports = {
  "name": "I'm Home",
  "nodes": [
    {
      "type": "operation:trigger"
    },
    {
      "type": "device:wemo",
      "staticMessage": {
        "on": true,
        "color": "white"
      },
      "useStaticMessage": true
    }
  ],
  "links": [
    {
      "from": 0,
      "to": 1
    }
  ]
}
