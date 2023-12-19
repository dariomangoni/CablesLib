within CablesLib.TESTS.CableCoupledTests;
model BumpstopCableCoupledTest_pull
  CableCoupledTests bumpstopCableCoupled(
    fix_a=true,
    fix_b=true,
    k=1e3,
    c=0) annotation (Placement(transformation(extent={{-8,-8},{12,12}})));
  Modelica.Mechanics.Translational.Components.Mass mc_a(
    m=1,
    s(fixed=false, start=1),
    v(fixed=true)) annotation (Placement(transformation(extent={{-56,2},{-36,22}})));
  Modelica.Mechanics.Translational.Components.Mass mc_b(
    m=1,
    s(fixed=true, start=1),
    v(fixed=true)) annotation (Placement(transformation(extent={{42,4},{62,24}})));
  Modelica.Mechanics.Translational.Components.Mass m_a(
    m=1,
    s(fixed=false, start=0),
    v(fixed=true)) annotation (Placement(transformation(extent={{-56,-30},{-36,-10}})));
  Modelica.Mechanics.Translational.Components.Mass m_b(
    m=1,
    s(fixed=false, start=0.9),
    v(fixed=true)) annotation (Placement(transformation(extent={{42,-28},{62,-8}})));
  Modelica.Mechanics.Translational.Sources.Position pos_b annotation (Placement(transformation(extent={{-4,-72},{16,-52}})));
  Modelica.Mechanics.Translational.Components.Fixed      fc_a               annotation (Placement(transformation(extent={{-92,2},{-72,22}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=1,
    duration=10,
    offset=0.9,
    startTime=0.5) annotation (Placement(transformation(extent={{-44,-72},{-24,-52}})));
  Modelica.Mechanics.Translational.Components.Fixed      fc_a1              annotation (Placement(transformation(extent={{-90,-30},{-70,-10}})));
equation

  connect(bumpstopCableCoupled.flangeCable_a, mc_a.flange_b) annotation (Line(points={{-8,11},{-22,11},{-22,12},{-36,12}}, color={0,127,0}));
  connect(bumpstopCableCoupled.flangeCable_b, mc_b.flange_a) annotation (Line(points={{12,11},{28,11},{28,14},{42,14}}, color={0,127,0}));
  connect(bumpstopCableCoupled.flange_a, m_a.flange_b) annotation (Line(points={{-8,2},{-22,2},{-22,-20},{-36,-20}}, color={0,127,0}));
  connect(bumpstopCableCoupled.flange_b, m_b.flange_a) annotation (Line(points={{12,2},{28,2},{28,-18},{42,-18}}, color={0,127,0}));
  connect(pos_b.flange, m_b.flange_b) annotation (Line(points={{16,-62},{62,-62},{62,-18}}, color={0,127,0}));
  connect(fc_a.flange, mc_a.flange_a) annotation (Line(points={{-82,12},{-56,12}}, color={0,127,0}));
  connect(pos_b.s_ref, ramp.y) annotation (Line(points={{-6,-62},{-23,-62}}, color={0,0,127}));
  connect(fc_a1.flange, m_a.flange_a) annotation (Line(points={{-80,-20},{-56,-20}}, color={0,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end BumpstopCableCoupledTest_pull;
