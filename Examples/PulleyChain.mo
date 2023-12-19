within CablesLib.Examples;
model PulleyChain
  inner Modelica.Mechanics.MultiBody.World world(n={0,0,-1})     annotation (
    Placement(transformation(extent={{-80,-20},{-60,0}})));
  Modelica.Mechanics.MultiBody.Parts.Body bodyR(
    r_CM={0,0,0},
    m=1,
    r_0(each fixed=true, start={2,0,0}),
    v_0(each fixed=true),
    angles_fixed=true,
    w_0_fixed=true,
    useQuaternions=false) annotation (Placement(transformation(extent={{108,-64},{128,-44}})));
  CablesFlange.Pulley
         pulley(enableFriction=false) annotation (Placement(transformation(extent={{-30,-66},{-10,-46}})));
  CablesFlange.CableSpring
              cable2(fix_b=true, v_b_fixed=true)
                                 annotation (Placement(transformation(extent={{78,-64},{98,-44}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1(animation=false, r={0.5,0,0})
                                                                   annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin={-20,-20})));
  CablesFlange.Pulley
         pulley1(enableFriction=false)
                                      annotation (Placement(transformation(extent={{26,-66},{46,-46}})));
  CablesFlange.CableSpring cable1(freeLength_fixed=true)
                                  annotation (Placement(transformation(extent={{-2,-66},{18,-46}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed2(animation=false, r={1.5,0,0})
                                                                   annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin={36,-18})));
  Modelica.Mechanics.Translational.Sources.Position position annotation (Placement(transformation(extent={{-78,-58},{-58,-38}})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=0.5,
    freqHz=0.2,
    offset=-2)
              annotation (Placement(transformation(extent={{-128,-58},{-108,-38}})));
equation
  connect(cable2.frame_b,bodyR. frame_a) annotation (Line(
      points={{98,-54},{108,-54}},
      color={95,95,95},
      thickness=0.5));
  connect(fixed1.frame_b,pulley. support) annotation (
    Line(points={{-20,-30},{-20,-46}},                             color = {95, 95, 95}, thickness = 0.5));
  connect(pulley1.frame_a, cable1.frame_b) annotation (Line(
      points={{26,-56},{18,-56}},
      color={95,95,95},
      thickness=0.5));
  connect(pulley.frame_b, cable1.frame_a) annotation (Line(
      points={{-10,-56},{-2,-56}},
      color={95,95,95},
      thickness=0.5));
  connect(pulley.flange_b, cable1.flange_a) annotation (Line(points={{-10,-48},{-2,-48}}, color={0,127,0}));
  connect(cable1.flange_b, pulley1.flange_a) annotation (Line(points={{18,-48},{26,-48}}, color={0,127,0}));
  connect(fixed2.frame_b, pulley1.support) annotation (Line(
      points={{36,-28},{36,-46}},
      color={95,95,95},
      thickness=0.5));
  connect(pulley1.flange_b, cable2.flange_a) annotation (Line(points={{46,-48},{62,-48},{62,-46},{78,-46}}, color={0,127,0}));
  connect(pulley1.frame_b, cable2.frame_a) annotation (Line(
      points={{46,-56},{62,-56},{62,-54},{78,-54}},
      color={95,95,95},
      thickness=0.5));
  connect(position.s_ref,sine. y) annotation (Line(points={{-80,-48},{-107,-48}},color={0,0,127}));
  connect(position.flange, pulley.flange_a) annotation (Line(points={{-58,-48},{-30,-48}}, color={0,127,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end PulleyChain;
