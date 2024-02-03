set ans y
*createentity comps name=RBE2 cardimage=Part
*createmark comps 1 -1
*setvalue comps mark=1 color=#FF0000
while {$ans == "y"} {
	if {$ans == "y"} {
		puts "Selecting lines..."
		*createmarkpanel lines 1
		set line_list [hm_getmark lines 1]
		foreach line $line_list {
			if {[lsearch $line_list $line] == 0} {
				*createmark nodes 1 "by lines" $line
				set node_list [hm_getmark nodes 1]
			} else {
				*createmark nodes 1 "by lines" $line
				set node_list1 [hm_getmark nodes 1]
				foreach node $node_list1 {
					lappend node_list $node
				}
			}
		}
		eval *createmark nodes 2 $node_list
		*rigidlinkinodecalandcreate 2 0 1 123456
		puts "continue? (y/n)"
		gets stdin ans
	} else {
		continue
	}
}
puts "Job Done!"

