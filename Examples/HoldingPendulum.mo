within CablesLib.Examples;
model HoldingPendulum
  inner Modelica.Mechanics.MultiBody.World world(n={0,0,-1})     annotation (
    Placement(transformation(extent={{-118,52},{-98,72}})));
  CablesFlange.Pulley
         pulley(enableFriction=false) annotation (Placement(transformation(extent={{-68,6},{-48,26}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1(animation=false, r={-0.5,0,0})
                                                                   annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin={-58,52})));
  CablesFlange.Pulley
         pulley1(enableFriction=false)
                                      annotation (Placement(transformation(extent={{148,4},{168,24}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed2(animation=false, r={0.5,0,0})
                                                                   annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin={158,52})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(
    n(displayUnit="1") = {0,1,0},
    phi(fixed=true),
    w(fixed=true)) annotation (Placement(transformation(extent={{50,-72},{70,-52}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r={0,0,1}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={62,-24})));
  Modelica.Mechanics.MultiBody.Parts.Body body(r_CM={0,0,0}, m=10) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={62,18})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed3(animation=false, r={0,0,0})
                                                                   annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation=90,    origin={50,-90})));
  CablesFlange.CableSpring
              cableL(fix_b=true, v_b_fixed=true)
                                 annotation (Placement(transformation(extent={{-28,6},{-8,26}})));
  CablesFlange.CableSpring cableR(
    fix_a=true,
    fix_b=false,
    s_a_fixed=true,
    v_a_fixed=true) annotation (Placement(transformation(extent={{112,4},{132,24}})));
  Modelica.Blocks.Sources.Constant const(k=0)  annotation (Placement(transformation(extent={{-214,14},{-194,34}})));
  Modelica.Mechanics.Translational.Sources.Force force1
                                                       annotation (Placement(transformation(extent={{-98,-12},{-78,8}})));
  Modelica.Blocks.Sources.Constant const1(k=100)
                                               annotation (Placement(transformation(extent={{-150,-14},{-130,6}})));
  CablesFlange.ReelLength reelLength annotation (Placement(transformation(extent={{-176,6},{-156,26}})));
equation
  connect(fixed1.frame_b,pulley. support) annotation (
    Line(points={{-58,42},{-58,26}},                               color = {95, 95, 95}, thickness = 0.5));
  connect(fixed2.frame_b, pulley1.support) annotation (Line(
      points={{158,42},{158,24}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute.frame_a, fixed3.frame_b) annotation (Line(
      points={{50,-62},{50,-62},{50,-80}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute.frame_b, fixedTranslation.frame_a) annotation (Line(
      points={{70,-62},{62,-62},{62,-34},{62,-34}},
      color={95,95,95},
      thickness=0.5));
  connect(body.frame_a, fixedTranslation.frame_b) annotation (Line(
      points={{62,8},{62,-14}},
      color={95,95,95},
      thickness=0.5));
  connect(pulley.frame_b, cableL.frame_a) annotation (Line(
      points={{-48,16},{-28,16}},
      color={95,95,95},
      thickness=0.5));
  connect(pulley.flange_b, cableL.flange_a) annotation (Line(points={{-48,24},{-28,24}}, color={0,127,0}));
  connect(cableL.frame_b, body.frame_a) annotation (Line(
      points={{-8,16},{28,16},{28,8},{62,8}},
      color={95,95,95},
      thickness=0.5));
  connect(cableR.frame_a, body.frame_a) annotation (Line(
      points={{112,14},{86,14},{86,8},{62,8}},
      color={95,95,95},
      thickness=0.5));
  connect(cableR.flange_b, pulley1.flange_a) annotation (Line(points={{132,22},{148,22}}, color={0,127,0}));
  connect(cableR.frame_b, pulley1.frame_a) annotation (Line(
      points={{132,14},{148,14}},
      color={95,95,95},
      thickness=0.5));
  connect(force1.flange, pulley1.flange_b) annotation (Line(points={{-78,-2},{186,-2},{186,22},{168,22}}, color={0,127,0}));
  connect(const1.y, force1.f) annotation (Line(points={{-129,-4},{-114,-4},{-114,-2},{-100,-2}}, color={0,0,127}));
  connect(reelLength.flange_b, pulley.flange_a) annotation (Line(points={{-156,23},{-102,23},{-102,24},{-68,24}}, color={0,127,0}));
  connect(pulley.frame_a, reelLength.frame_b) annotation (Line(
      points={{-68,16},{-156,16}},
      color={95,95,95},
      thickness=0.5));
  connect(const.y, reelLength.u) annotation (Line(points={{-193,24},{-174,24},{-174,23},{-176,23}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end HoldingPendulum;
