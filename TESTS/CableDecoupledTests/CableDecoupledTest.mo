within CablesLib.TESTS.CableDecoupledTests;
model CableDecoupledTest
  Modelica.Blocks.Sources.Ramp ramp(height=2, duration=10)
                                    annotation (Placement(transformation(extent={{-48,-82},{-28,-62}})));
  Modelica.Mechanics.Translational.Components.Mass mass(m=0.01)
                                                        annotation (Placement(transformation(extent={{38,-82},{58,-62}})));
  CableDecoupled bumpstopCableCoupled annotation (Placement(transformation(extent={{14,-2},{34,18}})));
  Modelica.Mechanics.Translational.Sources.Position position annotation (Placement(transformation(extent={{-6,-82},{14,-62}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation (Placement(transformation(extent={{-44,-30},{-24,-10}})));
  Modelica.Blocks.Sources.Ramp ramp1(height=10, duration=10)
                                    annotation (Placement(transformation(extent={{-96,48},{-76,68}})));
  Modelica.Mechanics.Translational.Sources.Position position1(v(fixed=true))
                                                             annotation (Placement(transformation(extent={{-58,48},{-38,68}})));
  Modelica.Blocks.Sources.Ramp ramp2(
    height=10,
    duration=10,
    offset=1)                       annotation (Placement(transformation(extent={{14,48},{34,68}})));
  Modelica.Mechanics.Translational.Sources.Position position2(v(fixed=true))
                                                             annotation (Placement(transformation(extent={{66,48},{86,68}})));
equation
  connect(ramp.y, position.s_ref) annotation (Line(points={{-27,-72},{-8,-72}},
                                                                             color={0,0,127}));
  connect(position.flange, mass.flange_a) annotation (Line(points={{14,-72},{38,-72}},
                                                                                     color={0,127,0}));
  connect(ramp1.y, position1.s_ref) annotation (Line(points={{-75,58},{-68.5,58},{-68.5,58},{-60,58}}, color={0,0,127}));
  connect(position1.flange, bumpstopCableCoupled.flangeCable_a) annotation (Line(points={{-38,58},{-12,58},{-12,17},{14,17}}, color={0,127,0}));
  connect(ramp2.y, position2.s_ref) annotation (Line(points={{35,58},{64,58}}, color={0,0,127}));
  connect(bumpstopCableCoupled.flangeCable_b, position2.flange) annotation (Line(points={{34,17},{86,17},{86,58}}, color={0,127,0}));
  connect(fixed.flange, bumpstopCableCoupled.flange_a) annotation (Line(points={{-34,-20},{-34,8},{14,8}}, color={0,127,0}));
  connect(mass.flange_b, bumpstopCableCoupled.flange_b) annotation (Line(points={{58,-72},{66,-72},{66,8},{34,8}}, color={0,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CableDecoupledTest;
