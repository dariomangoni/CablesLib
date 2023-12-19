within CablesLib.TESTS.Pulley3DTests;
model Pulley3D2Test
  CablesLib.CablesFlange.CableSpring cableL(
    freeLength_start=0.1,
    fix_a=true,
    fix_b=false,
    s_a_fixed=true,
    v_a_fixed=true) annotation (Placement(visible=true, transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
  Modelica.Mechanics.MultiBody.Parts.Body bodyR(
    r_CM={0,0,0},
    m=1,
    r_0(each fixed=true, start={1,0,-0.2}),
    v_0(each fixed=true),
    angles_fixed=true,
    w_0_fixed=true,
    sphereColor={0,0,255},
    useQuaternions=false) annotation (Placement(transformation(extent={{60,-30},{80,-10}})));
  inner Modelica.Mechanics.MultiBody.World world(n={0,0,-1})     annotation (
    Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  CablesFlange.CableSpring cableR(
    freeLength_start=0.2,
    fix_b=true,
    v_a_fixed=true,
    v_b_fixed=true) annotation (Placement(transformation(extent={{30,-30},{50,-10}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1(animation=false,
                                                  r = {0.5, 0, 0}) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, 16})));
  Modelica.Mechanics.MultiBody.Parts.Body bodyL(r_CM = {0, 0, 0}, m = 1.5,
    r_0(each fixed=true, start={-0.5,0,-0.1}),                                                                           v_0(each fixed = true), angles_fixed = true, w_0_fixed = true,
    sphereColor={255,0,0},                                                                                                                                                              useQuaternions = false) annotation (
    Placement(transformation(extent = {{-60, -30}, {-80, -10}})));
CablesFlange.Pulley3D2 pulley3D2_1(enableFriction=false) annotation (Placement(visible=true, transformation(
        origin={0,-20},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(cableR.frame_b, bodyR.frame_a) annotation (
    Line(points = {{50, -20}, {60, -20}}, color = {95, 95, 95}, thickness = 0.5));
connect(bodyL.frame_a, cableL.frame_a) annotation (
    Line(points = {{-60, -20}, {-50, -20}}, color = {95, 95, 95}, thickness = 0.5));
  connect(fixed1.frame_b, pulley3D2_1.support) annotation (Line(points={{0,6},{0,-10}}));
  connect(cableL.frame_b, pulley3D2_1.frame_a) annotation (Line(points={{-30,-20},{-10,-20}}));
  connect(cableL.flange_b, pulley3D2_1.flange_b) annotation (Line(points={{-30,-12},{-10,-12}}, color={0,127,0}));
  connect(pulley3D2_1.flange_a, cableR.flange_a) annotation (Line(points={{10,-12},{30,-12}}, color={0,127,0}));
  connect(cableR.frame_a, pulley3D2_1.frame_b) annotation (Line(points={{30,-20},{10,-20}}, color={95,95,95}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end Pulley3D2Test;
