within CablesLib.TESTS.PulleyTests;
model PulleyTest_singleSideR
  Modelica.Mechanics.MultiBody.Parts.Body bodyR(
    r_CM={0,0,0},
    m=1,
    r_0(each fixed=true, start={1,0,0}),
    v_0(each fixed=true),
    angles_fixed=true,
    w_0_fixed=true,
    useQuaternions=false) annotation (Placement(transformation(extent={{116,-30},{136,-10}})));
  inner Modelica.Mechanics.MultiBody.World world(n={0,0,-1})     annotation (
    Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  CablesFlange.Pulley pulley(enableFriction=false) annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
  CablesFlange.CableSpring cableR(fix_b=true) annotation (Placement(transformation(extent={{86,-30},{106,-10}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1(animation=false,
                                                  r = {0.5, 0, 0}) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, 16})));
  Modelica.Mechanics.Translational.Sources.Position position annotation (Placement(transformation(extent={{-60,-22},{-40,-2}})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=0.5,
    freqHz=0.2,
    offset=1) annotation (Placement(transformation(extent={{-110,-22},{-90,-2}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation (Placement(transformation(extent={{48,-2},{68,-22}})));
  Modelica.Mechanics.MultiBody.Sensors.CutForce cutForce annotation (Placement(transformation(extent={{30,-50},{50,-30}})));
  Math.Norm norm(n=3) annotation (Placement(transformation(extent={{48,-90},{68,-70}})));
equation
  connect(cableR.frame_b, bodyR.frame_a) annotation (Line(
      points={{106,-20},{116,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(fixed1.frame_b, pulley.support) annotation (
    Line(points={{-1.77636e-15,6},{0,6},{0,-10}},                  color = {95, 95, 95}, thickness = 0.5));
  connect(position.s_ref, sine.y) annotation (Line(points={{-62,-12},{-89,-12}}, color={0,0,127}));
  connect(position.flange, pulley.flange_a) annotation (Line(points={{-40,-12},{-10,-12}}, color={0,127,0}));
  connect(pulley.flange_b, forceSensor.flange_a) annotation (Line(points={{10,-12},{48,-12}}, color={0,127,0}));
  connect(cableR.flange_a, forceSensor.flange_b) annotation (Line(points={{86,-12},{68,-12}}, color={0,127,0}));
  connect(pulley.frame_b, cutForce.frame_a) annotation (Line(
      points={{10,-20},{22,-20},{22,-40},{30,-40}},
      color={95,95,95},
      thickness=0.5));
  connect(cutForce.frame_b, cableR.frame_a) annotation (Line(
      points={{50,-40},{68,-40},{68,-20},{86,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(norm.u, cutForce.force) annotation (Line(points={{48,-80},{30,-80},{30,-51},{32,-51}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end PulleyTest_singleSideR;
