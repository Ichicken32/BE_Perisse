  --Example instantiation for system 'sopc_reception'
  sopc_reception_inst : sopc_reception
    port map(
      out_port_from_the_leds => out_port_from_the_leds,
      clk_0 => clk_0,
      in_port_to_the_boutons => in_port_to_the_boutons,
      reset_n => reset_n
    );


