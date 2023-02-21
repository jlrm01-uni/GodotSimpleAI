extends Control

onready var http_request: HTTPRequest = $HTTPRequest
onready var item_list: ItemList = $MarginContainer/ItemList

export (PackedScene) var next_scene = null
export (String, FILE, "*.tscn") var path_to_scene

var url = "http://127.0.0.1:5500/highscores_json"

func _ready() -> void:
	http_request.connect("request_completed", self, "_on_http_request_completed")
	http_request.request(url)
	
func _on_http_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	
	var highscores = json.result.highscores
	
	setup_highscore_list(highscores)
	
func setup_highscore_list(highscores):
	for each_score in highscores:
		var username = each_score[0]
		var score = each_score[1]
		
		item_list.add_item(username + ": " + str(score))
	
	


func _on_Timer2_timeout() -> void:
	TransitionManager.transition_to(path_to_scene)
