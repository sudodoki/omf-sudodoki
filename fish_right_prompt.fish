function _prompt_rubies
  set ruby_version (ruby-version)
  [ -z "$ruby_version" ]; and return
  printf '[%s] ' $ruby_version
end

function _prompt_nodes
  set node_version (node-version)
  [ -z "$node_version" ]; and return
  printf '[%s] ' $node_version
end

function fish_right_prompt
  set_color -o 777
  _prompt_rubies
  _prompt_nodes
  set_color normal
end