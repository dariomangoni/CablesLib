within CablesLib.TESTS.CableDecoupledTests;
model CableDecoupledTest_extForce
  Modelica.Mechanics.Translational.Components.Mass mass(m=0.01)
                                                        annotation (Placement(transformation(extent={{52,-2},{72,18}})));
  CableDecoupled bumpstopCableCoupled annotation (Placement(transformation(extent={{14,-2},{34,18}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation (Placement(transformation(extent={{-44,-30},{-24,-10}})));
  Modelica.Blocks.Sources.Ramp ramp1(height=10, duration=10)
                                    annotation (Placement(transformation(extent={{-96,48},{-76,68}})));
  Modelica.Mechanics.Translational.Sources.Force    force    annotation (Placement(transformation(extent={{-58,48},{-38,68}})));
  Modelica.Blocks.Sources.Ramp ramp2(
    height=10,
    duration=10,
    offset=1)                       annotation (Placement(transformation(extent={{14,48},{34,68}})));
  Modelica.Mechanics.Translational.Sources.Position position2(v(fixed=true))
                                                             annotation (Placement(transformation(extent={{66,48},{86,68}})));
  Modelica.Mechanics.Translational.Components.SpringDamper springDamper(
    c=100,
    d=10,
    s_rel0=1) annotation (Placement(transformation(extent={{86,-2},{106,18}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1(s0=1)
                                                          annotation (Placement(transformation(extent={{110,-32},{130,-12}})));
equation
  connect(force.flange, bumpstopCableCoupled.flangeCable_a) annotation (Line(points={{-38,58},{-12,58},{-12,17},{14,17}}, color={0,127,0}));
  connect(ramp2.y, position2.s_ref) annotation (Line(points={{35,58},{64,58}}, color={0,0,127}));
  connect(bumpstopCableCoupled.flangeCable_b, position2.flange) annotation (Line(points={{34,17},{86,17},{86,58}}, color={0,127,0}));
  connect(fixed.flange, bumpstopCableCoupled.flange_a) annotation (Line(points={{-34,-20},{-34,8},{14,8}}, color={0,127,0}));
  connect(bumpstopCableCoupled.flange_b, mass.flange_a) annotation (Line(points={{34,8},{52,8}}, color={0,127,0}));
  connect(mass.flange_b, springDamper.flange_a) annotation (Line(points={{72,8},{86,8}}, color={0,127,0}));
  connect(springDamper.flange_b, fixed1.flange) annotation (Line(points={{106,8},{120,8},{120,-22}}, color={0,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CableDecoupledTest_extForce;
