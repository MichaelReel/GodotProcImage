extends Node2D

func _ready():
	var file = File.new()
	file.open("res://shader.gsl", file.READ)
	var shader_code = file.get_as_text()
	file.close()

	var sprite = Sprite.new()
	sprite.centered = false
	sprite.texture = ImageTexture.new()
	sprite.texture.create(256,256,Image.FORMAT_RGBA8)

	sprite.material = ShaderMaterial.new()
	sprite.material.shader = Shader.new()
	sprite.material.shader.code = shader_code

	var perm_texture = ImageTexture.new()
	perm_texture.storage = ImageTexture.STORAGE_RAW
	
	var perm_image = Image.new()
	perm_image.create(32, 32, false, Image.FORMAT_RGBA8)
	perm_texture.create_from_image(perm_image)

	sprite.material.shader.set_default_texture_param("perm", perm_texture)

	self.add_child(sprite)
