{
	"patcher": {
		"fileversion": 1,
		"appversion": {
			"major": 9,
			"minor": 1,
			"revision": 2,
			"architecture": "x64",
			"modernui": 1
		},
		"classnamespace": "box",
		"rect": [ 100.0, 100.0, 1020.0, 800.0 ],
		"bglocked": 0,
		"openinpresentation": 0,
		"default_fontsize": 12.0,
		"default_fontface": 0,
		"default_fontname": "Arial",
		"gridonopen": 1,
		"gridsize": [ 15.0, 15.0 ],
		"gridsnaponopen": 1,
		"objectsnaponopen": 1,
		"statusbarvisible": 2,
		"toolbarvisible": 1,
		"boxanimatetime": 200,
		"enablehscroll": 1,
		"enablevscroll": 1,
		"devicewidth": 0.0,
		"boxes": [
			{
				"box": {
					"id": "obj-title",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 40.0, 15.0, 800.0, 22.0 ],
					"text": "xiroqs / follow_stutter / event v3 — a_time grid (機械的時間制度)",
					"fontsize": 14.0
				}
			},
			{
				"box": {
					"id": "obj-c1",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 40.0, 50.0, 500.0, 20.0 ],
					"text": "① selector UI  (follow)"
				}
			},
			{
				"box": {
					"id": "obj-replace",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [ "" ],
					"patching_rect": [ 40.0, 80.0, 60.0, 22.0 ],
					"text": "replace"
				}
			},
			{
				"box": {
					"id": "obj-replace-lbl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 105.0, 81.0, 200.0, 20.0 ],
					"text": "← クリックで wav 選択"
				}
			},
			{
				"box": {
					"id": "obj-buf",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [ "bang", "" ],
					"patching_rect": [ 40.0, 115.0, 220.0, 22.0 ],
					"text": "buffer~ stutter_src_g 30000 2"
				}
			},
			{
				"box": {
					"id": "obj-setL",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [ "" ],
					"patching_rect": [ 280.0, 50.0, 220.0, 22.0 ],
					"text": "set stutter_src_g 1, mode select"
				}
			},
			{
				"box": {
					"id": "obj-setR",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [ "" ],
					"patching_rect": [ 580.0, 50.0, 220.0, 22.0 ],
					"text": "set stutter_src_g 2, mode select"
				}
			},
			{
				"box": {
					"id": "obj-wL",
					"maxclass": "waveform~",
					"buffername": "stutter_src_g",
					"setmode": 1,
					"numinlets": 5,
					"numoutlets": 6,
					"outlettype": [ "float", "float", "float", "float", "float", "list" ],
					"patching_rect": [ 280.0, 80.0, 280.0, 110.0 ]
				}
			},
			{
				"box": {
					"id": "obj-wR",
					"maxclass": "waveform~",
					"buffername": "stutter_src_g",
					"setmode": 1,
					"numinlets": 5,
					"numoutlets": 6,
					"outlettype": [ "float", "float", "float", "float", "float", "list" ],
					"patching_rect": [ 580.0, 80.0, 280.0, 110.0 ]
				}
			},
			{
				"box": {
					"id": "obj-wL-lbl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 280.0, 195.0, 100.0, 20.0 ],
					"text": "wL (channel 1)"
				}
			},
			{
				"box": {
					"id": "obj-wR-lbl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 580.0, 195.0, 100.0, 20.0 ],
					"text": "wR (channel 2)"
				}
			},
			{
				"box": {
					"id": "obj-sndss",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 280.0, 220.0, 130.0, 22.0 ],
					"text": "send selstart_g"
				}
			},
			{
				"box": {
					"id": "obj-sndse",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 430.0, 220.0, 130.0, 22.0 ],
					"text": "send selend_g"
				}
			},
			{
				"box": {
					"id": "obj-c2",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 40.0, 270.0, 700.0, 20.0 ],
					"text": "② trigger 層 — a_time による機械的時間制度"
				}
			},
			{
				"box": {
					"id": "obj-metroon",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [ "int" ],
					"parameter_enable": 0,
					"patching_rect": [ 40.0, 300.0, 24.0, 24.0 ]
				}
			},
			{
				"box": {
					"id": "obj-metroon-lbl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 70.0, 302.0, 100.0, 20.0 ],
					"text": "trigger on/off"
				}
			},
			{
				"box": {
					"id": "obj-metro",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [ "bang" ],
					"patching_rect": [ 40.0, 335.0, 100.0, 22.0 ],
					"text": "metro 100"
				}
			},
			{
				"box": {
					"id": "obj-metro-lbl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 150.0, 337.0, 250.0, 20.0 ],
					"text": "← 16分の粒 (100ms)"
				}
			},
			{
				"box": {
					"id": "obj-atime",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [ "int" ],
					"patching_rect": [ 40.0, 370.0, 100.0, 22.0 ],
					"text": "a_time 15 4"
				}
			},
			{
				"box": {
					"id": "obj-atime-lbl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 150.0, 372.0, 400.0, 20.0 ],
					"text": "← counter 0 15 → % 4  (16分グリッド / 4拍)"
				}
			},
			{
				"box": {
					"id": "obj-sel",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [ "bang", "bang", "int" ],
					"patching_rect": [ 40.0, 405.0, 100.0, 22.0 ],
					"text": "sel 0 2"
				}
			},
			{
				"box": {
					"id": "obj-sel-lbl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 150.0, 407.0, 400.0, 20.0 ],
					"text": "← 拍頭(0)と裏(2)で発火"
				}
			},
			{
				"box": {
					"id": "obj-startloop",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [ "" ],
					"patching_rect": [ 40.0, 445.0, 80.0, 22.0 ],
					"text": "startloop"
				}
			},
			{
				"box": {
					"id": "obj-c3",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 40.0, 490.0, 700.0, 20.0 ],
					"text": "③ groove~ source"
				}
			},
			{
				"box": {
					"id": "obj-loadb",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [ "bang" ],
					"patching_rect": [ 540.0, 490.0, 70.0, 22.0 ],
					"text": "loadbang"
				}
			},
			{
				"box": {
					"id": "obj-loop1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [ "" ],
					"patching_rect": [ 540.0, 520.0, 60.0, 22.0 ],
					"text": "loop 1"
				}
			},
			{
				"box": {
					"id": "obj-sig1",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [ "signal" ],
					"patching_rect": [ 40.0, 520.0, 60.0, 22.0 ],
					"text": "sig~ 1"
				}
			},
			{
				"box": {
					"id": "obj-rss",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [ "" ],
					"patching_rect": [ 130.0, 520.0, 130.0, 22.0 ],
					"text": "receive selstart_g"
				}
			},
			{
				"box": {
					"id": "obj-rse",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [ "" ],
					"patching_rect": [ 280.0, 520.0, 130.0, 22.0 ],
					"text": "receive selend_g"
				}
			},
			{
				"box": {
					"id": "obj-groove",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 3,
					"outlettype": [ "signal", "signal", "signal" ],
					"patching_rect": [ 40.0, 560.0, 460.0, 22.0 ],
					"text": "groove~ stutter_src_g 2"
				}
			},
			{
				"box": {
					"id": "obj-mulL",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [ "signal" ],
					"patching_rect": [ 40.0, 600.0, 60.0, 22.0 ],
					"text": "*~ 0.7"
				}
			},
			{
				"box": {
					"id": "obj-mulR",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [ "signal" ],
					"patching_rect": [ 120.0, 600.0, 60.0, 22.0 ],
					"text": "*~ 0.7"
				}
			},
			{
				"box": {
					"id": "obj-ezdac",
					"maxclass": "ezdac~",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [ 40.0, 640.0, 45.0, 45.0 ]
				}
			},
			{
				"box": {
					"id": "obj-ezdac-lbl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [ 95.0, 653.0, 250.0, 20.0 ],
					"text": "ezdac~ (audio on/off マスター)"
				}
			},
			{
				"box": {
					"id": "obj-note",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"linecount": 14,
					"patching_rect": [ 540.0, 270.0, 460.0, 200.0 ],
					"text": "v3 — a_time grid のポイント:\n\n[metro 100] → [a_time 15 4] → [sel 0 2] → [startloop]\n\n機械的時間制度:\n• metro 100ms = 16分の粒\n• a_time 15 4 = 0-15 を循環 → 4 で割る\n  → 0,1,2,3 を繰り返す (= 拍位置)\n• sel 0 2 = 拍頭と裏でだけ発火\n\n演奏(有機) + trigger(機械) の対比\nclick / 切替痕は時間構造の露出として残す\n\n試して: 範囲を選んで trigger ON\n         → 16分グリッドが演奏に被さる"
				}
			}
		],
		"lines": [
			{ "patchline": { "destination": [ "obj-buf", 0 ], "source": [ "obj-replace", 0 ] } },
			{ "patchline": { "destination": [ "obj-setL", 0 ], "source": [ "obj-buf", 1 ] } },
			{ "patchline": { "destination": [ "obj-setR", 0 ], "source": [ "obj-buf", 1 ] } },
			{ "patchline": { "destination": [ "obj-wL", 0 ], "source": [ "obj-setL", 0 ] } },
			{ "patchline": { "destination": [ "obj-wR", 0 ], "source": [ "obj-setR", 0 ] } },
			{ "patchline": { "destination": [ "obj-wR", 4 ], "source": [ "obj-wL", 5 ] } },
			{ "patchline": { "destination": [ "obj-wL", 4 ], "source": [ "obj-wR", 5 ] } },
			{ "patchline": { "destination": [ "obj-sndss", 0 ], "source": [ "obj-wL", 2 ] } },
			{ "patchline": { "destination": [ "obj-sndse", 0 ], "source": [ "obj-wL", 3 ] } },
			{ "patchline": { "destination": [ "obj-metro", 0 ], "source": [ "obj-metroon", 0 ] } },
			{ "patchline": { "destination": [ "obj-atime", 0 ], "source": [ "obj-metro", 0 ] } },
			{ "patchline": { "destination": [ "obj-sel", 0 ], "source": [ "obj-atime", 0 ] } },
			{ "patchline": { "destination": [ "obj-startloop", 0 ], "source": [ "obj-sel", 0 ] } },
			{ "patchline": { "destination": [ "obj-startloop", 0 ], "source": [ "obj-sel", 1 ] } },
			{ "patchline": { "destination": [ "obj-groove", 0 ], "source": [ "obj-startloop", 0 ] } },
			{ "patchline": { "destination": [ "obj-loop1", 0 ], "source": [ "obj-loadb", 0 ] } },
			{ "patchline": { "destination": [ "obj-groove", 0 ], "source": [ "obj-loop1", 0 ] } },
			{ "patchline": { "destination": [ "obj-groove", 0 ], "source": [ "obj-sig1", 0 ] } },
			{ "patchline": { "destination": [ "obj-groove", 1 ], "source": [ "obj-rss", 0 ] } },
			{ "patchline": { "destination": [ "obj-groove", 2 ], "source": [ "obj-rse", 0 ] } },
			{ "patchline": { "destination": [ "obj-mulL", 0 ], "source": [ "obj-groove", 0 ] } },
			{ "patchline": { "destination": [ "obj-mulR", 0 ], "source": [ "obj-groove", 1 ] } },
			{ "patchline": { "destination": [ "obj-ezdac", 0 ], "source": [ "obj-mulL", 0 ] } },
			{ "patchline": { "destination": [ "obj-ezdac", 1 ], "source": [ "obj-mulR", 0 ] } }
		]
	}
}
