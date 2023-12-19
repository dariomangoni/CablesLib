within CablesLib.TESTS.Pulley3DTests;
model Pulley3DTest
  inner Modelica.Mechanics.MultiBody.World world(n={0,0,-1})     annotation (
    Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1(animation=false,
                                                  r = {0.5, 0, 0}) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, 16})));
CablesLib.CablesFlange.Pulley3D pulley(enableFriction=false) annotation (Placement(visible=true, transformation(
        origin={0,-20},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  CablesFlange.CableSpring cableL(
    fix_a=true,
    fix_b=false,
    s_a_fixed=true,
    v_a_fixed=true,
    v_b_fixed=true) annotation (Placement(transformation(extent={{-110,-30},{-90,-10}})));
  Modelica.Mechanics.MultiBody.Parts.Body bodyR(
    r_CM={0,0,0},
    m=1,
    r_0(each fixed=true, start={1,0,0}),
    v_0(each fixed=true),
    angles_fixed=true,
    w_0_fixed=true,
    sphereColor={0,0,255},
    useQuaternions=false) annotation (Placement(transformation(extent={{122,-30},{142,-10}})));
  CablesFlange.CableSpring cableR(
    fix_b=true,
    s_b_fixed=true,
    v_b_fixed=true) annotation (Placement(transformation(extent={{92,-30},{112,-10}})));
  Modelica.Mechanics.MultiBody.Parts.Body bodyL(
    r_CM={0,0,0},
    m=1.5,
    r_0(each fixed=true, start={-0.5,0,0}),
    v_0(each fixed=true),
    angles_fixed=true,
    w_0_fixed=true,
    sphereColor={255,0,0},
    useQuaternions=false)                                                                                                                                                                                       annotation (
    Placement(transformation(extent={{-120,-30},{-140,-10}})));
  Modelica.Mechanics.MultiBody.Sensors.CutForce cutForceR(N_to_m=100, forceColor={0,0,255}) annotation (Placement(transformation(extent={{34,-30},{54,-10}})));
  Modelica.Mechanics.MultiBody.Sensors.CutForce cutForceL(N_to_m=100, forceColor={255,0,0}) annotation (Placement(transformation(extent={{-20,-30},{-40,-10}})));
equation
  connect(fixed1.frame_b, pulley.support) annotation (Line(points={{0,6},{0,-10}}));
  connect(cableR.frame_b,bodyR. frame_a) annotation (Line(
      points={{112,-20},{122,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(pulley.flange_b,cableR. flange_a) annotation (Line(points={{-10,-12},{92,-12}},color={0,127,0}));
  connect(bodyL.frame_a,cableL. frame_a) annotation (Line(
      points={{-120,-20},{-110,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(cableL.flange_b, pulley.flange_a) annotation (Line(points={{-90,-12},{10,-12}},  color={0,127,0}));
  connect(pulley.frame_b,cutForceR. frame_a) annotation (Line(
      points={{10,-20},{34,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(cutForceR.frame_b,cableR. frame_a) annotation (Line(
      points={{54,-20},{92,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(cutForceL.frame_a, pulley.frame_a) annotation (Line(
      points={{-20,-20},{-10,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(cutForceL.frame_b,cableL. frame_b) annotation (Line(
      points={{-40,-20},{-90,-20}},
      color={95,95,95},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end Pulley3DTest;
