within CablesLib.OLD.CablesUPS;
model CableNode
  extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(extent={{-120,60},{-80,100}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(extent={{90,70},{110,90}})));
  Modelica.Mechanics.MultiBody.Parts.Body body(
    r_CM={0,0,0},
    m=0.01,
    r_0(start=r_0, fixed=r_0_fixed),
    v_0(start=v_0, fixed=v_0_fixed),
    angles_fixed=angles_fixed,
    angles_start=angles_start,
    sequence_start=sequence_start,
    w_0_fixed=w_0_fixed,
    w_0_start=w_0_start,
    useQuaternions=false) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-30})));
  parameter Boolean r_0_fixed = false "= true, if r_0 are used as initial values, else as guess values";
  parameter Modelica.SIunits.Position r_0[3] = zeros(3) "Position vector from origin of world frame to origin of frame_a";
  parameter Boolean v_0_fixed = false "= true, if v_0 are used as initial values, else as guess values";
  parameter Modelica.SIunits.Velocity v_0[3] = zeros(3) "Absolute velocity of frame_a, resolved in world frame (= der(r_0))";
  parameter Boolean angles_fixed=false "= true, if angles_start are used as initial values, else as guess values";
  parameter Modelica.SIunits.Angle angles_start[3]={0,0,0} "Initial values of angles to rotate frame_a around 'sequence_start' axes into frame_b";
  parameter Modelica.Mechanics.MultiBody.Types.RotationSequence sequence_start={1,2,3} "Sequence of rotations to rotate frame_a into frame_b at initial time";
  parameter Boolean w_0_fixed=false "= true, if w_0_start are used as initial values, else as guess values";
  parameter Modelica.SIunits.AngularVelocity w_0_start[3]={0,0,0} "Initial or guess values of angular velocity of frame_a resolved in world frame";
equation
  connect(u, y) annotation (Line(points={{-100,80},{100,80}}, color={0,0,127}));
  connect(frame_a, body.frame_a) annotation (Line(
      points={{-100,0},{1.77636e-15,0},{1.77636e-15,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_b, body.frame_a) annotation (Line(
      points={{100,0},{1.77636e-15,0},{1.77636e-15,-20}},
      color={95,95,95},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200})}),
                                                                 Diagram(coordinateSystem(preserveAspectRatio=false)));
end CableNode;
