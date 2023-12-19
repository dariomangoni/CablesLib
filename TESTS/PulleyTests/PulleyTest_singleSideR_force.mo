within CablesLib.TESTS.PulleyTests;
model PulleyTest_singleSideR_force
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
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1(animation=false,
                                                  r = {0.5, 0, 0}) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, 16})));
  Modelica.Mechanics.Translational.Sources.Force force annotation (Placement(transformation(extent={{-60,-22},{-40,-2}})));
  Modelica.Blocks.Sources.Constant const(k=11) annotation (Placement(transformation(extent={{-110,-22},{-90,-2}})));
  Modelica.Mechanics.Translational.Sources.Force force1 annotation (Placement(transformation(extent={{-44,-78},{-24,-58}})));
  Modelica.Blocks.Sources.Constant const1(k=11) annotation (Placement(transformation(extent={{-94,-78},{-74,-58}})));
  Modelica.Mechanics.MultiBody.Parts.Body bodyR1(
    r_CM={0,0,0},
    m=1,
    r_0(each fixed=true, start={1,0,0}),
    v_0(each fixed=true),
    angles_fixed=true,
    w_0_fixed=true,
    useQuaternions=false) annotation (Placement(transformation(extent={{54,-86},{74,-66}})));
  CablesFlange.CableSpring cableR1(fix_b=true) annotation (Placement(transformation(extent={{24,-86},{44,-66}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed2(animation=false, r={0.5,0,0})
                                                                   annotation (
    Placement(transformation(extent={{10,-10},{-10,10}},      rotation = 270, origin={-2,-86})));
  Modelica.Mechanics.Translational.Components.Mass mass(m=0.01, v(fixed=true)) annotation (Placement(transformation(extent={{-14,-78},{6,-58}})));
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
  connect(pulley.flange_b, cableR.flange_a) annotation (Line(points={{10,-12},{30,-12}}, color={0,127,0}));
  connect(force.flange, pulley.flange_a) annotation (Line(points={{-40,-12},{-10,-12}}, color={0,127,0}));
  connect(const.y, force.f) annotation (Line(points={{-89,-12},{-76,-12},{-76,-12},{-62,-12}}, color={0,0,127}));
  connect(const1.y, force1.f) annotation (Line(points={{-73,-68},{-46,-68}}, color={0,0,127}));
  connect(cableR1.frame_b, bodyR1.frame_a) annotation (Line(
      points={{44,-76},{54,-76}},
      color={95,95,95},
      thickness=0.5));
  connect(cableR1.frame_a, fixed2.frame_b) annotation (Line(
      points={{24,-76},{-2,-76}},
      color={95,95,95},
      thickness=0.5));
  connect(cableR1.flange_a, mass.flange_b) annotation (Line(points={{24,-68},{6,-68}}, color={0,127,0}));
  connect(force1.flange, mass.flange_a) annotation (Line(points={{-24,-68},{-14,-68}}, color={0,127,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end PulleyTest_singleSideR_force;
