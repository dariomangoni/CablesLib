within CablesLib.TESTS.CablesTests;
model CableSpringTest_extForce
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation (
    Placement(transformation(extent = {{-100, -30}, {-80, -10}})));
  Modelica.Mechanics.MultiBody.Parts.Body body(r_CM = {0, 0, 0}, m = 1,
    r_0(each fixed=true, start={1,0,0}),                                                                           v_0(each fixed = true), angles_fixed = true, w_0_fixed = true, useQuaternions = false) annotation (
    Placement(transformation(extent = {{60, -30}, {80, -10}})));
  inner Modelica.Mechanics.MultiBody.World world(n = {0, 0, -1}) annotation (
    Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  CablesFlange.CableSpring cable(fix_b=true) annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
  Modelica.Mechanics.Translational.Sources.ConstantForce constantForce(f_constant=Modelica.Constants.g_n*body.m + 10) annotation (Placement(transformation(extent={{-60,6},{-40,26}})));
equation
//   cableUPS.jointUPSDeltaFlange.axis.s = cableUPS.massVariable_b.s;
//   cableUPS.jointUPSDeltaFlange.bearing.s = cableUPS.massVariable_a.s;
// cableUPS.jointUPSDeltaFlange.bearing.s = 0;
  connect(fixed.frame_b, cable.frame_a) annotation (Line(
      points={{-80,-20},{-20,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(cable.frame_b, body.frame_a) annotation (Line(
      points={{0,-20},{60,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(constantForce.flange, cable.flange_a) annotation (Line(points={{-40,16},{-30,16},{-30,-12},{-20,-12}}, color={0,127,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end CableSpringTest_extForce;
