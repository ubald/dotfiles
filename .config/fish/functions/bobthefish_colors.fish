  
function bobthefish_colors -S -d 'Define a custom bobthefish color scheme'

  # optionally include a base color scheme...
  __bobthefish_colors terminal

  # then override everything you want! note that these must be defined with `set -x`
  # set -x color_initial_segment_exit  ffffff ce000f --bold
  # set -x color_initial_segment_su    ffffff 189303 --bold
  # set -x color_initial_segment_jobs  ffffff 255e87 --bold
  set -x color_path 222222 white
  set -x color_path_basename 222222 brwhite --bold
  # set -x color_path_nowrite          660000 cc9999
  # set -x color_path_nowrite_basename 660000 cc9999 --bold
  set -x color_repo green
  # set -x color_repo_work_tree        333333 ffffff --bold
  set -x color_repo_dirty red
  set -x color_repo_staged yellow
  # set -x color_vi_mode_default       999999 333333 --bold
  # set -x color_vi_mode_insert        189303 333333 --bold
  # set -x color_vi_mode_visual        f6b117 3a2a03 --bold
  # set -x color_vagrant               48b4fb ffffff --bold
  # set -x color_username              cccccc 255e87 --bold
  # set -x color_hostname              cccccc 255e87
  # set -x color_rvm                   af0000 cccccc --bold
  # set -x color_virtualfish           005faf cccccc --bold
  # set -x color_virtualgo             005faf cccccc --bold
  # set -x color_desk                  005faf cccccc --bold
end
