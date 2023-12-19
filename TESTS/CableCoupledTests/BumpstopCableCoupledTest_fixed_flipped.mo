within CablesLib.TESTS.CableCoupledTests;
model BumpstopCableCoupledTest_fixed_flipped
  CableCoupledTests bumpstopCableCoupled(
    fix_a=true,
    fix_b=true,
    k=1e3,
    c=0) annotation (Placement(transformation(extent={{-8,-8},{12,12}})));
  Modelica.Mechanics.Translational.Components.Mass mc_a(
    m=1,
    s(fixed=true, start=1),
    v(fixed=true)) annotation (Placement(transformation(extent={{-56,2},{-36,22}})));
  Modelica.Mechanics.Translational.Components.Mass mc_b(
    m=1,
    s(fixed=true, start=2),
    v(fixed=true)) annotation (Placement(transformation(extent={{42,4},{62,24}})));
  Modelica.Mechanics.Translational.Components.Mass m_a(
    m=1,
    s(fixed=true, start=0),
    v(fixed=true)) annotation (Placement(transformation(extent={{-56,-30},{-36,-10}})));
  Modelica.Mechanics.Translational.Components.Mass m_b(
    m=1,
    s(fixed=true, start=0.9),
    v(fixed=true)) annotation (Placement(transformation(extent={{42,-28},{62,-8}})));
  Modelica.Mechanics.Translational.Sources.ConstantForce f_b(f_constant=-1)
                                                                           annotation (Placement(transformation(extent={{16,-72},{-4,-52}})));
  Modelica.Mechanics.Translational.Sources.ConstantForce fc_a(f_constant=-1)
                                                                            annotation (Placement(transformation(extent={{112,4},{92,24}})));
equation

  connect(bumpstopCableCoupled.flangeCable_a, mc_a.flange_b) annotation (Line(points={{-8,11},{-22,11},{-22,12},{-36,12}}, color={0,127,0}));
  connect(bumpstopCableCoupled.flangeCable_b, mc_b.flange_a) annotation (Line(points={{12,11},{28,11},{28,14},{42,14}}, color={0,127,0}));
  connect(bumpstopCableCoupled.flange_a, m_a.flange_b) annotation (Line(points={{-8,2},{-22,2},{-22,-20},{-36,-20}}, color={0,127,0}));
  connect(bumpstopCableCoupled.flange_b, m_b.flange_a) annotation (Line(points={{12,2},{28,2},{28,-18},{42,-18}}, color={0,127,0}));
  connect(f_b.flange, m_a.flange_a) annotation (Line(points={{-4,-62},{-56,-62},{-56,-20}}, color={0,127,0}));
  connect(mc_b.flange_b, fc_a.flange) annotation (Line(points={{62,14},{92,14}}, color={0,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end BumpstopCableCoupledTest_fixed_flipped;
