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
            "text": "task_display Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface:\n    in event evUpdate\n    \n    var row : integer = 0\n    var col : integer = 0\n    var c : integer = 0\n    //var flag : boolean = false\n    \n    operation displayCharPositionWrite(col : integer, row : integer) : void\n    operation displayDataWrite(character : integer) : void"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -46,
          "y": -141
        },
        "size": {
          "height": 75,
          "width": 138
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_SET_CURSOR",
            "fontSize": 11
          }
        },
        "id": "186d0e52-22df-4c37-9109-354ff16f0f31",
        "z": 5
      },
      {
        "position": {
          "x": -46,
          "y": 16
        },
        "size": {
          "height": 74,
          "width": 141
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_WRITE_CHAR",
            "fontSize": 11
          }
        },
        "id": "e7b7a1a2-b587-479c-9119-dd0720349059",
        "z": 6,
        "embeds": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "186d0e52-22df-4c37-9109-354ff16f0f31"
        },
        "target": {
          "id": "e7b7a1a2-b587-479c-9119-dd0720349059",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "85.816%",
              "dy": "16.216%",
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
                "text": "after 1 ms / displayCharPositionWrite(row, col)"
              }
            },
            "position": {
              "distance": 0.45121951219512196,
              "offset": -146,
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
        "id": "f6fe43a6-c0e7-4053-af6d-9515f6a6f358",
        "z": 8,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e7b7a1a2-b587-479c-9119-dd0720349059"
        },
        "target": {
          "id": "186d0e52-22df-4c37-9109-354ff16f0f31",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "26.812%",
              "dy": "98.667%",
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
                "text": " after 1 ms [col == 15 && row<3] / displayDataWrite(c); row = row + 1; col = 0"
              }
            },
            "position": {
              "distance": 0.5487804878048781,
              "offset": -227,
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
        "id": "820cc538-63b6-4c41-9f80-48951133ba37",
        "z": 10,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e7b7a1a2-b587-479c-9119-dd0720349059"
        },
        "target": {
          "id": "186d0e52-22df-4c37-9109-354ff16f0f31",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "98.551%",
              "dy": "65.333%",
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
                "text": "after 1 ms [col<15] / displayDataWrite(c); col = col + 1 "
              }
            },
            "position": {
              "distance": 0.2607495772433709,
              "offset": 16,
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
        "id": "bb75f0e1-3b59-4085-a6bd-37cf9aa183f4",
        "z": 14,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 412,
            "y": 24
          }
        ]
      },
      {
        "position": {
          "x": -512,
          "y": -141
        },
        "size": {
          "height": 77,
          "width": 129
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_IDLE",
            "fontSize": 11
          }
        },
        "id": "58eb8758-4c88-4bc4-a826-6df404c8ec12",
        "z": 18
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e7b7a1a2-b587-479c-9119-dd0720349059",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0%",
              "dy": "82.432%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "58eb8758-4c88-4bc4-a826-6df404c8ec12",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "14.729%",
              "dy": "94.805%",
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
                "text": "[row == 3]"
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
        "id": "a1340aab-42e7-4aec-9e5a-7bea63e72f3b",
        "z": 19,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -289,
            "y": 77
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "58eb8758-4c88-4bc4-a826-6df404c8ec12"
        },
        "target": {
          "id": "186d0e52-22df-4c37-9109-354ff16f0f31",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0%",
              "dy": "8%",
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
                "text": "evUpdate / row = 0; col = 0"
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
        "id": "b5f97988-40d7-4eca-b728-efd22d2573fa",
        "z": 19,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -508,
          "y": -244
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "ac071610-3538-4d79-a25c-ea74666f9424",
        "z": 20,
        "embeds": [
          "f8638cef-f17e-4237-a439-141255a32f94"
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
          "x": -508,
          "y": -229
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "f8638cef-f17e-4237-a439-141255a32f94",
        "z": 21,
        "parent": "ac071610-3538-4d79-a25c-ea74666f9424"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "ac071610-3538-4d79-a25c-ea74666f9424"
        },
        "target": {
          "id": "58eb8758-4c88-4bc4-a826-6df404c8ec12",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "8.527%",
              "dy": "41.558%",
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
        "id": "0c7072a0-ab62-4036-bcf7-d297b1dca7d1",
        "z": 22,
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
          "moduleName": "TaskDisplay",
          "statemachinePrefix": "taskDisplay",
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