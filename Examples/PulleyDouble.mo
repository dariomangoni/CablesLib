within CablesLib.Examples;
model PulleyDouble
  inner Modelica.Mechanics.MultiBody.World world(n={0,0,-1})     annotation (
    Placement(transformation(extent={{-80,-20},{-60,0}})));
  Modelica.Mechanics.MultiBody.Parts.Body bodyR(
    r_CM={0,0,0},
    m=1,
    r_0(each fixed=true, start={2,0,0}),
    v_0(each fixed=true),
    angles_fixed=true,
    w_0_fixed=true,
    useQuaternions=false) annotation (Placement(transformation(extent={{110,-66},{130,-46}})));
  CablesFlange.Pulley
         pulley(enableFriction=false) annotation (Placement(transformation(extent={{-30,-66},{-10,-46}})));
  CablesFlange.CableSpring
              cable3(fix_b=true, v_b_fixed=true)
                                 annotation (Placement(transformation(extent={{80,-66},{100,-46}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1(animation=false, r={0.5,0,0})
                                                                   annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin={-20,-20})));
  CablesFlange.Pulley
         pulley1(enableFriction=false)
                                      annotation (Placement(transformation(extent={{46,-66},{66,-46}})));
  CablesFlange.CableSpring cable2(freeLength_fixed=true) annotation (Placement(transformation(extent={{8,-66},{28,-46}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed2(animation=false, r={1.5,0,0})
                                                                   annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin={56,-18})));
  CablesFlange.CableSpring cable1(
    fix_a=true,
    s_a_fixed=true,
    v_a_fixed=true) annotation (Placement(transformation(extent={{-68,-66},{-48,-46}})));
  Modelica.Mechanics.MultiBody.Parts.Body bodyL(
    r_CM={0,0,0},
    m=1,
    r_0(each fixed=true, start={-2,0,0}),
    v_0(each fixed=true),
    angles_fixed=true,
    w_0_fixed=true,
    useQuaternions=false) annotation (Placement(transformation(extent={{-98,-66},{-118,-46}})));
equation
  connect(cable3.frame_b,bodyR. frame_a) annotation (Line(
      points={{100,-56},{110,-56}},
      color={95,95,95},
      thickness=0.5));
  connect(fixed1.frame_b,pulley. support) annotation (
    Line(points={{-20,-30},{-20,-46}},                             color = {95, 95, 95}, thickness = 0.5));
  connect(pulley1.frame_a, cable2.frame_b) annotation (Line(
      points={{46,-56},{28,-56}},
      color={95,95,95},
      thickness=0.5));
  connect(pulley.frame_b, cable2.frame_a) annotation (Line(
      points={{-10,-56},{8,-56}},
      color={95,95,95},
      thickness=0.5));
  connect(pulley.flange_b, cable2.flange_a) annotation (Line(points={{-10,-48},{8,-48}}, color={0,127,0}));
  connect(cable2.flange_b, pulley1.flange_a) annotation (Line(points={{28,-48},{46,-48}}, color={0,127,0}));
  connect(fixed2.frame_b, pulley1.support) annotation (Line(
      points={{56,-28},{56,-46}},
      color={95,95,95},
      thickness=0.5));
  connect(pulley1.flange_b, cable3.flange_a) annotation (Line(points={{66,-48},{80,-48}}, color={0,127,0}));
  connect(pulley1.frame_b, cable3.frame_a) annotation (Line(
      points={{66,-56},{80,-56}},
      color={95,95,95},
      thickness=0.5));
  connect(cable1.frame_b, pulley.frame_a) annotation (Line(
      points={{-48,-56},{-30,-56}},
      color={95,95,95},
      thickness=0.5));
  connect(cable1.flange_b, pulley.flange_a) annotation (Line(points={{-48,-48},{-30,-48}}, color={0,127,0}));
  connect(cable1.frame_a, bodyL.frame_a) annotation (Line(
      points={{-68,-56},{-98,-56}},
      color={95,95,95},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end PulleyDouble;
