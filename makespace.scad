/* Sizes in cm */

wall_thickness = 10;

table_length = 120;
table_depth = 80;
table_height = 70;
table_leg_size = 4;

/* origin is by the kiln */

main_space_entrance_offset = 300;
secure_workshop_entrance_offset = 340;
back_door_offset = 90;

door_height = 200;
double_door_width = 150;
single_door_width = 110;

submezz_door_offset = 400;
submezz_door_separation = 25;
submezz_door_width = 75;
submezz_door_height = 125;

/*
  320 from secure workshop door to divider by sink
  310 from divider to electrical boxes
  120 across electrical boxes
  390 from electrical boxes to end wall
*/
main_space_length = secure_workshop_entrance_offset + double_door_width + 320 + 310 + 120 + 390;
main_space_width = main_space_entrance_offset + double_door_width + 280;
main_space_height = 400;

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

module submezz_door_gap () {
     square([submezz_door_width, submezz_door_height]);
}

module submezz_door () {
}

module main_space() {
     color([1,1,1,.25]) {
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
		    translate([main_space_length - submezz_door_offset - submezz_door_width, 0]) { submezz_door_gap(); }
		    translate([main_space_length - submezz_door_offset - submezz_door_separation - submezz_door_width*2, 0]) { submezz_door_gap(); }
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
}

main_space();
