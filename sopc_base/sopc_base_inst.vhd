  --Example instantiation for system 'sopc_base'
  sopc_base_inst : sopc_base
    port map(
      out_port_from_the_leds => out_port_from_the_leds,
      clk_0 => clk_0,
      in_port_to_the_boutons => in_port_to_the_boutons,
      reset_n => reset_n
    );


