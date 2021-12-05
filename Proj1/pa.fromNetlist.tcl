
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Proj1 -dir "F:/Users/inf/Desktop/uni/term 211/COE 203/Project/Proj1/planAhead_run_2" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "F:/Users/inf/Desktop/uni/term 211/COE 203/Project/Proj1/PingPongTest.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {F:/Users/inf/Desktop/uni/term 211/COE 203/Project/Proj1} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "PingPongTest.ucf" [current_fileset -constrset]
add_files [list {PingPongTest.ucf}] -fileset [get_property constrset [current_run]]
link_design
