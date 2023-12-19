within CablesLib.OLD.JointUPS_mod;
model JointUPSDeltaFlangeTest2
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-88,52})));
  Modelica.Mechanics.MultiBody.Parts.Body body(r_CM={0,0,0},
    m=5,
    r_0(fixed=true, start={0,0,-1}),
    v_0(fixed=true),
    angles_fixed=true,
    w_0_fixed=true,
    useQuaternions=false)                                         annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-88,-92})));
  JointUPS_mod.JointUPSDeltaFlange jointUPSDeltaFlange(n1_a={0,1,0}, nAxis_ia={0,0,1}) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-88,-38})));
  inner Modelica.Mechanics.MultiBody.World world(enableAnimation=true, n(displayUnit="1") = {0,0,-1})
                                                 annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Blocks.Sources.Constant const(k=-Modelica.Constants.g_n*body.m)
                                                                    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,46})));
  Modelica.Mechanics.Translational.Sources.Force force annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,-10})));
  Modelica.Blocks.Sources.Constant const1(k=32)                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-40,46})));
  Modelica.Mechanics.Translational.Sources.Force force1
                                                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-40,-10})));

equation
  jointUPSDeltaFlange.bearing.s = 0;
  connect(jointUPSDeltaFlange.frame_a, fixed.frame_b) annotation (Line(
      points={{-88,-18},{-88,42}},
      color={95,95,95},
      thickness=0.5));
  connect(const.y, force.f) annotation (Line(points={{-10,35},{-10,2}},  color={0,0,127}));
  connect(jointUPSDeltaFlange.frame_b, body.frame_a) annotation (Line(
      points={{-88,-58},{-88,-82}},
      color={95,95,95},
      thickness=0.5));
  connect(force.flange, jointUPSDeltaFlange.axis) annotation (Line(points={{-10,-20},{-10,-46},{-68,-46}}, color={0,127,0}));
  connect(const1.y, force1.f) annotation (Line(points={{-40,35},{-40,2}}, color={0,0,127}));
  connect(jointUPSDeltaFlange.bearing, force1.flange) annotation (Line(points={{-68,-30},{-40,-30},{-40,-20}}, color={0,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end JointUPSDeltaFlangeTest2;
