{
  "graph": {
    "cells": [
      {
        "position": {
          "x": 0,
          "y": 0
        },
        "size": {
          "height": 10,
          "width": 10
        },
        "type": "Statechart",
        "id": "00ffb6d1-d225-4bc0-8b73-7df9987f57b7",
        "attrs": {
          "name": {
            "text": "system_setup_menu Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface:\n    in event enterPressed\n    in event nextPressed\n    in event escapePressed\n    \n    var index : integer = 0\n    var speed_m1 : integer = 0\n    var speed_m2 : integer = 0"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -831,
          "y": -226
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "0eb72a10-9e83-4e87-b44b-dffe6365604c",
        "z": 32,
        "embeds": [
          "54ec237d-4ce8-427a-a421-796b853e1def"
        ]
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -831,
          "y": -211
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "54ec237d-4ce8-427a-a421-796b853e1def",
        "z": 33,
        "parent": "0eb72a10-9e83-4e87-b44b-dffe6365604c"
      },
      {
        "position": {
          "x": -370,
          "y": -274
        },
        "size": {
          "height": 61,
          "width": 94
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_MENU1_M1",
            "fontSize": 11
          }
        },
        "id": "5ce37afe-a2d7-4a86-a6bd-439775499cd6",
        "z": 53,
        "embeds": [
          "7c917016-fa79-458e-9f40-7e2870a9d630"
        ]
      },
      {
        "position": {
          "x": -193,
          "y": -251
        },
        "size": {
          "width": 15,
          "height": 15
        },
        "type": "Choice",
        "attrs": {},
        "id": "0983fcc9-f5f8-48e8-8112-2dbf364590a2",
        "z": 57
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "5ce37afe-a2d7-4a86-a6bd-439775499cd6"
        },
        "target": {
          "id": "0983fcc9-f5f8-48e8-8112-2dbf364590a2"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "enterPressed"
              }
            },
            "position": {
              "distance": 0.4879474582421546,
              "offset": 11.999998779296874,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "877b2661-cfbf-40f3-a606-3167a88dead6",
        "z": 58,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -19,
          "y": -393
        },
        "size": {
          "height": 60,
          "width": 103
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_MENU2_M1_POWER",
            "fontSize": 11
          }
        },
        "id": "a875931f-32d0-45a9-a8b0-1b7c3918f95d",
        "z": 61,
        "embeds": [
          "837ec528-eab7-4659-ac72-10d9c8b03f4a"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "5ce37afe-a2d7-4a86-a6bd-439775499cd6"
        },
        "target": {
          "id": "5ce37afe-a2d7-4a86-a6bd-439775499cd6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "21.277%",
              "dy": "96.721%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "nextPressed / index = (index + 1)%3"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "7c917016-fa79-458e-9f40-7e2870a9d630",
        "z": 70,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -303,
            "y": -167
          }
        ],
        "parent": "5ce37afe-a2d7-4a86-a6bd-439775499cd6"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "0983fcc9-f5f8-48e8-8112-2dbf364590a2"
        },
        "target": {
          "id": "a875931f-32d0-45a9-a8b0-1b7c3918f95d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "2.913%",
              "dy": "38.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "else"
              }
            },
            "position": {
              "distance": 0.6599006176336334,
              "offset": -12,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "ef6fe70c-11c8-46b2-9de4-0da1e34206d1",
        "z": 71,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -185.5,
            "y": -370
          }
        ]
      },
      {
        "position": {
          "x": -29,
          "y": -187
        },
        "size": {
          "height": 98,
          "width": 117
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_MENU2_M1_SPIN",
            "fontSize": 11
          }
        },
        "id": "49bb8fe0-34f8-48b7-972e-b0088e957661",
        "z": 79,
        "embeds": [
          "50478be5-9bb7-4eca-af3b-151dea7007c0"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "0983fcc9-f5f8-48e8-8112-2dbf364590a2"
        },
        "target": {
          "id": "49bb8fe0-34f8-48b7-972e-b0088e957661",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0%",
              "dy": "83.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "[index == 2] / index = 0"
              }
            },
            "position": {
              "distance": 0.6842244052065941,
              "offset": -13,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "765def1a-ab27-407e-89ff-6345f17ad59a",
        "z": 80,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -185.5,
            "y": -123
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "49bb8fe0-34f8-48b7-972e-b0088e957661"
        },
        "target": {
          "id": "5ce37afe-a2d7-4a86-a6bd-439775499cd6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "92.553%",
              "dy": "95.082%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "escapePressed / index = 0"
              }
            },
            "position": {
              "distance": 0.25452505506936784,
              "offset": 11,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "1f183ca2-6f0c-436e-87ad-eedc536b7351",
        "z": 80,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -283,
            "y": -188
          }
        ]
      },
      {
        "position": {
          "x": 166,
          "y": -370.5
        },
        "size": {
          "width": 15,
          "height": 15
        },
        "type": "Choice",
        "attrs": {},
        "id": "bd11a94d-1b87-450c-9ad2-0c25668580c0",
        "z": 99
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "a875931f-32d0-45a9-a8b0-1b7c3918f95d"
        },
        "target": {
          "id": "bd11a94d-1b87-450c-9ad2-0c25668580c0"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "enterPressed"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "23f34110-c4c8-4852-b99d-223506cde44c",
        "z": 100,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -212,
          "y": 81
        },
        "size": {
          "width": 15,
          "height": 15
        },
        "type": "Choice",
        "attrs": {},
        "id": "9070aac8-774b-474f-9e5c-a07090bb46c7",
        "z": 132
      },
      {
        "position": {
          "x": -49,
          "y": 51
        },
        "size": {
          "height": 61,
          "width": 105
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_MENU2_M2_SPEED",
            "fontSize": 11
          }
        },
        "id": "5ea5f7d9-9aae-4cf9-b99c-e7a7280f6be6",
        "z": 134,
        "embeds": [
          "438bdfab-5399-4ed2-8b78-03a36466504e"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9070aac8-774b-474f-9e5c-a07090bb46c7"
        },
        "target": {
          "id": "5ea5f7d9-9aae-4cf9-b99c-e7a7280f6be6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "15%",
              "dy": "70%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "[index == 1] / index = 0"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "0ecd0a1b-be55-4e6d-b9dc-cde75a2998bf",
        "z": 135,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -47,
          "y": -15
        },
        "size": {
          "height": 60,
          "width": 103
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_MENU2_M2_POWER",
            "fontSize": 11
          }
        },
        "id": "e84e24c4-c478-4194-9f87-843f998406ff",
        "z": 136,
        "embeds": [
          "2977786c-c6fa-4c61-8450-0da559f0419c"
        ]
      },
      {
        "position": {
          "x": 29,
          "y": -285
        },
        "size": {
          "height": 61,
          "width": 105
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_MENU2_M1_SPEED",
            "fontSize": 11
          }
        },
        "id": "395c27f3-cf18-426f-aa2f-786ade2feaa7",
        "z": 161,
        "embeds": [
          "6f231b0d-b2fa-431b-8018-4b7919e3976d"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "0983fcc9-f5f8-48e8-8112-2dbf364590a2"
        },
        "target": {
          "id": "395c27f3-cf18-426f-aa2f-786ade2feaa7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "15%",
              "dy": "70%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "[index == 1] / index = 0"
              }
            },
            "position": {
              "distance": 0.4759777087785902,
              "offset": 9.000012207031261,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "dcb964f8-1057-4e38-83c8-b4d9f622bff9",
        "z": 162,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "395c27f3-cf18-426f-aa2f-786ade2feaa7"
        },
        "target": {
          "id": "5ce37afe-a2d7-4a86-a6bd-439775499cd6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "100%",
              "dy": "14.754%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "escapePressed / index = 0"
              }
            },
            "position": {
              "distance": 0.39529884213306865,
              "offset": 11,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "51eda7d0-48da-4e03-b562-45a9ed66dd33",
        "z": 162,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "395c27f3-cf18-426f-aa2f-786ade2feaa7"
        },
        "target": {
          "id": "395c27f3-cf18-426f-aa2f-786ade2feaa7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "91.429%",
              "dy": "6.557%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "nextPressed / index = (index + 1)%10"
              }
            },
            "position": {
              "distance": 0.6132522384847392,
              "offset": -10,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "6f231b0d-b2fa-431b-8018-4b7919e3976d",
        "z": 162,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "395c27f3-cf18-426f-aa2f-786ade2feaa7"
      },
      {
        "position": {
          "x": 182,
          "y": -115
        },
        "size": {
          "width": 15,
          "height": 15
        },
        "type": "Choice",
        "attrs": {},
        "id": "9d639713-2de2-4dcd-a533-90460e7a1411",
        "z": 167
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "49bb8fe0-34f8-48b7-972e-b0088e957661"
        },
        "target": {
          "id": "9d639713-2de2-4dcd-a533-90460e7a1411"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "enterPressed"
              }
            },
            "position": {
              "distance": 0.5000000066364202,
              "offset": -8.000001220703126,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "407e7188-ddcf-4ff3-a65f-fe3da2d57b73",
        "z": 168,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 400,
          "y": -198
        },
        "size": {
          "height": 68,
          "width": 145
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_MENU3_M1_SPIN_LEFT",
            "fontSize": 11
          }
        },
        "id": "5f76ff0e-940b-4ff5-b20e-6a939ae469c4",
        "z": 171
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9d639713-2de2-4dcd-a533-90460e7a1411"
        },
        "target": {
          "id": "5f76ff0e-940b-4ff5-b20e-6a939ae469c4",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "2.069%",
              "dy": "51.471%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "else"
              }
            },
            "position": {
              "distance": 0.5364720456285941,
              "offset": -8.336791992187557,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "85b7eeca-972a-45b3-bddc-6aca54476d15",
        "z": 172,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 189.5,
            "y": -163
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "5f76ff0e-940b-4ff5-b20e-6a939ae469c4"
        },
        "target": {
          "id": "49bb8fe0-34f8-48b7-972e-b0088e957661",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "98.291%",
              "dy": "7.143%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "escapePressed / index = 0"
              }
            },
            "position": {
              "distance": 0.5064102564102564,
              "offset": 9,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "3d4c3cf6-adc1-4e5e-b721-8ec4a9e89cce",
        "z": 180,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9070aac8-774b-474f-9e5c-a07090bb46c7"
        },
        "target": {
          "id": "e84e24c4-c478-4194-9f87-843f998406ff",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "11.65%",
              "dy": "10%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "else"
              }
            },
            "position": {
              "distance": 0.33582450817289405,
              "offset": -8,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "207b4123-1c68-480c-82f3-b25a3c177c62",
        "z": 183,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 63,
            "y": -28
          }
        ]
      },
      {
        "position": {
          "x": 340,
          "y": -402
        },
        "size": {
          "height": 68,
          "width": 145
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_MENU3_M1_POWER_ON",
            "fontSize": 11
          }
        },
        "id": "afb95441-1261-4b78-b657-ba7fcbe46c50",
        "z": 190
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "bd11a94d-1b87-450c-9ad2-0c25668580c0"
        },
        "target": {
          "id": "afb95441-1261-4b78-b657-ba7fcbe46c50",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "1.379%",
              "dy": "58.824%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "[index == 1] / index = 0"
              }
            },
            "position": {
              "distance": 0.6010264193144124,
              "offset": -12,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "65a5097c-cfae-4e26-86ab-2e9533b28c9c",
        "z": 191,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "afb95441-1261-4b78-b657-ba7fcbe46c50",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "8.966%",
              "dy": "26.471%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "a875931f-32d0-45a9-a8b0-1b7c3918f95d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "93.204%",
              "dy": "76.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "escapePressed / index = 0"
              }
            },
            "position": {
              "distance": 0.4937863026592493,
              "offset": -7,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "fd8041c2-69de-4a9b-b06f-c1f3ea87bb11",
        "z": 191,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 286,
            "y": -427
          }
        ]
      },
      {
        "position": {
          "x": 350,
          "y": -513
        },
        "size": {
          "height": 68,
          "width": 145
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_MENU3_M1_POWER_OFF",
            "fontSize": 11
          }
        },
        "id": "58f7cb00-2bf2-4408-aaca-44ca2e244d6f",
        "z": 192
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "58f7cb00-2bf2-4408-aaca-44ca2e244d6f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "2.759%",
              "dy": "22.059%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "a875931f-32d0-45a9-a8b0-1b7c3918f95d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "51.456%",
              "dy": "0%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "escapePressed / index = 0"
              }
            },
            "position": {
              "distance": 0.4008133309075729,
              "offset": 13.4541015625,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "f50afbe9-b21a-4a9b-9bfa-0323a482667a",
        "z": 193,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 34,
            "y": -498
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "bd11a94d-1b87-450c-9ad2-0c25668580c0"
        },
        "target": {
          "id": "58f7cb00-2bf2-4408-aaca-44ca2e244d6f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "2.069%",
              "dy": "80.882%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "else"
              }
            },
            "position": {
              "distance": 0.7641353770472714,
              "offset": -7.567321777343807,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "8637e0ea-1c5f-4a16-95f1-187c5af84956",
        "z": 194,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 173.5,
            "y": -458
          }
        ]
      },
      {
        "position": {
          "x": 219,
          "y": 3
        },
        "size": {
          "width": 15,
          "height": 15
        },
        "type": "Choice",
        "attrs": {},
        "id": "a4e63f1f-3aff-431d-a930-5953009ac17c",
        "z": 204
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e84e24c4-c478-4194-9f87-843f998406ff"
        },
        "target": {
          "id": "a4e63f1f-3aff-431d-a930-5953009ac17c"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "enterPressed"
              }
            },
            "position": {
              "distance": 0.5000000037451774,
              "offset": 8.00000020980835,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "d5f23fd3-0860-4c51-9c01-56fb5672d0c6",
        "z": 206,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 398,
          "y": 55
        },
        "size": {
          "height": 68,
          "width": 145
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_MENU3_M2_POWER_OFF",
            "fontSize": 11
          }
        },
        "id": "289fbfd8-781d-47ea-b168-79686ccab22d",
        "z": 215
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "a4e63f1f-3aff-431d-a930-5953009ac17c"
        },
        "target": {
          "id": "289fbfd8-781d-47ea-b168-79686ccab22d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "2.069%",
              "dy": "80.882%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "else"
              }
            },
            "position": {
              "distance": 0.7641353770472714,
              "offset": -7.567321777343807,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "86dce588-a27e-4aee-9ec3-f787849c77d3",
        "z": 216,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 226.5,
            "y": 71
          }
        ]
      },
      {
        "position": {
          "x": 414,
          "y": 175
        },
        "size": {
          "height": 60,
          "width": 113
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_MENU3_M2_SPEED",
            "fontSize": 11
          }
        },
        "id": "f4ea0aca-dd61-4328-a864-6c99416e6c6e",
        "z": 219
      },
      {
        "position": {
          "x": -45,
          "y": 263
        },
        "size": {
          "height": 67,
          "width": 105
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_MENU2_M2_SPIN",
            "fontSize": 11
          }
        },
        "id": "7c4d1ecd-9c44-4349-a172-706afb4ecc1c",
        "z": 227,
        "embeds": [
          "8ff606d9-1492-406f-8d36-1003928aacac"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9070aac8-774b-474f-9e5c-a07090bb46c7"
        },
        "target": {
          "id": "7c4d1ecd-9c44-4349-a172-706afb4ecc1c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "8.571%",
              "dy": "8.955%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "[index == 2] / index = 0"
              }
            },
            "position": {
              "distance": 0.7451621050180036,
              "offset": -17,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "976d31b9-f471-4453-8e8a-1b64e5f6f197",
        "z": 229,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -147,
            "y": 269
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "5ea5f7d9-9aae-4cf9-b99c-e7a7280f6be6"
        },
        "target": {
          "id": "5ea5f7d9-9aae-4cf9-b99c-e7a7280f6be6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "79.048%",
              "dy": "93.443%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "nextPressed / index = (index + 1)%10"
              }
            },
            "position": {
              "distance": 0.4050182857192173,
              "offset": 5.2214202880859375,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "438bdfab-5399-4ed2-8b78-03a36466504e",
        "z": 230,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -17,
            "y": 157
          }
        ],
        "parent": "5ea5f7d9-9aae-4cf9-b99c-e7a7280f6be6"
      },
      {
        "position": {
          "x": 392,
          "y": -120
        },
        "size": {
          "height": 68,
          "width": 145
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_MENU3_M1_SPIN_RIGHT",
            "fontSize": 11
          }
        },
        "id": "e713ea9a-6939-47e8-a403-cdf87a75e94e",
        "z": 237
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9d639713-2de2-4dcd-a533-90460e7a1411"
        },
        "target": {
          "id": "e713ea9a-6939-47e8-a403-cdf87a75e94e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "-0.69%",
              "dy": "25%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "[index == 1] / index = 0"
              }
            },
            "position": {
              "distance": 0.5405589413839769,
              "offset": -9,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "d885ec38-012d-4dae-8613-1bf3ac3f1b33",
        "z": 238,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e713ea9a-6939-47e8-a403-cdf87a75e94e"
        },
        "target": {
          "id": "49bb8fe0-34f8-48b7-972e-b0088e957661",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "80.342%",
              "dy": "97.959%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "escapePressed / index = 0"
              }
            },
            "position": {
              "distance": 0.6451137849939627,
              "offset": 6,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "63bcffe4-c535-4145-9acd-948fd692141d",
        "z": 238,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 65,
            "y": -52
          }
        ]
      },
      {
        "position": {
          "x": 173,
          "y": 288
        },
        "size": {
          "width": 15,
          "height": 15
        },
        "type": "Choice",
        "attrs": {},
        "id": "f90f5e16-4df4-462e-b590-ad51ef336427",
        "z": 249
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "7c4d1ecd-9c44-4349-a172-706afb4ecc1c"
        },
        "target": {
          "id": "f90f5e16-4df4-462e-b590-ad51ef336427"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "enterPressed"
              }
            },
            "position": {
              "distance": 0.45574046747235164,
              "offset": 4.999998779296902,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "374cbd10-ce56-4338-be0d-67a5992d3ce7",
        "z": 251,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 336,
          "y": 364
        },
        "size": {
          "height": 68,
          "width": 145
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_MENU3_M2_SPIN_RIGHT",
            "fontSize": 11
          }
        },
        "id": "6cb9acde-cd9d-4d4f-b92a-7c1ba084a6af",
        "z": 252
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "f90f5e16-4df4-462e-b590-ad51ef336427"
        },
        "target": {
          "id": "6cb9acde-cd9d-4d4f-b92a-7c1ba084a6af",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "-0.69%",
              "dy": "25%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "[index == 1] / index = 0"
              }
            },
            "position": {
              "distance": 0.6500325679887536,
              "offset": -10,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "afdd5ede-4c04-40b8-aa1b-d781e9d2a61d",
        "z": 253,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 180.5,
            "y": 381
          }
        ]
      },
      {
        "position": {
          "x": 332,
          "y": 260
        },
        "size": {
          "height": 68,
          "width": 145
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_MENU3_M2_SPIN_LEFT",
            "fontSize": 11
          }
        },
        "id": "17edd1f8-c9be-46eb-8f17-5fdd3d0e223e",
        "z": 256
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "f90f5e16-4df4-462e-b590-ad51ef336427"
        },
        "target": {
          "id": "17edd1f8-c9be-46eb-8f17-5fdd3d0e223e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "2.069%",
              "dy": "51.471%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "else"
              }
            },
            "position": {
              "distance": 0.5364720456285941,
              "offset": -8.336791992187557,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "3bc52c5c-d092-4f74-a6b3-2a29dd95f7cf",
        "z": 257,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "6cb9acde-cd9d-4d4f-b92a-7c1ba084a6af"
        },
        "target": {
          "id": "7c4d1ecd-9c44-4349-a172-706afb4ecc1c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "40%",
              "dy": "86.567%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "escapePressed / index = 0"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "03854084-1655-461d-b967-518b3193e614",
        "z": 258,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "17edd1f8-c9be-46eb-8f17-5fdd3d0e223e"
        },
        "target": {
          "id": "7c4d1ecd-9c44-4349-a172-706afb4ecc1c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "96.19%",
              "dy": "10.448%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "escapePressed / index = 0"
              }
            },
            "position": {
              "distance": 0.3786764705882353,
              "offset": 8,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "98dbb2cb-42bf-434c-acc8-f7e4e51cf946",
        "z": 259,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e84e24c4-c478-4194-9f87-843f998406ff"
        },
        "target": {
          "id": "e84e24c4-c478-4194-9f87-843f998406ff",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "5.825%",
              "dy": "6.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "nextPressed  / index=(index + 1)%2 "
              }
            },
            "position": {
              "distance": 0.42724503760640853,
              "offset": 10,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "2977786c-c6fa-4c61-8450-0da559f0419c",
        "z": 260,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "e84e24c4-c478-4194-9f87-843f998406ff"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "a875931f-32d0-45a9-a8b0-1b7c3918f95d"
        },
        "target": {
          "id": "a875931f-32d0-45a9-a8b0-1b7c3918f95d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "1.942%",
              "dy": "71.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "nextPressed  / index=(index + 1)%2 "
              }
            },
            "position": {
              "distance": 0.5449707172310007,
              "offset": 41.40164534024989,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "837ec528-eab7-4659-ac72-10d9c8b03f4a",
        "z": 261,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "a875931f-32d0-45a9-a8b0-1b7c3918f95d"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "49bb8fe0-34f8-48b7-972e-b0088e957661"
        },
        "target": {
          "id": "49bb8fe0-34f8-48b7-972e-b0088e957661",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "17.094%",
              "dy": "9.184%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "nextPressed  / index=(index + 1)%2 "
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "50478be5-9bb7-4eca-af3b-151dea7007c0",
        "z": 262,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "49bb8fe0-34f8-48b7-972e-b0088e957661"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "7c4d1ecd-9c44-4349-a172-706afb4ecc1c"
        },
        "target": {
          "id": "7c4d1ecd-9c44-4349-a172-706afb4ecc1c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "25.714%",
              "dy": "11.94%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "nextPressed  / index=(index + 1)%2 "
              }
            },
            "position": {
              "distance": 0.5966143419279355,
              "offset": 12.073079234874236,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "8ff606d9-1492-406f-8d36-1003928aacac",
        "z": 263,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 7.5,
            "y": 230
          }
        ],
        "parent": "7c4d1ecd-9c44-4349-a172-706afb4ecc1c"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "a875931f-32d0-45a9-a8b0-1b7c3918f95d"
        },
        "target": {
          "id": "5ce37afe-a2d7-4a86-a6bd-439775499cd6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "51.064%",
              "dy": "9.836%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "escapePressed / index = 0"
              }
            },
            "position": {
              "distance": 0.6365167891804567,
              "offset": 10,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "ae2d8207-fbf5-4389-854c-4f47b160f9a2",
        "z": 264,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "289fbfd8-781d-47ea-b168-79686ccab22d"
        },
        "target": {
          "id": "e84e24c4-c478-4194-9f87-843f998406ff",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "82.524%",
              "dy": "63.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "escapePressed / index = 0"
              }
            },
            "position": {
              "distance": 0.3610355619880155,
              "offset": 8,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "bbf1e5e2-9971-48b6-9b1c-1e80cb3d603c",
        "z": 266,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 80,
            "y": 55
          }
        ]
      },
      {
        "position": {
          "x": 440,
          "y": -290
        },
        "size": {
          "height": 60,
          "width": 113
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_MENU3_M1_SPEED",
            "fontSize": 11
          }
        },
        "id": "56c06bb6-9ac7-41fd-ac5f-63f508c3caac",
        "z": 267
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "395c27f3-cf18-426f-aa2f-786ade2feaa7"
        },
        "target": {
          "id": "56c06bb6-9ac7-41fd-ac5f-63f508c3caac",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "6.195%",
              "dy": "46.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "enterPressed / speed_m1 = index ; index = 0"
              }
            },
            "position": {
              "distance": 0.5102040816326531,
              "offset": -9,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "bf3364d2-397b-4527-b201-78aab0dfebbc",
        "z": 268,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "56c06bb6-9ac7-41fd-ac5f-63f508c3caac"
        },
        "target": {
          "id": "395c27f3-cf18-426f-aa2f-786ade2feaa7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "99.048%",
              "dy": "83.607%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "escapePressed / index = 0"
              }
            },
            "position": {
              "offset": -7,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "147a8b78-68ed-4fb8-adba-946cf8185755",
        "z": 268,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 515,
          "y": -22
        },
        "size": {
          "height": 68,
          "width": 145
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_MENU3_M2_POWER_ON",
            "fontSize": 11
          }
        },
        "id": "c01a8c05-b9fd-4356-9369-eb069780c5bd",
        "z": 269
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "a4e63f1f-3aff-431d-a930-5953009ac17c"
        },
        "target": {
          "id": "c01a8c05-b9fd-4356-9369-eb069780c5bd",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "1.379%",
              "dy": "58.824%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "[index == 1] / index = 0"
              }
            },
            "position": {
              "distance": 0.6668980531926592,
              "offset": 6,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "f81f7107-ed84-4450-a422-fa5e6a8ac0d4",
        "z": 270,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c01a8c05-b9fd-4356-9369-eb069780c5bd"
        },
        "target": {
          "id": "e84e24c4-c478-4194-9f87-843f998406ff",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "91.262%",
              "dy": "28.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "escapePressed / index = 0"
              }
            },
            "position": {
              "distance": 0.6953352769679301,
              "offset": 7,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "de6d0fa6-9298-40ab-b0c3-136d43ddc0ff",
        "z": 270,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -830,
          "y": -100
        },
        "size": {
          "height": 69,
          "width": 107
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_MAIN",
            "fontSize": 11
          }
        },
        "id": "ef5979e7-e9ee-4cd4-a118-e48b7d3f9689",
        "z": 272,
        "embeds": [
          "a547667e-ee20-4386-b293-41a136839616"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "0eb72a10-9e83-4e87-b44b-dffe6365604c"
        },
        "target": {
          "id": "ef5979e7-e9ee-4cd4-a118-e48b7d3f9689",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "8.411%",
              "dy": "5.797%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "e7effc90-125e-4d03-a7c2-707a241c9d97",
        "z": 273,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "ef5979e7-e9ee-4cd4-a118-e48b7d3f9689"
        },
        "target": {
          "id": "ef5979e7-e9ee-4cd4-a118-e48b7d3f9689",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "50.467%",
              "dy": "98.551%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "nextPressed / index = (index + 1)%2"
              }
            },
            "position": {
              "distance": 0.5854889615709699,
              "offset": 14,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "a547667e-ee20-4386-b293-41a136839616",
        "z": 273,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -829,
            "y": 34
          }
        ],
        "parent": "ef5979e7-e9ee-4cd4-a118-e48b7d3f9689"
      },
      {
        "position": {
          "x": -404,
          "y": 54
        },
        "size": {
          "height": 62,
          "width": 99
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_MENU1_M2",
            "fontSize": 11
          }
        },
        "id": "6429dc26-ba7a-41ba-a1f4-4e9b1a1b6c20",
        "z": 275,
        "embeds": [
          "6ba3fe07-dcc5-4bdd-8890-b5919e10cf9b"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "7c4d1ecd-9c44-4349-a172-706afb4ecc1c"
        },
        "target": {
          "id": "6429dc26-ba7a-41ba-a1f4-4e9b1a1b6c20",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "92.929%",
              "dy": "93.548%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "escapePressed / index = 0"
              }
            },
            "position": {
              "distance": 0.4119579051972261,
              "offset": -10.088057123365354,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "e4820260-8783-4559-a507-1972d4f72788",
        "z": 276,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e84e24c4-c478-4194-9f87-843f998406ff"
        },
        "target": {
          "id": "6429dc26-ba7a-41ba-a1f4-4e9b1a1b6c20",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "52.525%",
              "dy": "6.452%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "escapePressed / index = 0"
              }
            },
            "position": {
              "distance": 0.4955105295246273,
              "offset": 10,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "7ff9947c-0aaf-4dd9-93c9-ed637d70ddc8",
        "z": 276,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "5ea5f7d9-9aae-4cf9-b99c-e7a7280f6be6"
        },
        "target": {
          "id": "6429dc26-ba7a-41ba-a1f4-4e9b1a1b6c20",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "90.909%",
              "dy": "8.065%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "escapePressed / index = 0"
              }
            },
            "position": {
              "distance": 0.5115384615384615,
              "offset": 10,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "2ecdad3c-6c09-4399-8727-6f01f4c73a07",
        "z": 276,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "6429dc26-ba7a-41ba-a1f4-4e9b1a1b6c20"
        },
        "target": {
          "id": "ef5979e7-e9ee-4cd4-a118-e48b7d3f9689",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "57.944%",
              "dy": "91.304%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "escapePressed / index = 0"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "78fcd361-c4db-4f86-87ac-8f5dd2e7cc9b",
        "z": 276,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "6429dc26-ba7a-41ba-a1f4-4e9b1a1b6c20"
        },
        "target": {
          "id": "9070aac8-774b-474f-9e5c-a07090bb46c7"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "enterPressed"
              }
            },
            "position": {
              "distance": 0.4965982944189936,
              "offset": 5.999998779296874,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "bbf5d7ea-bdfe-4f62-a1b7-bbe9298cf73f",
        "z": 276,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "6429dc26-ba7a-41ba-a1f4-4e9b1a1b6c20",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "22.222%",
              "dy": "100%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "6429dc26-ba7a-41ba-a1f4-4e9b1a1b6c20",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "74.747%",
              "dy": "100%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "nextPressed / index = (index + 1)%3"
              }
            },
            "position": {
              "distance": 0.5277230679190152,
              "offset": 13,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "6ba3fe07-dcc5-4bdd-8890-b5919e10cf9b",
        "z": 276,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -354.5,
            "y": 165
          }
        ],
        "parent": "6429dc26-ba7a-41ba-a1f4-4e9b1a1b6c20"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "f4ea0aca-dd61-4328-a864-6c99416e6c6e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "1.77%",
              "dy": "86.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "5ea5f7d9-9aae-4cf9-b99c-e7a7280f6be6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "51.429%",
              "dy": "86.885%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "escapePressed / index = 0"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "a5604c07-bbf0-4f0b-8d75-617a17b9ac75",
        "z": 278,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "5ea5f7d9-9aae-4cf9-b99c-e7a7280f6be6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "94.286%",
              "dy": "98.361%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "f4ea0aca-dd61-4328-a864-6c99416e6c6e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0.885%",
              "dy": "43.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "enterPressed / speed_m2 = index ; index = 0"
              }
            },
            "position": {
              "distance": 0.8045918755819359,
              "offset": -42,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "cf1e5f4a-5b90-4de8-8383-1f0d73307a80",
        "z": 279,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 148,
            "y": 139
          },
          {
            "x": 204,
            "y": 177
          }
        ]
      },
      {
        "position": {
          "x": -554,
          "y": -75
        },
        "size": {
          "width": 15,
          "height": 15
        },
        "type": "Choice",
        "attrs": {},
        "id": "09e490c7-d634-417b-9177-b1d55b9b9fe8",
        "z": 282
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "ef5979e7-e9ee-4cd4-a118-e48b7d3f9689"
        },
        "target": {
          "id": "09e490c7-d634-417b-9177-b1d55b9b9fe8"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "enterPressed"
              }
            },
            "position": {
              "distance": 0.4999998714711107,
              "offset": -11.000001220703126,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "66539498-6dc4-4f8c-b0a3-55b0360f679a",
        "z": 283,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "09e490c7-d634-417b-9177-b1d55b9b9fe8"
        },
        "target": {
          "id": "6429dc26-ba7a-41ba-a1f4-4e9b1a1b6c20",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "1.01%",
              "dy": "38.71%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "[index == 1] / index = 0"
              }
            },
            "position": {
              "distance": 0.6738532159378586,
              "offset": -14,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "4ee9adc0-c898-4e7a-bb12-9469e7052319",
        "z": 283,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -531.5,
            "y": -8
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "09e490c7-d634-417b-9177-b1d55b9b9fe8"
        },
        "target": {
          "id": "5ce37afe-a2d7-4a86-a6bd-439775499cd6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0%",
              "dy": "19.672%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "else"
              }
            },
            "position": {
              "distance": 0.68590391756297,
              "offset": -14,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "0c57013e-0158-4cd9-854b-a15d2079c583",
        "z": 283,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -545.5,
            "y": -163
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "5ce37afe-a2d7-4a86-a6bd-439775499cd6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0%",
              "dy": "67.213%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "ef5979e7-e9ee-4cd4-a118-e48b7d3f9689",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "42.056%",
              "dy": "21.739%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "escapePressed / index = 0"
              }
            },
            "position": {
              "distance": 0.561118494285667,
              "offset": 10.046890258789062,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "59cd98d1-cbea-4914-aef2-e0b738240a1a",
        "z": 284,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      }
    ]
  },
  "genModel": {
    "generator": {
      "type": "create::c",
      "features": {
        "Outlet": {
          "targetProject": "",
          "targetFolder": "",
          "libraryTargetFolder": "",
          "skipLibraryFiles": "",
          "apiTargetFolder": ""
        },
        "LicenseHeader": {
          "licenseText": ""
        },
        "FunctionInlining": {
          "inlineReactions": false,
          "inlineEntryActions": false,
          "inlineExitActions": false,
          "inlineEnterSequences": false,
          "inlineExitSequences": false,
          "inlineChoices": false,
          "inlineEnterRegion": false,
          "inlineExitRegion": false,
          "inlineEntries": false
        },
        "OutEventAPI": {
          "observables": false,
          "getters": false
        },
        "IdentifierSettings": {
          "moduleName": "SystemSetupMenu",
          "statemachinePrefix": "systemSetupMenu",
          "separator": "_",
          "headerFilenameExtension": "h",
          "sourceFilenameExtension": "c"
        },
        "Tracing": {
          "enterState": false,
          "exitState": false,
          "generic": false
        },
        "Includes": {
          "useRelativePaths": false,
          "generateAllSpecifiedIncludes": false
        },
        "GeneratorOptions": {
          "userAllocatedQueue": false,
          "metaSource": false
        },
        "GeneralFeatures": {
          "timerService": false,
          "timerServiceTimeType": ""
        },
        "Debug": {
          "dumpSexec": false
        }
      }
    }
  }
}