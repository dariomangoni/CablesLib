within CablesLib.TESTS.PulleyTests;
model PulleyTest_disass
  CableCoupledTests cableL(fix_a=false, fix_b=true) annotation (Placement(transformation(extent={{-30,-30},{-50,-10}})));
  inner Modelica.Mechanics.MultiBody.World world(n={0,0,-1})     annotation (
    Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  CableCoupledTests cableR(fix_b=true) annotation (Placement(transformation(extent={{32,-30},{52,-10}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation (Placement(transformation(extent={{-26,-72},{-6,-52}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed2 annotation (Placement(transformation(extent={{-6,-74},{14,-54}})));
  Modelica.Mechanics.Translational.Components.Mass mass(
    m=10,
    s(fixed=true, start=-0.9),
    v(fixed=true)) annotation (Placement(transformation(extent={{-94,-30},{-74,-10}})));
  Modelica.Mechanics.Translational.Components.Mass mass1(
    m=10,
    s(fixed=true, start=0.9),
    v(fixed=true)) annotation (Placement(transformation(extent={{70,-30},{90,-10}})));
  Modelica.Mechanics.Translational.Components.Mass mass2(
    m=10,
    s(fixed=true, start=-1),
    v(fixed=true)) annotation (Placement(transformation(extent={{-90,-6},{-70,14}})));
  Modelica.Mechanics.Translational.Components.Mass mass3(
    m=10,
    s(start=1, fixed=true),
    v(fixed=true)) annotation (Placement(transformation(extent={{64,-8},{84,12}})));
  Modelica.Mechanics.Translational.Components.Mass mass4(
    m=10,
    s(fixed=true, start=0),
    v(fixed=true)) annotation (Placement(transformation(extent={{-6,-8},{14,12}})));
equation
  connect(cableL.flange_a, fixed.flange) annotation (Line(points={{-30,-20},{-30,-62},{-16,-62}}, color={0,127,0}));
  connect(fixed2.flange, cableR.flange_a) annotation (Line(points={{4,-64},{18,-64},{18,-20},{32,-20}}, color={0,127,0}));
  connect(cableL.flange_b, mass.flange_b) annotation (Line(points={{-50,-20},{-74,-20}}, color={0,127,0}));
  connect(cableR.flange_b, mass1.flange_a) annotation (Line(points={{52,-20},{70,-20}}, color={0,127,0}));
  connect(cableL.flangeCable_b, mass2.flange_b) annotation (Line(points={{-50,-11},{-60,-11},{-60,4},{-70,4}}, color={0,127,0}));
  connect(cableR.flangeCable_b, mass3.flange_a) annotation (Line(points={{52,-11},{58,-11},{58,2},{64,2}}, color={0,127,0}));
  connect(cableL.flangeCable_a, mass4.flange_a) annotation (Line(points={{-30,-11},{-18,-11},{-18,2},{-6,2}}, color={0,127,0}));
  connect(cableR.flangeCable_a, mass4.flange_b) annotation (Line(points={{32,-11},{24,-11},{24,2},{14,2}}, color={0,127,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end PulleyTest_disass;
