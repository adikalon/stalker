
-- SOUNDs:
-- https://freesound.org/people/steevamis/sounds/213955/

-- ========================= STALKER ====================================================================
mobs:register_mob("stalker:stalker", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	--specific_attack = {"player", "mobs_npc:npc"},
	reach = 2,
	damage = 15,
	hp_min = 30,
	hp_max = 30,
	armor = 80,
	collisionbox = {-0.4, -0.5, -0.4, 0.4, 1.3, 0.4},
	visual = "mesh",
	mesh = "stalker.b3d",
	visual_size = {x = 9, y = 9},
	textures = {
		{"stalker.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "monster1",
	},
	walk_velocity = 4,
	run_velocity = 6,
	view_range = 45,
	jump = true,
	floats = 0,
	knock_back = false,
	fall_damage = 0,
	suffocation = 0,
	fire_damage = 0,
	stepheight = 1.7,
	drops = {
		--{name = "", chance = 1, min = 3, max = 5},
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	fear_height = 4,
	jump_height = 5,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 1,
		stand_end = 20,
		walk_start = 30,
		walk_end = 50,
		run_start = 60,
		run_end = 70,
		--punch_start = 0,
		--punch_end = 0,
	},
		

    do_custom = function(self, dtime)
        -- Verificar se há um nó específico à frente da entidade
        local pos = self.object:get_pos()
        local dir = self.object:get_velocity():normalize()
        local node_pos = vector.round(vector.add(pos, vector.multiply(dir, 1.5)))
        local node = minetest.get_node_or_nil(node_pos)
        
        if node and node.name ~= "air" then
            self.object:set_animation({x=80, y=100},15, 0, true)
			       self.object:set_properties({
            	   collisionbox = {-0.4, -0.5, -0.4, 0.4, 0.1, 0.4},
        
        			})

			    else

			    	mobs:set_animation(self, "run")
			    	self.object:set_properties({
            	   	collisionbox = {-0.4, -0.5, -0.4, 0.4, 1.3, 0.4},
        
        			})
        end
    end,

})


-- ========= SPAWN : ===============================================================================
--[[
mobs:spawn({
	name = "stalker:stalker",
	nodes = {"default:stone"},
	chance = 8000,
	active_object_count = 2,
	min_height = 0,
})
]]


if minetest.get_modpath("mcl_core") ~= nil then
  mobs:register_spawn("stalker:stalker", --name
    {"mcl_core:stone","mcl_core:dirt"}, --nodes
    7, --max_light
    0, --min_light
    20, --chance ( padrão 20 )
    1, --active_object_count
    -5 --max_height
    ) 
 
end 


if minetest.get_modpath("default") ~= nil then
  mobs:register_spawn("stalker:stalker", --name
    {"default:stone","default:cobble"}, --nodes
    7, --max_light
    0, --min_light
    20, --chance ( padrão 20 )
    1, --active_object_count
    -10 --max_height
    ) 
  end 

-- ======== EGG : ==================================================================================

mobs:register_egg("stalker:stalker", "Stalker", "default_stone.png", 0)


