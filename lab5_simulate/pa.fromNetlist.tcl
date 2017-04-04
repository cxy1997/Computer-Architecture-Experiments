
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name LAB5 -dir "E:/cxy/lab5/planAhead_run_1" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "E:/cxy/lab5/Top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {E:/cxy/lab5} }
set_property target_constrs_file "Top.ucf" [current_fileset -constrset]
add_files [list {Top.ucf}] -fileset [get_property constrset [current_run]]
open_netlist_design
