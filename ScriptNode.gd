extends Node2D

var shader_code = """
shader_type canvas_item;
render_mode unshaded;

void fragment() {
	COLOR =  vec4(UV, 0.0, 1.0);
}
"""

func _ready():
	var sprite = Sprite.new()
	sprite.texture = ImageTexture.new()
	sprite.texture.create(256,256,Image.FORMAT_RGBA8)
	sprite.centered = false

	sprite.material = ShaderMaterial.new()
	sprite.material.shader = Shader.new()
	sprite.material.shader.code = shader_code

	self.add_child(sprite)