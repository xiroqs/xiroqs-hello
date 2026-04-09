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
		"rect": [ 80.0, 80.0, 1280.0, 1500.0 ],
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
			{ "box": { "id": "obj-title", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 40.0, 15.0, 900.0, 22.0 ], "text": "xiroqs / follow_stutter / event v7 — scan-capture + waveform-loop", "fontsize": 14.0 } },

			{ "box": { "id": "obj-c1", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 40.0, 50.0, 400.0, 20.0 ], "text": "① selector UI (mode 2 で参照)" } },
			{ "box": { "id": "obj-replace", "maxclass": "message", "numinlets": 2, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 40.0, 80.0, 60.0, 22.0 ], "text": "replace" } },
			{ "box": { "id": "obj-replace-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 105.0, 81.0, 200.0, 20.0 ], "text": "← クリックで wav 選択" } },
			{ "box": { "id": "obj-buf", "maxclass": "newobj", "numinlets": 1, "numoutlets": 2, "outlettype": [ "bang", "" ], "patching_rect": [ 40.0, 115.0, 220.0, 22.0 ], "text": "buffer~ source_v7 30000 2" } },
			{ "box": { "id": "obj-setL", "maxclass": "message", "numinlets": 2, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 280.0, 50.0, 220.0, 22.0 ], "text": "set source_v7 1, mode select" } },
			{ "box": { "id": "obj-setR", "maxclass": "message", "numinlets": 2, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 580.0, 50.0, 220.0, 22.0 ], "text": "set source_v7 2, mode select" } },
			{ "box": { "id": "obj-wL", "maxclass": "waveform~", "buffername": "source_v7", "setmode": 1, "numinlets": 5, "numoutlets": 6, "outlettype": [ "float", "float", "float", "float", "float", "list" ], "patching_rect": [ 280.0, 80.0, 280.0, 110.0 ] } },
			{ "box": { "id": "obj-wR", "maxclass": "waveform~", "buffername": "source_v7", "setmode": 1, "numinlets": 5, "numoutlets": 6, "outlettype": [ "float", "float", "float", "float", "float", "list" ], "patching_rect": [ 580.0, 80.0, 280.0, 110.0 ] } },
			{ "box": { "id": "obj-wL-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 280.0, 195.0, 100.0, 20.0 ], "text": "wL (channel 1)" } },
			{ "box": { "id": "obj-wR-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 580.0, 195.0, 100.0, 20.0 ], "text": "wR (channel 2)" } },
			{ "box": { "id": "obj-sndss", "maxclass": "newobj", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 280.0, 220.0, 130.0, 22.0 ], "text": "send selstart_v7" } },
			{ "box": { "id": "obj-sndse", "maxclass": "newobj", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 430.0, 220.0, 130.0, 22.0 ], "text": "send selend_v7" } },

			{ "box": { "id": "obj-c2", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 40.0, 270.0, 700.0, 20.0 ], "text": "② mode toggle (0=scan-capture / 1=waveform-loop)" } },
			{ "box": { "id": "obj-mode", "maxclass": "toggle", "numinlets": 1, "numoutlets": 1, "outlettype": [ "int" ], "parameter_enable": 0, "patching_rect": [ 40.0, 300.0, 24.0, 24.0 ] } },
			{ "box": { "id": "obj-mode-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 70.0, 302.0, 350.0, 20.0 ], "text": "mode (off=scan-capture / on=waveform-loop)" } },
			{ "box": { "id": "obj-snd-mode", "maxclass": "newobj", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 40.0, 330.0, 130.0, 22.0 ], "text": "send mode_v7" } },

			{ "box": { "id": "obj-c3", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 40.0, 380.0, 700.0, 20.0 ], "text": "③ scanner — 連続進行する playhead (mode 1 で参照、音は出さない)" } },
			{ "box": { "id": "obj-scan-loadb", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "bang" ], "patching_rect": [ 540.0, 410.0, 70.0, 22.0 ] , "text": "loadbang" } },
			{ "box": { "id": "obj-scan-loop1", "maxclass": "message", "numinlets": 2, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 540.0, 440.0, 60.0, 22.0 ], "text": "loop 1" } },
			{ "box": { "id": "obj-scan-min", "maxclass": "message", "numinlets": 2, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 200.0, 440.0, 50.0, 22.0 ], "text": "0." } },
			{ "box": { "id": "obj-scan-min-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 260.0, 442.0, 200.0, 20.0 ], "text": "← scanner loop_min (固定 0)" } },
			{ "box": { "id": "obj-scan-max-flonum", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "parameter_enable": 0, "patching_rect": [ 380.0, 440.0, 80.0, 22.0 ] } },
			{ "box": { "id": "obj-scan-max-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 470.0, 442.0, 250.0, 20.0 ], "text": "← scanner loop_max (= wav長 ms 手入力)" } },

			{ "box": { "id": "obj-scan-sig", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 40.0, 440.0, 60.0, 22.0 ], "text": "sig~ 1" } },
			{ "box": { "id": "obj-scan-groove", "maxclass": "newobj", "numinlets": 3, "numoutlets": 3, "outlettype": [ "signal", "signal", "signal" ], "patching_rect": [ 40.0, 480.0, 470.0, 22.0 ], "text": "groove~ source_v7 2" } },
			{ "box": { "id": "obj-scan-groove-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 530.0, 482.0, 250.0, 20.0 ], "text": "← scanner (連続進行)" } },

			{ "box": { "id": "obj-scan-mul", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 40.0, 520.0, 60.0, 22.0 ], "text": "*~ 0" } },
			{ "box": { "id": "obj-scan-mul-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 110.0, 522.0, 250.0, 20.0 ], "text": "← *~ 0 で scanner の音を消す" } },

			{ "box": { "id": "obj-c4", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 40.0, 570.0, 700.0, 20.0 ], "text": "④ tick → snapshot — sync 値を ms に変換" } },
			{ "box": { "id": "obj-trigon", "maxclass": "toggle", "numinlets": 1, "numoutlets": 1, "outlettype": [ "int" ], "parameter_enable": 0, "patching_rect": [ 40.0, 600.0, 24.0, 24.0 ] } },
			{ "box": { "id": "obj-trigon-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 70.0, 602.0, 100.0, 20.0 ], "text": "trigger on/off" } },
			{ "box": { "id": "obj-metro", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "bang" ], "patching_rect": [ 40.0, 635.0, 100.0, 22.0 ], "text": "metro 100" } },
			{ "box": { "id": "obj-atime", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "int" ], "patching_rect": [ 40.0, 665.0, 100.0, 22.0 ], "text": "a_time 15 4" } },
			{ "box": { "id": "obj-sel0", "maxclass": "newobj", "numinlets": 1, "numoutlets": 2, "outlettype": [ "bang", "int" ], "patching_rect": [ 40.0, 695.0, 80.0, 22.0 ], "text": "sel 0" } },

			{ "box": { "id": "obj-tbb-tick", "maxclass": "newobj", "numinlets": 1, "numoutlets": 2, "outlettype": [ "bang", "bang" ], "patching_rect": [ 40.0, 730.0, 60.0, 22.0 ], "text": "t b b" } },
			{ "box": { "id": "obj-tbb-tick-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 110.0, 732.0, 350.0, 20.0 ], "text": "← 右(先): snapshot / 左(後): startloop" } },

			{ "box": { "id": "obj-snap", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "float" ], "patching_rect": [ 40.0, 770.0, 100.0, 22.0 ], "text": "snapshot~" } },
			{ "box": { "id": "obj-snap-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 150.0, 772.0, 350.0, 20.0 ], "text": "← scanner sync (右outlet) を bang で取得" } },

			{ "box": { "id": "obj-expr", "maxclass": "newobj", "numinlets": 3, "numoutlets": 1, "outlettype": [ "float" ], "patching_rect": [ 40.0, 810.0, 240.0, 22.0 ], "text": "expr $f1 * ($f2 - $f3) + $f3" } },
			{ "box": { "id": "obj-expr-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 290.0, 812.0, 350.0, 20.0 ], "text": "← sync(0-1) を ms に変換: f1*sync f2*max f3*min" } },

			{ "box": { "id": "obj-r-scanmin-expr", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 280.0, 770.0, 130.0, 22.0 ], "text": "0." } },
			{ "box": { "id": "obj-r-scanmin-expr-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 280.0, 750.0, 250.0, 16.0 ], "text": "scan_min (= 0、固定 message)" } },

			{ "box": { "id": "obj-flonum-snapms", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "parameter_enable": 0, "patching_rect": [ 600.0, 810.0, 80.0, 22.0 ] } },
			{ "box": { "id": "obj-flonum-snapms-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 690.0, 812.0, 250.0, 20.0 ], "text": "← snapshot_ms 表示用" } },

			{ "box": { "id": "obj-c5", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 40.0, 860.0, 700.0, 20.0 ], "text": "⑤ mode 切替 — switch 2 個で min/max を別々に切替" } },

			{ "box": { "id": "obj-tff-snap", "maxclass": "newobj", "numinlets": 1, "numoutlets": 2, "outlettype": [ "float", "float" ], "patching_rect": [ 40.0, 890.0, 60.0, 22.0 ], "text": "t f f" } },
			{ "box": { "id": "obj-tff-snap-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 110.0, 892.0, 350.0, 20.0 ], "text": "← snapshot_ms を min 用と max 用に分配" } },

			{ "box": { "id": "obj-plus-window-snap", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "float" ], "patching_rect": [ 200.0, 925.0, 50.0, 22.0 ], "text": "+ 0." } },
			{ "box": { "id": "obj-flonum-window", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "parameter_enable": 0, "patching_rect": [ 270.0, 925.0, 70.0, 22.0 ] } },
			{ "box": { "id": "obj-window-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 350.0, 927.0, 250.0, 20.0 ], "text": "← window_ms (capture長)" } },

			{ "box": { "id": "obj-r-selstart-cap", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 480.0, 890.0, 130.0, 22.0 ], "text": "receive selstart_v7" } },
			{ "box": { "id": "obj-r-selend-cap", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 480.0, 925.0, 130.0, 22.0 ], "text": "receive selend_v7" } },

			{ "box": { "id": "obj-switch-min", "maxclass": "newobj", "numinlets": 3, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 40.0, 970.0, 100.0, 22.0 ], "text": "switch 2 1" } },
			{ "box": { "id": "obj-switch-min-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 150.0, 972.0, 250.0, 20.0 ], "text": "← min 用 switch (init=1)" } },

			{ "box": { "id": "obj-switch-max", "maxclass": "newobj", "numinlets": 3, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 200.0, 970.0, 100.0, 22.0 ], "text": "switch 2 1" } },
			{ "box": { "id": "obj-switch-max-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 310.0, 972.0, 250.0, 20.0 ], "text": "← max 用 switch (init=1)" } },

			{ "box": { "id": "obj-r-mode-min", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 40.0, 1010.0, 130.0, 22.0 ], "text": "receive mode_v7" } },
			{ "box": { "id": "obj-mode-plus1-min", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "int" ], "patching_rect": [ 40.0, 1040.0, 50.0, 22.0 ], "text": "+ 1" } },
			{ "box": { "id": "obj-mode-plus1-min-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 100.0, 1042.0, 350.0, 20.0 ], "text": "← mode 0/1 → switch の選択 1/2 に変換" } },

			{ "box": { "id": "obj-r-mode-max", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 200.0, 1010.0, 130.0, 22.0 ], "text": "receive mode_v7" } },
			{ "box": { "id": "obj-mode-plus1-max", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "int" ], "patching_rect": [ 200.0, 1040.0, 50.0, 22.0 ], "text": "+ 1" } },

			{ "box": { "id": "obj-snd-capmin", "maxclass": "newobj", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 40.0, 1085.0, 130.0, 22.0 ], "text": "send cap_min_v7" } },
			{ "box": { "id": "obj-snd-capmax", "maxclass": "newobj", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 200.0, 1085.0, 130.0, 22.0 ], "text": "send cap_max_v7" } },

			{ "box": { "id": "obj-startloop-tick", "maxclass": "message", "numinlets": 2, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 380.0, 770.0, 80.0, 22.0 ], "text": "startloop" } },
			{ "box": { "id": "obj-snd-startloop", "maxclass": "newobj", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 380.0, 800.0, 150.0, 22.0 ], "text": "send cap_startloop_v7" } },

			{ "box": { "id": "obj-c6", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 40.0, 1130.0, 700.0, 20.0 ], "text": "⑥ capturer — 音を出す groove~ (両モード共通)" } },
			{ "box": { "id": "obj-cap-loadb", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "bang" ], "patching_rect": [ 540.0, 1155.0, 70.0, 22.0 ], "text": "loadbang" } },
			{ "box": { "id": "obj-cap-loop1", "maxclass": "message", "numinlets": 2, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 540.0, 1185.0, 60.0, 22.0 ], "text": "loop 1" } },

			{ "box": { "id": "obj-cap-speed", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "parameter_enable": 0, "patching_rect": [ 40.0, 1155.0, 70.0, 22.0 ] } },
			{ "box": { "id": "obj-cap-speed-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 120.0, 1157.0, 350.0, 20.0 ], "text": "← speed (1=順 / -1=reverse, mode 2 で活用)" } },
			{ "box": { "id": "obj-cap-sig", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 40.0, 1185.0, 60.0, 22.0 ], "text": "sig~" } },
			{ "box": { "id": "obj-r-capmin", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 130.0, 1185.0, 130.0, 22.0 ], "text": "receive cap_min_v7" } },
			{ "box": { "id": "obj-r-capmax", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 280.0, 1185.0, 130.0, 22.0 ], "text": "receive cap_max_v7" } },
			{ "box": { "id": "obj-r-capstartloop", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 420.0, 1185.0, 150.0, 22.0 ], "text": "receive cap_startloop_v7" } },

			{ "box": { "id": "obj-cap-groove", "maxclass": "newobj", "numinlets": 3, "numoutlets": 3, "outlettype": [ "signal", "signal", "signal" ], "patching_rect": [ 40.0, 1225.0, 530.0, 22.0 ], "text": "groove~ source_v7 2" } },
			{ "box": { "id": "obj-cap-groove-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 590.0, 1227.0, 200.0, 20.0 ], "text": "← capturer (音を出す)" } },

			{ "box": { "id": "obj-mulL", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 40.0, 1265.0, 60.0, 22.0 ], "text": "*~ 0.7" } },
			{ "box": { "id": "obj-mulR", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 120.0, 1265.0, 60.0, 22.0 ], "text": "*~ 0.7" } },

			{ "box": { "id": "obj-ezdac", "maxclass": "ezdac~", "numinlets": 2, "numoutlets": 0, "patching_rect": [ 40.0, 1305.0, 45.0, 45.0 ] } },
			{ "box": { "id": "obj-ezdac-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 95.0, 1318.0, 250.0, 20.0 ], "text": "ezdac~ (audio on/off マスター)" } },

			{ "box": { "id": "obj-c7", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 700.0, 270.0, 580.0, 20.0 ], "text": "⑦ reset — mode に応じて参照基準を戻す" } },
			{ "box": { "id": "obj-resetbtn", "maxclass": "button", "numinlets": 1, "numoutlets": 1, "outlettype": [ "bang" ], "parameter_enable": 0, "patching_rect": [ 700.0, 300.0, 32.0, 32.0 ] } },
			{ "box": { "id": "obj-resetbtn-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 740.0, 306.0, 250.0, 20.0 ], "text": "RESET" } },

			{ "box": { "id": "obj-reset-gate", "maxclass": "newobj", "numinlets": 2, "numoutlets": 2, "outlettype": [ "", "" ], "patching_rect": [ 700.0, 345.0, 80.0, 22.0 ], "text": "gate 2 1" } },
			{ "box": { "id": "obj-reset-gate-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 790.0, 347.0, 350.0, 20.0 ], "text": "← mode で 1=mode1 / 2=mode2 へ振り分け" } },

			{ "box": { "id": "obj-r-mode-reset", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 700.0, 380.0, 130.0, 22.0 ], "text": "receive mode_v7" } },
			{ "box": { "id": "obj-mode-plus1-reset", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "int" ], "patching_rect": [ 700.0, 410.0, 50.0, 22.0 ], "text": "+ 1" } },

			{ "box": { "id": "obj-reset-m1-msg", "maxclass": "message", "numinlets": 2, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 700.0, 460.0, 100.0, 22.0 ], "text": "startloop" } },
			{ "box": { "id": "obj-reset-m1-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 810.0, 462.0, 350.0, 20.0 ], "text": "← mode 1: scanner に startloop" } },

			{ "box": { "id": "obj-reset-m1-tbb", "maxclass": "newobj", "numinlets": 1, "numoutlets": 2, "outlettype": [ "bang", "bang" ], "patching_rect": [ 850.0, 460.0, 60.0, 22.0 ], "text": "t b b" } },

			{ "box": { "id": "obj-reset-m2-tbb", "maxclass": "newobj", "numinlets": 1, "numoutlets": 3, "outlettype": [ "bang", "bang", "bang" ], "patching_rect": [ 1000.0, 360.0, 70.0, 22.0 ], "text": "t b b b" } },
			{ "box": { "id": "obj-reset-m2-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 1080.0, 362.0, 250.0, 20.0 ], "text": "← mode 2: 範囲再送 + startloop" } },

			{ "box": { "id": "obj-r-selstart-rst", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 1000.0, 400.0, 130.0, 22.0 ], "text": "receive selstart_v7" } },
			{ "box": { "id": "obj-r-selend-rst", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 1140.0, 400.0, 130.0, 22.0 ], "text": "receive selend_v7" } },

			{ "box": { "id": "obj-snd-capmin-rst", "maxclass": "newobj", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 1000.0, 440.0, 130.0, 22.0 ], "text": "send cap_min_v7" } },
			{ "box": { "id": "obj-snd-capmax-rst", "maxclass": "newobj", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 1140.0, 440.0, 130.0, 22.0 ], "text": "send cap_max_v7" } },

			{ "box": { "id": "obj-reset-cap-startmsg", "maxclass": "message", "numinlets": 2, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 1000.0, 480.0, 100.0, 22.0 ], "text": "startloop" } },
			{ "box": { "id": "obj-snd-cap-rst", "maxclass": "newobj", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 1000.0, 510.0, 150.0, 22.0 ], "text": "send cap_startloop_v7" } },

			{ "box": { "id": "obj-snd-scan-rst", "maxclass": "newobj", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 700.0, 510.0, 150.0, 22.0 ], "text": "send scan_startloop_v7" } },
			{ "box": { "id": "obj-r-scan-startloop", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 540.0, 470.0, 150.0, 22.0 ], "text": "receive scan_startloop_v7" } },

			{ "box": { "id": "obj-note", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "linecount": 14, "patching_rect": [ 700.0, 580.0, 580.0, 220.0 ], "text": "v7 — scan-capture + waveform-loop\n\n操作:\n1) ezdac~ ON → wav 読込 → 範囲選択\n2) scanner loop_max に wav の長さ ms を入力 (例: 5000)\n3) capturer speed = 1.0\n4) window_ms 設定 (例: 80)\n5) trigger ON\n\nmode 0 (scan-capture):\n  scanner が連続進行、tick で snapshot して capture\n  → メロディに沿うパパパパ\n\nmode 1 (waveform-loop):\n  selection をそのまま capturer の loop に\n  capturer speed -1 で reverse\n\nreset:\n  mode 0: scanner playhead を 0 に戻す\n  mode 1: 現在の selection を再送 + 即 startloop" } }
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

			{ "patchline": { "destination": [ "obj-snd-mode", 0 ], "source": [ "obj-mode", 0 ] } },

			{ "patchline": { "destination": [ "obj-scan-loop1", 0 ], "source": [ "obj-scan-loadb", 0 ] } },
			{ "patchline": { "destination": [ "obj-scan-groove", 0 ], "source": [ "obj-scan-loop1", 0 ] } },
			{ "patchline": { "destination": [ "obj-scan-groove", 0 ], "source": [ "obj-scan-sig", 0 ] } },
			{ "patchline": { "destination": [ "obj-scan-groove", 1 ], "source": [ "obj-scan-min", 0 ] } },
			{ "patchline": { "destination": [ "obj-scan-groove", 2 ], "source": [ "obj-scan-max-flonum", 0 ] } },
			{ "patchline": { "destination": [ "obj-scan-groove", 0 ], "source": [ "obj-r-scan-startloop", 0 ] } },
			{ "patchline": { "destination": [ "obj-scan-mul", 0 ], "source": [ "obj-scan-groove", 0 ] } },

			{ "patchline": { "destination": [ "obj-metro", 0 ], "source": [ "obj-trigon", 0 ] } },
			{ "patchline": { "destination": [ "obj-atime", 0 ], "source": [ "obj-metro", 0 ] } },
			{ "patchline": { "destination": [ "obj-sel0", 0 ], "source": [ "obj-atime", 0 ] } },
			{ "patchline": { "destination": [ "obj-tbb-tick", 0 ], "source": [ "obj-sel0", 0 ] } },

			{ "patchline": { "destination": [ "obj-snap", 0 ], "source": [ "obj-tbb-tick", 1 ] } },
			{ "patchline": { "destination": [ "obj-snap", 0 ], "source": [ "obj-scan-groove", 2 ] } },

			{ "patchline": { "destination": [ "obj-startloop-tick", 0 ], "source": [ "obj-tbb-tick", 0 ] } },
			{ "patchline": { "destination": [ "obj-snd-startloop", 0 ], "source": [ "obj-startloop-tick", 0 ] } },

			{ "patchline": { "destination": [ "obj-expr", 0 ], "source": [ "obj-snap", 0 ] } },
			{ "patchline": { "destination": [ "obj-expr", 1 ], "source": [ "obj-scan-max-flonum", 0 ] } },
			{ "patchline": { "destination": [ "obj-expr", 2 ], "source": [ "obj-r-scanmin-expr", 0 ] } },

			{ "patchline": { "destination": [ "obj-tff-snap", 0 ], "source": [ "obj-expr", 0 ] } },
			{ "patchline": { "destination": [ "obj-flonum-snapms", 0 ], "source": [ "obj-expr", 0 ] } },

			{ "patchline": { "destination": [ "obj-switch-min", 1 ], "source": [ "obj-tff-snap", 1 ] } },
			{ "patchline": { "destination": [ "obj-plus-window-snap", 0 ], "source": [ "obj-tff-snap", 0 ] } },
			{ "patchline": { "destination": [ "obj-plus-window-snap", 1 ], "source": [ "obj-flonum-window", 0 ] } },
			{ "patchline": { "destination": [ "obj-switch-max", 1 ], "source": [ "obj-plus-window-snap", 0 ] } },

			{ "patchline": { "destination": [ "obj-switch-min", 2 ], "source": [ "obj-r-selstart-cap", 0 ] } },
			{ "patchline": { "destination": [ "obj-switch-max", 2 ], "source": [ "obj-r-selend-cap", 0 ] } },

			{ "patchline": { "destination": [ "obj-mode-plus1-min", 0 ], "source": [ "obj-r-mode-min", 0 ] } },
			{ "patchline": { "destination": [ "obj-switch-min", 0 ], "source": [ "obj-mode-plus1-min", 0 ] } },

			{ "patchline": { "destination": [ "obj-mode-plus1-max", 0 ], "source": [ "obj-r-mode-max", 0 ] } },
			{ "patchline": { "destination": [ "obj-switch-max", 0 ], "source": [ "obj-mode-plus1-max", 0 ] } },

			{ "patchline": { "destination": [ "obj-snd-capmin", 0 ], "source": [ "obj-switch-min", 0 ] } },
			{ "patchline": { "destination": [ "obj-snd-capmax", 0 ], "source": [ "obj-switch-max", 0 ] } },

			{ "patchline": { "destination": [ "obj-cap-loop1", 0 ], "source": [ "obj-cap-loadb", 0 ] } },
			{ "patchline": { "destination": [ "obj-cap-groove", 0 ], "source": [ "obj-cap-loop1", 0 ] } },
			{ "patchline": { "destination": [ "obj-cap-sig", 0 ], "source": [ "obj-cap-speed", 0 ] } },
			{ "patchline": { "destination": [ "obj-cap-groove", 0 ], "source": [ "obj-cap-sig", 0 ] } },
			{ "patchline": { "destination": [ "obj-cap-groove", 1 ], "source": [ "obj-r-capmin", 0 ] } },
			{ "patchline": { "destination": [ "obj-cap-groove", 2 ], "source": [ "obj-r-capmax", 0 ] } },
			{ "patchline": { "destination": [ "obj-cap-groove", 0 ], "source": [ "obj-r-capstartloop", 0 ] } },

			{ "patchline": { "destination": [ "obj-mulL", 0 ], "source": [ "obj-cap-groove", 0 ] } },
			{ "patchline": { "destination": [ "obj-mulR", 0 ], "source": [ "obj-cap-groove", 1 ] } },
			{ "patchline": { "destination": [ "obj-ezdac", 0 ], "source": [ "obj-mulL", 0 ] } },
			{ "patchline": { "destination": [ "obj-ezdac", 1 ], "source": [ "obj-mulR", 0 ] } },

			{ "patchline": { "destination": [ "obj-mode-plus1-reset", 0 ], "source": [ "obj-r-mode-reset", 0 ] } },
			{ "patchline": { "destination": [ "obj-reset-gate", 0 ], "source": [ "obj-mode-plus1-reset", 0 ] } },
			{ "patchline": { "destination": [ "obj-reset-gate", 1 ], "source": [ "obj-resetbtn", 0 ] } },

			{ "patchline": { "destination": [ "obj-reset-m1-tbb", 0 ], "source": [ "obj-reset-gate", 0 ] } },
			{ "patchline": { "destination": [ "obj-reset-m1-msg", 0 ], "source": [ "obj-reset-m1-tbb", 1 ] } },
			{ "patchline": { "destination": [ "obj-snd-scan-rst", 0 ], "source": [ "obj-reset-m1-msg", 0 ] } },

			{ "patchline": { "destination": [ "obj-reset-m2-tbb", 0 ], "source": [ "obj-reset-gate", 1 ] } },
			{ "patchline": { "destination": [ "obj-r-selstart-rst", 0 ], "source": [ "obj-reset-m2-tbb", 2 ] } },
			{ "patchline": { "destination": [ "obj-r-selend-rst", 0 ], "source": [ "obj-reset-m2-tbb", 1 ] } },
			{ "patchline": { "destination": [ "obj-snd-capmin-rst", 0 ], "source": [ "obj-r-selstart-rst", 0 ] } },
			{ "patchline": { "destination": [ "obj-snd-capmax-rst", 0 ], "source": [ "obj-r-selend-rst", 0 ] } },
			{ "patchline": { "destination": [ "obj-reset-cap-startmsg", 0 ], "source": [ "obj-reset-m2-tbb", 0 ] } },
			{ "patchline": { "destination": [ "obj-snd-cap-rst", 0 ], "source": [ "obj-reset-cap-startmsg", 0 ] } }
		]
	}
}
