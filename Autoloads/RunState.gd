extends Node

var elapsed : float
var level : int
var xp : int
var xp_to_next : int
var kills : int


var _seed : int

func tick(delta : float):
	elapsed += delta

func add_xp(exp : int):
	xp += exp
