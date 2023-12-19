within CablesLib.TESTS;
package ReelTests
  model ReelLengthTest
    CablesFlange.ReelLength reelLength annotation (Placement(transformation(extent={{-66,-12},{-46,8}})));
    inner Modelica.Mechanics.MultiBody.World world(n(displayUnit="1") = {0,0,-1}) annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    Modelica.Blocks.Sources.Ramp ramp(height=2, duration=10) annotation (Placement(transformation(extent={{-102,-6},{-82,14}})));
    Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation (
      Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-56,-42})));
    Modelica.Mechanics.MultiBody.Parts.Body body(
      r_CM={0,0,0},
      m=1,
      r_0(each fixed=true, start={1,0,0}),
      v_0(each fixed=true),
      angles_fixed=true,
      w_0_fixed=true,
      useQuaternions=false)                                                                  annotation (
      Placement(transformation(extent={{116,-12},{136,8}})));
    CablesFlange.CableSpring cable(
      fix_b=true,
      s_b_fixed=false,
      v_b_fixed=true) annotation (Placement(transformation(extent={{46,-12},{66,8}})));
    Modelica.Mechanics.MultiBody.Sensors.CutForce cutForce annotation (Placement(transformation(extent={{2,-18},{22,2}})));
    Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation (Placement(transformation(extent={{-8,30},{12,10}})));
    Math.Norm f_norm annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={4,-44})));
  equation
    connect(reelLength.u, ramp.y) annotation (Line(points={{-66,5},{-74,5},{-74,4},{-81,4}}, color={0,0,127}));
    connect(cable.frame_b,body. frame_a) annotation (Line(
        points={{66,-2},{116,-2}},
        color={95,95,95},
        thickness=0.5));
    connect(reelLength.frame_a, fixed.frame_b) annotation (Line(
        points={{-56,-12},{-56,-32}},
        color={95,95,95},
        thickness=0.5));
    connect(reelLength.flange_b, forceSensor.flange_a) annotation (Line(points={{-46,5},{-28,5},{-28,20},{-8,20}}, color={0,127,0}));
    connect(cable.flange_a, forceSensor.flange_b) annotation (Line(points={{46,6},{30,6},{30,20},{12,20}}, color={0,127,0}));
    connect(reelLength.frame_b, cutForce.frame_a) annotation (Line(
        points={{-46,-2},{-22,-2},{-22,-8},{2,-8}},
        color={95,95,95},
        thickness=0.5));
    connect(cable.frame_a, cutForce.frame_b) annotation (Line(
        points={{46,-2},{34,-2},{34,-8},{22,-8}},
        color={95,95,95},
        thickness=0.5));
    connect(cutForce.force, f_norm.u) annotation (Line(points={{4,-19},{4,-34}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end ReelLengthTest;

  model ReeForceTest
    CablesFlange.ReelForce reelForce annotation (Placement(transformation(extent={{-66,-12},{-46,8}})));
    inner Modelica.Mechanics.MultiBody.World world(n(displayUnit="1") = {0,0,-1}) annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    Modelica.Blocks.Sources.Sine sine(
      amplitude=5,
      freqHz=2,
      offset=body.m*Modelica.Constants.g_n) annotation (Placement(transformation(extent={{-102,-6},{-82,14}})));
    Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation (
      Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-56,-42})));
    Modelica.Mechanics.MultiBody.Parts.Body body(
      r_CM={0,0,0},
      m=1,
      r_0(each fixed=true, start={0,0,-1}),
      v_0(each fixed=true),
      angles_fixed=true,
      w_0_fixed=true,
      useQuaternions=false)                                                                  annotation (
      Placement(transformation(extent={{116,-12},{136,8}})));
    CablesFlange.CableSpring cable(
      fix_b=true,
      s_a_fixed=true,
      s_b_fixed=false,
      v_a_fixed=true,
      v_b_fixed=true) annotation (Placement(transformation(extent={{46,-12},{66,8}})));
    Modelica.Mechanics.MultiBody.Sensors.CutForce cutForce annotation (Placement(transformation(extent={{2,-18},{22,2}})));
    Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation (Placement(transformation(extent={{-8,30},{12,10}})));
    Math.Norm f_norm annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={4,-44})));
  equation
    connect(reelForce.u, sine.y) annotation (Line(points={{-66,5},{-74,5},{-74,4},{-81,4}}, color={0,0,127}));
    connect(cable.frame_b,body. frame_a) annotation (Line(
        points={{66,-2},{116,-2}},
        color={95,95,95},
        thickness=0.5));
    connect(reelForce.frame_a, fixed.frame_b) annotation (Line(
        points={{-56,-12},{-56,-32}},
        color={95,95,95},
        thickness=0.5));
    connect(reelForce.flange_b, forceSensor.flange_a) annotation (Line(points={{-46,5},{-28,5},{-28,20},{-8,20}}, color={0,127,0}));
    connect(cable.flange_a, forceSensor.flange_b) annotation (Line(points={{46,6},{30,6},{30,20},{12,20}}, color={0,127,0}));
    connect(reelForce.frame_b, cutForce.frame_a) annotation (Line(
        points={{-46,-2},{-22,-2},{-22,-8},{2,-8}},
        color={95,95,95},
        thickness=0.5));
    connect(cable.frame_a, cutForce.frame_b) annotation (Line(
        points={{46,-2},{34,-2},{34,-8},{22,-8}},
        color={95,95,95},
        thickness=0.5));
    connect(cutForce.force, f_norm.u) annotation (Line(points={{4,-19},{4,-34}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end ReeForceTest;
end ReelTests;
