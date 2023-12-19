within CablesLib.TESTS.PulleyTests;
model PulleyTest_singleSideR_force_fix
  inner Modelica.Mechanics.MultiBody.World world(n={0,0,-1})     annotation (
    Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  CablesFlange.Pulley pulley(enableFriction=false) annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
  CablesFlange.CableSpring cableR(fix_b=true) annotation (Placement(transformation(extent={{30,-30},{50,-10}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1(animation=false,
                                                  r = {0.5, 0, 0}) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, 16})));
  Modelica.Mechanics.Translational.Sources.Force force annotation (Placement(transformation(extent={{-60,-22},{-40,-2}})));
  Modelica.Blocks.Sources.Constant const(k=11) annotation (Placement(transformation(extent={{-110,-22},{-90,-2}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed(animation=false, r={1,0,0}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={78,-38})));
equation
  connect(pulley.frame_b, cableR.frame_a) annotation (Line(
      points={{10,-20},{30,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(fixed1.frame_b, pulley.support) annotation (
    Line(points={{-1.77636e-15,6},{0,6},{0,-10}},                  color = {95, 95, 95}, thickness = 0.5));
  connect(pulley.flange_b, cableR.flange_a) annotation (Line(points={{10,-12},{30,-12}}, color={0,127,0}));
  connect(force.flange, pulley.flange_a) annotation (Line(points={{-40,-12},{-10,-12}}, color={0,127,0}));
  connect(const.y, force.f) annotation (Line(points={{-89,-12},{-76,-12},{-76,-12},{-62,-12}}, color={0,0,127}));
  connect(cableR.frame_b, fixed.frame_b) annotation (Line(
      points={{50,-20},{78,-20},{78,-28}},
      color={95,95,95},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end PulleyTest_singleSideR_force_fix;
