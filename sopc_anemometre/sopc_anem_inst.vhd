  --Example instantiation for system 'sopc_anem'
  sopc_anem_inst : sopc_anem
    port map(
      out_port_from_the_leds => out_port_from_the_leds,
      out_pwm_from_the_avalon_pwm_0 => out_pwm_from_the_avalon_pwm_0,
      clk_0 => clk_0,
      in_port_to_the_boutons => in_port_to_the_boutons,
      pwm_to_the_anemometre_avalon_0 => pwm_to_the_anemometre_avalon_0,
      reset_n => reset_n
    );


