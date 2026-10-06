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
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface:\n    // Eventos de entrada desde los botones\n    in event Enter\n    in event Next\n    in event Escape\n\n    // Variables de selección de menú\n    var motor : integer = 1  // 0: Motor 1, 1: Motor 2\n    var parametro : integer = 0  // 0: Power, 1: Speed, 2: Spin\n\n    // Estado del Motor 1\n    var m1_power : boolean = true    // true: ON, false: OFF\n    var m1_speed : integer = 0       // 0 a 9\n    var m1_spin  : boolean = true       // 0: LEFT, 1: RIGHT\n\n    // Estado del Motor 2\n    var m2_power : boolean = true\n    var m2_speed : integer = 0\n    var m2_spin  : boolean = true\n\n    // Variables temporales de edición (para guardar al presionar Enter)\n    var temp_power : boolean = true\n    var temp_speed : integer = 0\n    var temp_spin : boolean = false // donde false es LEFT y true es RIGHT"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -344,
          "y": 27.5
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "9c9134cb-4704-4710-a889-d8079a619bb4",
        "z": 6,
        "embeds": [
          "c9785ab8-1a4f-45eb-9504-aa1bef233990"
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
          "x": -344,
          "y": 42.5
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "c9785ab8-1a4f-45eb-9504-aa1bef233990",
        "z": 7,
        "parent": "9c9134cb-4704-4710-a889-d8079a619bb4"
      },
      {
        "position": {
          "x": -29,
          "y": -139
        },
        "size": {
          "height": 338,
          "width": 421
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Menu1",
            "fontSize": 11
          }
        },
        "id": "a13a1210-4b8b-41d9-9de2-5cd4cad7adc5",
        "z": 21,
        "embeds": [
          "bd431c9f-a57c-40ee-bf25-467c67a091e9"
        ]
      },
      {
        "position": {
          "x": -26,
          "y": -94
        },
        "size": {
          "width": 415,
          "height": 290
        },
        "type": "Region",
        "attrs": {
          "priority": {
            "text": 1
          },
          "name": {
            "text": "Subestados = 2 "
          }
        },
        "id": "bd431c9f-a57c-40ee-bf25-467c67a091e9",
        "z": 22,
        "embeds": [
          "5cf1c5a2-5b89-4130-8225-632d78a87f8b",
          "ea5dd47e-bae1-4494-a898-dbc3ae884ba7",
          "3cfd668d-eaae-4cba-baeb-fc556e651cb2",
          "03920e6f-1e70-43b6-8939-e1c8b614f479",
          "fe23c100-51bc-4ea2-ad87-0f1ab11dfd14",
          "b46110c6-3de9-4271-a3a0-79254a4f8f16"
        ],
        "parent": "a13a1210-4b8b-41d9-9de2-5cd4cad7adc5"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "b46110c6-3de9-4271-a3a0-79254a4f8f16"
        },
        "target": {
          "id": "fe23c100-51bc-4ea2-ad87-0f1ab11dfd14",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "35%",
              "dy": "49.167%",
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
        "id": "5cf1c5a2-5b89-4130-8225-632d78a87f8b",
        "z": 25,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "bd431c9f-a57c-40ee-bf25-467c67a091e9"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "03920e6f-1e70-43b6-8939-e1c8b614f479"
        },
        "target": {
          "id": "fe23c100-51bc-4ea2-ad87-0f1ab11dfd14",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "90%",
              "dy": "86.667%",
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
                "text": "Next / motor = 1"
              }
            },
            "position": {
              "distance": 0.47674418604651164,
              "offset": 50,
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
        "id": "ea5dd47e-bae1-4494-a898-dbc3ae884ba7",
        "z": 26,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "bd431c9f-a57c-40ee-bf25-467c67a091e9"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "fe23c100-51bc-4ea2-ad87-0f1ab11dfd14"
        },
        "target": {
          "id": "03920e6f-1e70-43b6-8939-e1c8b614f479",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "16.667%",
              "dy": "40%",
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
                "text": "Next / motor = 2"
              }
            },
            "position": {
              "distance": 0.5348837409220951,
              "offset": 55,
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
        "id": "3cfd668d-eaae-4cba-baeb-fc556e651cb2",
        "z": 27,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "bd431c9f-a57c-40ee-bf25-467c67a091e9"
      },
      {
        "position": {
          "x": 153,
          "y": 98
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Motor2",
            "fontSize": 11
          }
        },
        "id": "03920e6f-1e70-43b6-8939-e1c8b614f479",
        "z": 28,
        "parent": "bd431c9f-a57c-40ee-bf25-467c67a091e9"
      },
      {
        "position": {
          "x": 151,
          "y": -33
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Motor1",
            "fontSize": 11
          }
        },
        "id": "fe23c100-51bc-4ea2-ad87-0f1ab11dfd14",
        "z": 29,
        "parent": "bd431c9f-a57c-40ee-bf25-467c67a091e9"
      },
      {
        "position": {
          "x": 53,
          "y": -14
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "b46110c6-3de9-4271-a3a0-79254a4f8f16",
        "z": 30,
        "embeds": [
          "28bb7aba-895e-4d7c-878f-8746ee2e5600"
        ],
        "parent": "bd431c9f-a57c-40ee-bf25-467c67a091e9"
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 53,
          "y": 1
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "28bb7aba-895e-4d7c-878f-8746ee2e5600",
        "z": 31,
        "parent": "b46110c6-3de9-4271-a3a0-79254a4f8f16"
      },
      {
        "position": {
          "x": -274,
          "y": -18
        },
        "size": {
          "height": 107,
          "width": 124
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Main",
            "fontSize": 11
          }
        },
        "id": "112bbda1-702c-484c-b47b-3273c4643f27",
        "z": 40
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "a13a1210-4b8b-41d9-9de2-5cd4cad7adc5"
        },
        "target": {
          "id": "112bbda1-702c-484c-b47b-3273c4643f27",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "87.903%",
              "dy": "71.963%",
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
                "text": "Escape / motor = 1"
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
        "id": "e5bf6b80-5bbc-4604-a59a-27c367fb7be0",
        "z": 41,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9c9134cb-4704-4710-a889-d8079a619bb4"
        },
        "target": {
          "id": "112bbda1-702c-484c-b47b-3273c4643f27",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "13.71%",
              "dy": "50.467%",
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
        "id": "731f763f-91d6-4654-945e-d7bd6fe97c52",
        "z": 41,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "112bbda1-702c-484c-b47b-3273c4643f27"
        },
        "target": {
          "id": "a13a1210-4b8b-41d9-9de2-5cd4cad7adc5",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0.238%",
              "dy": "43.491%",
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
                "text": "Enter / motor = 1"
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
        "id": "2464b71c-3271-4d95-a2a3-7b2e1b126f49",
        "z": 42,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 538,
          "y": -160
        },
        "size": {
          "height": 391,
          "width": 450
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Menu2",
            "fontSize": 11
          }
        },
        "id": "e8daa847-453c-4eaa-8f32-a2794449c5b1",
        "z": 43,
        "embeds": [
          "f021cda0-aa7a-41b5-b6d8-53eda19f5d1a"
        ]
      },
      {
        "position": {
          "x": 541,
          "y": -115
        },
        "size": {
          "width": 444,
          "height": 343
        },
        "type": "Region",
        "attrs": {
          "priority": {
            "text": 1
          },
          "name": {
            "text": "Subestados = 3"
          }
        },
        "id": "f021cda0-aa7a-41b5-b6d8-53eda19f5d1a",
        "z": 44,
        "embeds": [
          "67373f44-5288-41a5-8d4b-7faa3cf187a3",
          "3c84a668-73b0-44d3-a9c1-563534e95b65",
          "38a835f6-3f08-47ba-9ec3-f405f12fffc2",
          "360ab460-8bb3-4a5c-b5fd-480d5a24981b",
          "36e6856d-5407-4f1b-b98d-304f3c19c09a",
          "69848106-3cc5-4868-8608-ac3fd2f25dc3",
          "8264499a-efe8-4650-b4e9-64b826f9a864",
          "3f2d7826-c43e-4a5c-b668-993a11cb39f4"
        ],
        "parent": "e8daa847-453c-4eaa-8f32-a2794449c5b1"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "36e6856d-5407-4f1b-b98d-304f3c19c09a"
        },
        "target": {
          "id": "8264499a-efe8-4650-b4e9-64b826f9a864",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "86.667%",
              "dy": "58.333%",
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
                "text": "Next / parametro = 0"
              }
            },
            "position": {
              "distance": 0.5038690519474198,
              "offset": 62,
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
        "id": "67373f44-5288-41a5-8d4b-7faa3cf187a3",
        "z": 45,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 844,
            "y": 167
          }
        ],
        "parent": "f021cda0-aa7a-41b5-b6d8-53eda19f5d1a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "69848106-3cc5-4868-8608-ac3fd2f25dc3"
        },
        "target": {
          "id": "36e6856d-5407-4f1b-b98d-304f3c19c09a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "21.667%",
              "dy": "3.333%",
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
                "text": "Next / parametro = 2"
              }
            },
            "position": {
              "distance": 0.4069767441860465,
              "offset": 82,
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
        "id": "3c84a668-73b0-44d3-a9c1-563534e95b65",
        "z": 46,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "f021cda0-aa7a-41b5-b6d8-53eda19f5d1a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "8264499a-efe8-4650-b4e9-64b826f9a864"
        },
        "target": {
          "id": "69848106-3cc5-4868-8608-ac3fd2f25dc3",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "20%",
              "dy": "1.667%",
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
                "text": "Next / parametro = 1"
              }
            },
            "position": {
              "offset": 73,
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
        "id": "38a835f6-3f08-47ba-9ec3-f405f12fffc2",
        "z": 47,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "f021cda0-aa7a-41b5-b6d8-53eda19f5d1a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "a13a1210-4b8b-41d9-9de2-5cd4cad7adc5"
        },
        "target": {
          "id": "e8daa847-453c-4eaa-8f32-a2794449c5b1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0.533%",
              "dy": "41.194%",
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
                "text": "Enter / parametro = 0"
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
        "id": "d6804a9b-b509-4ae4-b655-40bd2d0ff3b4",
        "z": 47,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e8daa847-453c-4eaa-8f32-a2794449c5b1"
        },
        "target": {
          "id": "a13a1210-4b8b-41d9-9de2-5cd4cad7adc5",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "99.762%",
              "dy": "68.047%",
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
                "text": "Escape / motor = 1"
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
        "id": "c0b7ecca-f950-44c6-80ad-954eac042d7d",
        "z": 47,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "3f2d7826-c43e-4a5c-b668-993a11cb39f4"
        },
        "target": {
          "id": "8264499a-efe8-4650-b4e9-64b826f9a864",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "6.667%",
              "dy": "52.5%",
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
        "id": "360ab460-8bb3-4a5c-b5fd-480d5a24981b",
        "z": 48,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "f021cda0-aa7a-41b5-b6d8-53eda19f5d1a"
      },
      {
        "position": {
          "x": 758,
          "y": 147
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Spin",
            "fontSize": 11
          }
        },
        "id": "36e6856d-5407-4f1b-b98d-304f3c19c09a",
        "z": 49,
        "parent": "f021cda0-aa7a-41b5-b6d8-53eda19f5d1a"
      },
      {
        "position": {
          "x": 758,
          "y": 44
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Speed",
            "fontSize": 11
          }
        },
        "id": "69848106-3cc5-4868-8608-ac3fd2f25dc3",
        "z": 50,
        "parent": "f021cda0-aa7a-41b5-b6d8-53eda19f5d1a"
      },
      {
        "position": {
          "x": 753,
          "y": -77
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Power",
            "fontSize": 11
          }
        },
        "id": "8264499a-efe8-4650-b4e9-64b826f9a864",
        "z": 51,
        "parent": "f021cda0-aa7a-41b5-b6d8-53eda19f5d1a"
      },
      {
        "position": {
          "x": 561,
          "y": -54
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "3f2d7826-c43e-4a5c-b668-993a11cb39f4",
        "z": 52,
        "embeds": [
          "67782dc1-8884-4947-95e9-a2fe244210b4"
        ],
        "parent": "f021cda0-aa7a-41b5-b6d8-53eda19f5d1a"
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 561,
          "y": -39
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "67782dc1-8884-4947-95e9-a2fe244210b4",
        "z": 53,
        "parent": "3f2d7826-c43e-4a5c-b668-993a11cb39f4"
      },
      {
        "position": {
          "x": 1162,
          "y": -212
        },
        "size": {
          "height": 527,
          "width": 878
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Menu3",
            "fontSize": 11
          }
        },
        "id": "adc2dbf9-44df-4e64-8f30-e3811c22cbc2",
        "z": 54,
        "embeds": [
          "02e143d9-8066-4bfb-b8ec-86af83805050"
        ]
      },
      {
        "position": {
          "x": 1165,
          "y": -167
        },
        "size": {
          "width": 872,
          "height": 479
        },
        "type": "Region",
        "attrs": {
          "priority": {
            "text": 1
          },
          "name": {
            "text": "Subestados = 3"
          }
        },
        "id": "02e143d9-8066-4bfb-b8ec-86af83805050",
        "z": 55,
        "embeds": [
          "0a875645-13b9-452c-9bb1-04590f35cd4d",
          "91ead338-05c0-449f-8b98-df4bb0bfd574",
          "ecfa2359-ec30-46fa-a889-70deeb7c2488",
          "1b111069-2d46-4397-b122-66947d738614",
          "dace447d-7572-48fd-9500-b6c014be4bd0",
          "9342b187-92f6-4e98-8d36-cdd2e3847c2d",
          "a2cd720c-83e6-4f97-a9e5-535723e7c32b",
          "18e8cf4e-cab6-4490-9fe9-e79c04b0ff7f",
          "0037d7ef-99ba-4ade-bc61-42c00817e721",
          "993d4fc3-2ad1-4515-aaa4-2acfc453006b",
          "07fae540-5904-4625-8638-83cb102acfad",
          "f6434e49-2f87-4658-8daf-4e518ff314fc",
          "50693e0c-0145-4308-b813-8e8da71a46b1",
          "9aa0be4f-d2ba-4f65-9447-719c12f5ab2c",
          "c9a2858d-0f0a-4c6f-9247-cf22b80d0f1d",
          "18b670ca-a5a8-4f4d-8ce3-275821c2c3ab",
          "9d5f1268-252a-46b9-a7a5-9753a8154387",
          "06501d6d-bca6-4cfe-a8f8-f9633306c14c",
          "a4f49dfd-2d06-4bbd-ae25-55a93b83ba63",
          "dc5cafd1-e1db-449c-8b66-d0fc08b336c0",
          "99454358-fcbf-444c-9cf6-a2f6a2c6025f",
          "583ca1da-00ee-4bfe-96ac-30786bb14740"
        ],
        "parent": "adc2dbf9-44df-4e64-8f30-e3811c22cbc2"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9aa0be4f-d2ba-4f65-9447-719c12f5ab2c"
        },
        "target": {
          "id": "dc5cafd1-e1db-449c-8b66-d0fc08b336c0"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "Enter"
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
        "id": "0a875645-13b9-452c-9bb1-04590f35cd4d",
        "z": 56,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "dc5cafd1-e1db-449c-8b66-d0fc08b336c0"
        },
        "target": {
          "id": "583ca1da-00ee-4bfe-96ac-30786bb14740"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "[motor == 1] / m1_spin = temp_spin"
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
        "id": "91ead338-05c0-449f-8b98-df4bb0bfd574",
        "z": 57,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 1836,
            "y": 144
          }
        ],
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "dc5cafd1-e1db-449c-8b66-d0fc08b336c0"
        },
        "target": {
          "id": "583ca1da-00ee-4bfe-96ac-30786bb14740"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "else / m2_spin = temp_spin"
              }
            },
            "position": {
              "distance": 0.4649135262303994,
              "offset": -11.977175151837397,
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
        "id": "ecfa2359-ec30-46fa-a889-70deeb7c2488",
        "z": 58,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "99454358-fcbf-444c-9cf6-a2f6a2c6025f"
        },
        "target": {
          "id": "583ca1da-00ee-4bfe-96ac-30786bb14740"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "[motor == 1] / m1_speed = temp_speed"
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
        "id": "1b111069-2d46-4397-b122-66947d738614",
        "z": 59,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "99454358-fcbf-444c-9cf6-a2f6a2c6025f"
        },
        "target": {
          "id": "583ca1da-00ee-4bfe-96ac-30786bb14740"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "else / m2_speed = temp_speed"
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
        "id": "dace447d-7572-48fd-9500-b6c014be4bd0",
        "z": 60,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 1791,
            "y": 91.5
          }
        ],
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "a4f49dfd-2d06-4bbd-ae25-55a93b83ba63"
        },
        "target": {
          "id": "583ca1da-00ee-4bfe-96ac-30786bb14740"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "else / m2_power = temp_power"
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
        "id": "9342b187-92f6-4e98-8d36-cdd2e3847c2d",
        "z": 61,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 1802,
            "y": -10
          }
        ],
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "a4f49dfd-2d06-4bbd-ae25-55a93b83ba63"
        },
        "target": {
          "id": "583ca1da-00ee-4bfe-96ac-30786bb14740"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "[motor == 1] / m1_power = temp_power"
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
        "id": "a2cd720c-83e6-4f97-a9e5-535723e7c32b",
        "z": 62,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "18b670ca-a5a8-4f4d-8ce3-275821c2c3ab"
        },
        "target": {
          "id": "99454358-fcbf-444c-9cf6-a2f6a2c6025f"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "Enter"
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
        "id": "18e8cf4e-cab6-4490-9fe9-e79c04b0ff7f",
        "z": 63,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c9a2858d-0f0a-4c6f-9247-cf22b80d0f1d"
        },
        "target": {
          "id": "a4f49dfd-2d06-4bbd-ae25-55a93b83ba63"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "Enter"
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
        "id": "0037d7ef-99ba-4ade-bc61-42c00817e721",
        "z": 64,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "06501d6d-bca6-4cfe-a8f8-f9633306c14c"
        },
        "target": {
          "id": "9d5f1268-252a-46b9-a7a5-9753a8154387"
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
        "id": "993d4fc3-2ad1-4515-aaa4-2acfc453006b",
        "z": 65,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9d5f1268-252a-46b9-a7a5-9753a8154387"
        },
        "target": {
          "id": "9aa0be4f-d2ba-4f65-9447-719c12f5ab2c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "5%",
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
                "text": "else"
              }
            },
            "position": {
              "distance": 0.6958911627429234,
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
        "id": "07fae540-5904-4625-8638-83cb102acfad",
        "z": 66,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 1308.5,
            "y": 159
          }
        ],
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e8daa847-453c-4eaa-8f32-a2794449c5b1"
        },
        "target": {
          "id": "adc2dbf9-44df-4e64-8f30-e3811c22cbc2",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0%",
              "dy": "33.686%",
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
                "text": "Enter"
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
        "id": "dc5ffe32-0614-40b4-a5bd-9e3e06ca22df",
        "z": 66,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9d5f1268-252a-46b9-a7a5-9753a8154387"
        },
        "target": {
          "id": "18b670ca-a5a8-4f4d-8ce3-275821c2c3ab",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "10%",
              "dy": "35.833%",
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
                "text": "[parametro == 1]"
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
        "id": "f6434e49-2f87-4658-8daf-4e518ff314fc",
        "z": 67,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "adc2dbf9-44df-4e64-8f30-e3811c22cbc2"
        },
        "target": {
          "id": "e8daa847-453c-4eaa-8f32-a2794449c5b1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "99.556%",
              "dy": "69.309%",
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
                "text": "Escape / parametro = 0"
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
        "id": "e8f504ad-46ab-42f5-a710-65d13454c443",
        "z": 67,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9d5f1268-252a-46b9-a7a5-9753a8154387"
        },
        "target": {
          "id": "c9a2858d-0f0a-4c6f-9247-cf22b80d0f1d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "10%",
              "dy": "55%",
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
                "text": "[parametro == 0]"
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
        "id": "50693e0c-0145-4308-b813-8e8da71a46b1",
        "z": 68,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 1308.5,
            "y": -41
          }
        ],
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050"
      },
      {
        "position": {
          "x": 1463,
          "y": 158
        },
        "size": {
          "height": 62,
          "width": 68
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Edit_Spin",
            "fontSize": 11
          }
        },
        "id": "9aa0be4f-d2ba-4f65-9447-719c12f5ab2c",
        "z": 69,
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050",
        "embeds": [
          "cbafdf6e-4bd2-4719-bf47-f6113d96efb1"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9aa0be4f-d2ba-4f65-9447-719c12f5ab2c"
        },
        "target": {
          "id": "9aa0be4f-d2ba-4f65-9447-719c12f5ab2c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "75%",
              "dy": "96.774%",
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
                "text": "Next / temp_spin = !temp_spin"
              }
            },
            "position": {
              "distance": 0.5163590996792999,
              "offset": 11.020459505825992,
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
        "id": "cbafdf6e-4bd2-4719-bf47-f6113d96efb1",
        "z": 70,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "9aa0be4f-d2ba-4f65-9447-719c12f5ab2c"
      },
      {
        "position": {
          "x": 1457,
          "y": -96
        },
        "size": {
          "height": 61,
          "width": 67
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Edit_Power",
            "fontSize": 11
          }
        },
        "id": "c9a2858d-0f0a-4c6f-9247-cf22b80d0f1d",
        "z": 71,
        "embeds": [
          "de7ae344-b553-4f5b-89e8-5daff6a706da"
        ],
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c9a2858d-0f0a-4c6f-9247-cf22b80d0f1d"
        },
        "target": {
          "id": "c9a2858d-0f0a-4c6f-9247-cf22b80d0f1d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "25.373%",
              "dy": "8.197%",
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
                "text": "Next / temp_power = !temp_power"
              }
            },
            "position": {
              "distance": 0.6457216539263394,
              "offset": 36.43602469177568,
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
        "id": "de7ae344-b553-4f5b-89e8-5daff6a706da",
        "z": 72,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "c9a2858d-0f0a-4c6f-9247-cf22b80d0f1d"
      },
      {
        "position": {
          "x": 1462,
          "y": 30
        },
        "size": {
          "height": 61,
          "width": 67
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Edit_Speed",
            "fontSize": 11
          }
        },
        "id": "18b670ca-a5a8-4f4d-8ce3-275821c2c3ab",
        "z": 73,
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050",
        "embeds": [
          "9011923e-9f79-424a-99b1-9ae0fbbf3830",
          "893d9676-9eec-4596-aa1c-eb6c85053923"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "18b670ca-a5a8-4f4d-8ce3-275821c2c3ab"
        },
        "target": {
          "id": "18b670ca-a5a8-4f4d-8ce3-275821c2c3ab",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "79.104%",
              "dy": "13.115%",
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
                "text": "Next [temp_speed == 9] / temp_speed = 0"
              }
            },
            "position": {
              "distance": 0.5950990033022285,
              "offset": -9.15729747723319,
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
        "id": "9011923e-9f79-424a-99b1-9ae0fbbf3830",
        "z": 74,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "18b670ca-a5a8-4f4d-8ce3-275821c2c3ab"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "18b670ca-a5a8-4f4d-8ce3-275821c2c3ab"
        },
        "target": {
          "id": "18b670ca-a5a8-4f4d-8ce3-275821c2c3ab",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "76.119%",
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
                "text": "Next [temp_speed < 9] / temp_speed = temp_speed + 1"
              }
            },
            "position": {
              "distance": 0.5581763440145234,
              "offset": 8.661990434068226,
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
        "id": "893d9676-9eec-4596-aa1c-eb6c85053923",
        "z": 75,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "18b670ca-a5a8-4f4d-8ce3-275821c2c3ab"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "adc2dbf9-44df-4e64-8f30-e3811c22cbc2"
        },
        "target": {
          "id": "e8daa847-453c-4eaa-8f32-a2794449c5b1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "100%",
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
                "text": "/ parametro = 0"
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
        "id": "1160c487-30a9-4202-8cef-6171eec9b5ab",
        "z": 75,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 1303,
          "y": 45
        },
        "size": {
          "width": 15,
          "height": 15
        },
        "type": "Choice",
        "attrs": {},
        "id": "9d5f1268-252a-46b9-a7a5-9753a8154387",
        "z": 76,
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050"
      },
      {
        "position": {
          "x": 1200,
          "y": 44
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "06501d6d-bca6-4cfe-a8f8-f9633306c14c",
        "z": 77,
        "embeds": [
          "009cb335-dd2a-4d8e-8502-e786a7a66fa1"
        ],
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050"
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 1200,
          "y": 59
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "009cb335-dd2a-4d8e-8502-e786a7a66fa1",
        "z": 78,
        "parent": "06501d6d-bca6-4cfe-a8f8-f9633306c14c"
      },
      {
        "position": {
          "x": 1691,
          "y": -77
        },
        "size": {
          "width": 15,
          "height": 15
        },
        "type": "Choice",
        "attrs": {},
        "id": "a4f49dfd-2d06-4bbd-ae25-55a93b83ba63",
        "z": 79,
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050"
      },
      {
        "position": {
          "x": 1691,
          "y": 184
        },
        "size": {
          "width": 15,
          "height": 15
        },
        "type": "Choice",
        "attrs": {},
        "id": "dc5cafd1-e1db-449c-8b66-d0fc08b336c0",
        "z": 80,
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050"
      },
      {
        "position": {
          "x": 1693,
          "y": 50
        },
        "size": {
          "width": 15,
          "height": 15
        },
        "type": "Choice",
        "attrs": {},
        "id": "99454358-fcbf-444c-9cf6-a2f6a2c6025f",
        "z": 81,
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050"
      },
      {
        "position": {
          "x": 1951,
          "y": 80
        },
        "size": {
          "height": 23,
          "width": 23
        },
        "type": "Exit",
        "attrs": {},
        "id": "583ca1da-00ee-4bfe-96ac-30786bb14740",
        "z": 82,
        "embeds": [
          "48f023cb-a885-46d4-b141-ddfba87b0162"
        ],
        "parent": "02e143d9-8066-4bfb-b8ec-86af83805050"
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 1979,
          "y": 84
        },
        "attrs": {
          "label": {
            "refX": 0,
            "textAnchor": "start",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "48f023cb-a885-46d4-b141-ddfba87b0162",
        "z": 83,
        "parent": "583ca1da-00ee-4bfe-96ac-30786bb14740"
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