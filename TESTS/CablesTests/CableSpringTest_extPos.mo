within CablesLib.TESTS.CablesTests;
model CableSpringTest_extPos
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation (
    Placement(transformation(extent = {{-100, -30}, {-80, -10}})));
  Modelica.Mechanics.MultiBody.Parts.Body body(r_CM = {0, 0, 0}, m = 1,
    r_0(each fixed=true, start={1,0,0}),
    v_0(each fixed = true), angles_fixed = true, w_0_fixed = true, useQuaternions = false) annotation (
    Placement(transformation(extent = {{60, -30}, {80, -10}})));
  inner Modelica.Mechanics.MultiBody.World world(n = {0, 0, -1}) annotation (
    Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  CablesFlange.CableSpring cable(
    fix_b=true,
    s_b_fixed=false,
    v_b_fixed=true) annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
  Modelica.Mechanics.Translational.Sources.Position position(v(fixed=true, start=0))
                                                             annotation (Placement(transformation(extent={{-60,6},{-40,26}})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=0.5,
    freqHz=0.2,
    offset=0) annotation (Placement(transformation(extent={{-110,6},{-90,26}})));
equation
  connect(fixed.frame_b, cable.frame_a) annotation (Line(
      points={{-80,-20},{-20,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(cable.frame_b, body.frame_a) annotation (Line(
      points={{0,-20},{60,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(position.flange, cable.flange_a) annotation (Line(points={{-40,16},{-30,16},{-30,-12},{-20,-12}}, color={0,127,0}));
  connect(position.s_ref, sine.y) annotation (Line(points={{-62,16},{-89,16}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end CableSpringTest_extPos;
