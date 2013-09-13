Pry.hooks.add_hook(:after_eval, :add_output_local) do |result, _pry_|
  _pry_.add_sticky_local("res#{_pry_.output_array.size - 1}") { result }
end
