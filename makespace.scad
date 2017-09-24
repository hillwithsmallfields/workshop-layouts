/* Placeholders for sizes as I haven't measured it yet */

/* Sizes in cm */

main_space_length = 1200;
main_space_width = 600;
main_space_height = 400;

wall_thickness = 10;

table_length = 150;
table_depth = 70;
table_height = 60;
table_leg_size = 4;

main_space_entrance_offset = 200;
secure_workshop_entrance_offset = 350;
back_door_offset = 80;

door_height = 220;
double_door_width = 160;
single_door_width = 80;

module double_door_gap() {
     square([double_door_width, door_height]);
}

module double_door() {
}

module single_door_gap() {
     square([single_door_width, door_height]);
}

module single_door() {
}

module main_space() {
     /* floor */
     square([main_space_length, main_space_width]);
     /* short wall with entrance */
     rotate([90,0,90]) {
	  difference() {
	       square([main_space_width, main_space_height]);
	       translate([main_space_entrance_offset, 0]) { double_door_gap(); }
	  }
     }
     /* long wall 1 */
     rotate([90,0,0]) {
	  difference() {
	       square([main_space_length, main_space_height]);
	       /* todo: storage entrances */
	  }
     }
     /* long wall 2 */
     translate([0, main_space_width]) {
	  rotate([90,0,0]) {
	       difference() {
		    square([main_space_length, main_space_height]);
		    translate([main_space_length - secure_workshop_entrance_offset - double_door_width, 0]) { double_door_gap(); }
	       }
	  }
     }
     /* short wall with back door */
     translate([main_space_length, 0]) rotate([90,0,90]) {
	  difference() {
	       square([main_space_width, main_space_height]);
	       translate([main_space_width - (back_door_offset + single_door_width), 0]) { single_door_gap(); }
	  }
     }
}

main_space();
