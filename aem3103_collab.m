%	a) Equilibrium Glide at Maximum Lift/Drag Ratio
    [V  Gam H R] = setup_sim();
    to		=	0;			% Initial Time, sec
	tf		=	6;			% Final Time, sec
	tspan	=	[to tf];
	xo		=	[V;Gam;H;R];
	[ta,xa]	=	ode23('EqMotion2',tspan,xo);
	
%	b) Oscillating Glide due to Zero Initial Flight Path Angle
	xo		=	[V;0;H;R];
	[tb,xb]	=	ode23('EqMotion2',tspan,xo);

%	c) Effect of Increased Initial Velocity
	xo		=	[1.5*V;0;H;R];
	[tc,xc]	=	ode23('EqMotion2',tspan,xo);

%	d) Effect of Further Increase in Initial Velocity
	xo		=	[3*V;0;H;R];
	[td,xd]	=	ode23('EqMotion2',tspan,xo);

	figure
	plot(xa(:,4),xa(:,3),xb(:,4),xb(:,3),xc(:,4),xc(:,3),xd(:,4),xd(:,3))
	xlabel('Range, m'), ylabel('Height, m'), grid
    legend('line 1', 'line 2', 'line 3', 'line 4');

	figure
	subplot(2,2,1)
	plot(ta,xa(:,1),tb,xb(:,1),tc,xc(:,1),td,xd(:,1))
	xlabel('Time, s'), ylabel('Velocity, m/s'), grid
	subplot(2,2,2)
	plot(ta,xa(:,2),tb,xb(:,2),tc,xc(:,2),td,xd(:,2))
	xlabel('Time, s'), ylabel('Flight Path Angle, rad'), grid
	subplot(2,2,3)
	plot(ta,xa(:,3),tb,xb(:,3),tc,xc(:,3),td,xd(:,3))
	xlabel('Time, s'), ylabel('Altitude, m'), grid
	subplot(2,2,4)
	plot(ta,xa(:,4),tb,xb(:,4),tc,xc(:,4),td,xd(:,4))
	xlabel('Time, s'), ylabel('Range, m'), grid