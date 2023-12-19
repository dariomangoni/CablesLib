within CablesLib.TESTS.CablesTests;
model CableSpringTest_fix_bounce
  Modelica.Mechanics.MultiBody.Parts.Body body(r_CM = {0, 0, 0},
    m=100,
    r_0(each fixed=true, start={1,0,0}),                                                                           v_0(each fixed = true), angles_fixed = true, w_0_fixed = true, useQuaternions = false) annotation (
    Placement(transformation(extent={{58,32},{78,52}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation (
    Placement(transformation(extent = {{-100, -30}, {-80, -10}})));
  inner Modelica.Mechanics.MultiBody.World world(n = {0, 0, -1}) annotation (
    Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  CablesFlange.CableSpring cable(fix_a=true, fix_b=true) annotation (Placement(transformation(extent={{-22,32},{-2,52}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange=true, n(displayUnit="1") = {0,0,1}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-68,12})));
  Modelica.Mechanics.Translational.Sources.Accelerate accelerate(useSupport=true) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-140,18})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-104,34})));
  Modelica.Blocks.Sources.Step step(height=1, startTime=1) annotation (Placement(transformation(extent={{-206,8},{-186,28}})));
  Modelica.Mechanics.MultiBody.Sensors.CutForce cutForce annotation (Placement(transformation(extent={{22,34},{42,54}})));
  Math.Norm f_norm annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={26,2})));
equation
  connect(fixed.frame_b, prismatic.frame_a) annotation (Line(
      points={{-80,-20},{-68,-20},{-68,2}},
      color={95,95,95},
      thickness=0.5));
  connect(cable.frame_a, prismatic.frame_b) annotation (Line(
      points={{-22,42},{-68,42},{-68,22}},
      color={95,95,95},
      thickness=0.5));
  connect(forceSensor.flange_b, prismatic.axis) annotation (Line(points={{-104,44},{-104,58},{-74,58},{-74,20}}, color={0,127,0}));
  connect(accelerate.support, prismatic.support) annotation (Line(points={{-140,8},{-74,8}}, color={0,127,0}));
  connect(accelerate.flange, forceSensor.flange_a) annotation (Line(points={{-130,18},{-104,18},{-104,24}}, color={0,127,0}));
  connect(accelerate.a_ref, step.y) annotation (Line(points={{-152,18},{-185,18}}, color={0,0,127}));
  connect(cable.frame_b, cutForce.frame_a) annotation (Line(
      points={{-2,42},{10,42},{10,44},{22,44}},
      color={95,95,95},
      thickness=0.5));
  connect(body.frame_a, cutForce.frame_b) annotation (Line(
      points={{58,42},{50,42},{50,44},{42,44}},
      color={95,95,95},
      thickness=0.5));
  connect(cutForce.force, f_norm.u) annotation (Line(points={{24,33},{26,33},{26,12}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end CableSpringTest_fix_bounce;
