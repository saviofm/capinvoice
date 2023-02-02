{
	"contents": {
		"506e96b1-2056-474a-bcd8-012ff201b5ea": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "capinvoice.wfentradafaturaapi",
			"subject": "WFEntradaFaturaAPI",
			"customAttributes": [],
			"name": "WFEntradaFaturaAPI",
			"documentation": "Workflow avançado entrada de fatura",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "Start Event"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "End Event"
				}
			},
			"activities": {
				"6d5091cf-25ae-4eee-bc1d-4b522efda8b8": {
					"name": "Aprovacao"
				},
				"65e6bf69-c333-45dc-8b41-b884078326c2": {
					"name": "Definir contexto saida"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"4349923e-ab3d-4345-bb48-3e6ca45eed0b": {
					"name": "SequenceFlow2"
				},
				"b4023586-d9cc-4e32-910f-e38244687594": {
					"name": "SequenceFlow3"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "Start Event"
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "End Event"
		},
		"6d5091cf-25ae-4eee-bc1d-4b522efda8b8": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Aprovação de Entrada de Fatura ${context.Fatura.invoiceNumber} - ${context.fatura.senderName}",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${context.Aprovadores.eMail}",
			"recipientGroups": "${context.Aprovadores.grupo}",
			"formReference": "/forms/WFEntradaFaturaAPI/FormAprovacaoFaturaWFAPI.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "formaprovacaofaturawfapi"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask1",
			"name": "Aprovacao",
			"dueDateRef": "11d8f1d1-f976-4f46-8462-a97f58ebdbd8"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "6d5091cf-25ae-4eee-bc1d-4b522efda8b8"
		},
		"4349923e-ab3d-4345-bb48-3e6ca45eed0b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "6d5091cf-25ae-4eee-bc1d-4b522efda8b8",
			"targetRef": "65e6bf69-c333-45dc-8b41-b884078326c2"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"57a1b542-8c21-4a2a-8e56-5f44c196274d": {},
				"ea1f97c8-d24a-4fd7-97a3-5e65fab1aff8": {},
				"57543398-1ee6-4b51-bc52-19283204fe2d": {},
				"d1f2c224-2476-47ae-902a-6b08712204ca": {}
			}
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 100,
			"y": 100,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 448,
			"y": 98,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "116,116 228,116",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "57a1b542-8c21-4a2a-8e56-5f44c196274d",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"57a1b542-8c21-4a2a-8e56-5f44c196274d": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 178,
			"y": 86,
			"width": 100,
			"height": 60,
			"object": "6d5091cf-25ae-4eee-bc1d-4b522efda8b8"
		},
		"ea1f97c8-d24a-4fd7-97a3-5e65fab1aff8": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "228,116 357,116",
			"sourceSymbol": "57a1b542-8c21-4a2a-8e56-5f44c196274d",
			"targetSymbol": "57543398-1ee6-4b51-bc52-19283204fe2d",
			"object": "4349923e-ab3d-4345-bb48-3e6ca45eed0b"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"timereventdefinition": 1,
			"sequenceflow": 3,
			"startevent": 1,
			"endevent": 1,
			"usertask": 1,
			"scripttask": 1
		},
		"11d8f1d1-f976-4f46-8462-a97f58ebdbd8": {
			"classDefinition": "com.sap.bpm.wfs.TimerEventDefinition",
			"timeDuration": "PT5M",
			"id": "timereventdefinition1"
		},
		"65e6bf69-c333-45dc-8b41-b884078326c2": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/WFEntradaFaturaAPI/definirsaida.js",
			"id": "scripttask1",
			"name": "Definir contexto saida"
		},
		"57543398-1ee6-4b51-bc52-19283204fe2d": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 307,
			"y": 86,
			"width": 100,
			"height": 60,
			"object": "65e6bf69-c333-45dc-8b41-b884078326c2"
		},
		"b4023586-d9cc-4e32-910f-e38244687594": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "65e6bf69-c333-45dc-8b41-b884078326c2",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"d1f2c224-2476-47ae-902a-6b08712204ca": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "357,115.75 465.5,115.75",
			"sourceSymbol": "57543398-1ee6-4b51-bc52-19283204fe2d",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "b4023586-d9cc-4e32-910f-e38244687594"
		}
	}
}