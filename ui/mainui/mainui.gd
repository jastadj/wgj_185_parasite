extends CanvasLayer

var parasite_controller = null
var energy

func _ready():
	energy = $mainui/energy

func _process(delta):
	
	if !parasite_controller: return
	
	update_energy()
	
func update_energy():
	$mainui/energy/ProgressBar.max_value = parasite_controller.max_energy
	$mainui/energy/ProgressBar.value = parasite_controller.energy
