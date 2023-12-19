within CablesLib.TESTS.PulleyTests;
model PulleyTestMirrored
  CablesFlange.CableSpring cableL(fix_a=false, fix_b=true) annotation (Placement(transformation(extent={{-30,-30},{-50,-10}})));
  Modelica.Mechanics.MultiBody.Parts.Body bodyR(
    r_CM={0,0,0},
    m=1,
    r_0(each fixed=true, start={1,0,0}),
    v_0(each fixed=true),
    angles_fixed=true,
    w_0_fixed=true,
    useQuaternions=false) annotation (Placement(transformation(extent={{60,-30},{80,-10}})));
  inner Modelica.Mechanics.MultiBody.World world(n={0,0,-1})     annotation (
    Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  CablesFlange.Pulley pulley(enableFriction=false) annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
  CablesFlange.CableSpring cableR(fix_b=true) annotation (Placement(transformation(extent={{30,-30},{50,-10}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1(r = {0.5, 0, 0}) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, 16})));
  Modelica.Mechanics.MultiBody.Parts.Body bodyL(r_CM = {0, 0, 0}, m = 1.5, r_0(each fixed = true, start = {-0.5, 0, 0}), v_0(each fixed = true), angles_fixed = true, w_0_fixed = true, useQuaternions = false) annotation (
    Placement(transformation(extent = {{-60, -30}, {-80, -10}})));
equation
  connect(pulley.frame_b, cableR.frame_a) annotation (Line(
      points={{10,-20},{30,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(cableR.frame_b, bodyR.frame_a) annotation (Line(
      points={{50,-20},{60,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(fixed1.frame_b, pulley.support) annotation (
    Line(points={{-1.77636e-15,6},{0,6},{0,-10}},                  color = {95, 95, 95}, thickness = 0.5));
  connect(cableL.frame_a, pulley.frame_a) annotation (Line(
      points={{-30,-20},{-10,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyL.frame_a, cableL.frame_b) annotation (Line(
      points={{-60,-20},{-50,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(cableL.flange_a, pulley.flange_a) annotation (Line(points={{-30,-12},{-10,-12}}, color={0,127,0}));
  connect(pulley.flange_b, cableR.flange_a) annotation (Line(points={{10,-12},{30,-12}}, color={0,127,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end PulleyTestMirrored;
