addpath('c_generated_code')
N = 100;
nu = 4;
params = [];


for i = 1:N
% 
%     % Random tuning. 
%     Q_p = [5.0, 5.0, 100.0]';
%     Q_v = [0.5, 0.5, 10]';
%     Q_q = [0.01, 0.01, 0.01, 0.01]';
%     Q_w = [0.1, 0.1, 0.01]';
%     q_f = 1e-4;
%     
%     r_f_dot = 0.1;

% With torque damping and sampling ti
%     Q_p = [0.73, 1.3, 1.5*200]'*10;
%     Q_v = [0.12, 0.12, 1.5*10.0]'*10;
%     Q_q = [0.001, 0.001, 0.001, 0.001]';
%     Q_w = [0.1, 0.1, 0.0]';
%     q_f = 1e-4;
%     
%     r_f_dot = 0.01;

% %     % Tuning weigths of the controller
%     % Tuning with torque damping (torque_damping = 0.1*omega in bee units)
%     Q_p = [0.73, 1.3, 1.5*200]';
%     Q_v = [0.12, 0.12, 1.5*10.0]';
%     Q_q = [2, 2, 2, 2]';
%     Q_w = [0.1, 0.1, 0.0]';
%     q_f = 1e-4;
%     
%     r_f_dot = 170;

% %     % Tuning weigths of the controller
%     % Tuning with torque damping (torque_damping = 0.1*omega in bee units)
%     Q_p = [0.73, 1.3, 1.5*200]';
%     Q_v = [0.12, 0.12, 1.5*10.0]';
%     Q_q = [0.1, 0.1, 0.1, 0.1]';
%     Q_w = [0.1, 0.1, 0.0]';
%     q_f = 1e-4;
%     
%     r_f_dot = 10;

%     % Tuning weights without torque damping
%     It did not really work.... 
%     Q_p = [1.0, 0.5, 60]';
%     Q_v = [0.1, 0.06, 1.5*10.0]';
%     Q_q = [1.0, 1.0, 1.0, 1.0]';
%     Q_w = [0.1, 0.1, 0.0]';
%     q_f = 1e-4;
%     
%     r_f_dot = 170;

% THIS IS A GOOD TUNING THAT WORKED FOR BOTH 
% PYTHON AND MATLAB
% Tuning found in mav_sim
    Q_p = [1500.0, 1500.0, 1500.0]'*0.1;
    Q_v = [2, 2, 2]'*1.0;
    Q_q = [1.0, 1.0, 1.0, 1.0]'*0.01;
    Q_w = [0.8, 1.6, 0.0]'*1.0;
    q_f = 0.1;
    
    r_f_dot = 0.01;

% % THIS IS A GOOD TUNING THAT WORKED FOR BOTH 
% % PYTHON AND MATLAB
% % Tuning found in mav_sim
%     Q_p = [1500.0, 1500.0, 1500.0]'*0.1;
%     Q_v = [4, 4, 4]';
%     Q_q = [1.0, 1.0, 1.0, 1.0]'*0.01;
%     Q_w = [0.8, 1.6, 0.0]'*0.1;
%     q_f = 0.1;
%     
%     r_f_dot = 0.001;

%     % Tuning weigths of the controller
%     This specific tuning worked up to 0.016 ms.
%     Q_p = [1.4, 1.5, 1.5*200]';
%     Q_v = [0.12, 0.12, 1.5*10.0]';
%     Q_q = [2, 2, 2, 2]';
%     Q_w = [0.1, 0.1, 0.0]';
%     q_f = 1e-4;
% 
%     r_f_dot = 170;

    cost = [Q_p; ...
            Q_v; ...
            Q_q; ...
            Q_w; ...
            q_f; ...
            r_f_dot];  

    % Reference trajectory 
    ref = [
        des_pos_change(:);         ...
        zeros(3,1);         ...
        [zeros(3,1); 1.0];  ...
        zeros(3,1); ...
        zeros(4,1); ...
        zeros(4,1)];
    params_i = [ref; cost];
    params = [params; params_i];
end
params = [params; params_i];
U_max = 1;


%% discretization
% N = 50;
% T = 0.5; % time horizon length
% x0 = [1; 1; 1; zeros(3,1); zeros(3,1); 1.0; zeros(7,1)];
% 
% nlp_solver = 'sqp'; % sqp, sqp_rti
% qp_solver = 'partial_condensing_hpipm';
%     % full_condensing_hpipm, partial_condensing_hpipm, full_condensing_qpoases, full_condensing_daqp
% qp_solver_cond_N = 5; % for partial condensing
% % integrator type
% sim_method = 'erk'; % erk, irk, irk_gnsf
% 
% %% model dynamics
% model = softfly_model;
% nx = model.nx;
% nu = model.nu;
% ny = size(model.cost_expr_y, 1);      % used in simulink example
% ny_e = size(model.cost_expr_y_e, 1);
% 
% %% model to create the solver
% ocp_model = acados_ocp_model();
% model_name = 'softfly';
% 
% %% acados ocp model
% ocp_model.set('name', model_name);
% ocp_model.set('T', T);
% 
% % symbolics
% ocp_model.set('sym_x', model.sym_x);
% ocp_model.set('sym_u', model.sym_u);
% ocp_model.set('sym_xdot', model.sym_xdot);
% 
% % cost
% ocp_model.set('cost_expr_ext_cost', model.expr_ext_cost);
% ocp_model.set('cost_expr_ext_cost_e', model.expr_ext_cost_e);
% 
% % dynamics
% if (strcmp(sim_method, 'erk'))
%     ocp_model.set('dyn_type', 'explicit');
%     ocp_model.set('dyn_expr_f', model.expr_f_expl);
% else % irk irk_gnsf
%     ocp_model.set('dyn_type', 'implicit');
%     ocp_model.set('dyn_expr_f', model.expr_f_impl);
% end
% 
% % constraints
% ocp_model.set('constr_type', 'auto');
% ocp_model.set('constr_expr_h', model.expr_h);
% ocp_model.set('constr_lh', -ones(4, 1)); % lower bound on h
% ocp_model.set('constr_uh', ones(4,1));  % upper bound on h
% 
% ocp_model.set('constr_x0', x0);
% % ... see ocp_model.model_struct to see what other fields can be set
% 
% % reference in pred horizon?
% rf_traj = [zeros(9,1); 1; zeros(7,1)];
% %cost = [Q_p(:); Q_v(:); Q_q(:); Q_w(:); q_f; r_f_dot];
% ocp_model.set('sym_p', model.sym_p)
% 
% %% acados ocp set opts
% ocp_opts = acados_ocp_opts();
% ocp_opts.set('param_scheme_N', N);
% ocp_opts.set('nlp_solver', nlp_solver);
% ocp_opts.set('sim_method', sim_method);
% ocp_opts.set('qp_solver', qp_solver);
% ocp_opts.set('qp_solver_cond_N', qp_solver_cond_N);
% ocp_opts.set('ext_fun_compile_flags', ''); % '-O2'
% % ... see ocp_opts.opts_struct to see what other fields can be set
% 
% %% create ocp solver
% ocp = acados_ocp(ocp_model, ocp_opts);
% 
% x_traj_init = zeros(nx, N+1);
% u_traj_init = zeros(nu, N);
% 
% %% call ocp solver
% % update initial state
% ocp.set('constr_x0', x0);
% 
% % set trajectory initialization
% ocp.set('init_x', x_traj_init);
% ocp.set('init_u', u_traj_init);
% ocp.set('init_pi', zeros(nx, N)) % initial guess
% 
% params = [];
% for i = 1:N
% 
%     % Tuning weigths of the controller
%     Q_p = [200, 200, 500]';
%     Q_v = [10, 10, 10]';
%     Q_q = [50, 50, 50, 50]';
%     Q_w = [1, 1, 1]';
%     q_f = 1;
% 
%     r_f_dot = 1e-3;
% 
%     cost = [Q_p; ...
%             Q_v; ...
%             Q_q; ...
%             Q_w; ...
%             q_f; ...
%             r_f_dot];  
% 
%     % Reference trajectory 
%     ref = [
%         zeros(3,1); ...
%         zeros(3,1); ...
%         [zeros(3,1); 1.0]; ...
%         zeros(3,1); ...
%         zeros(4,1); ...
%         zeros(4,1)];
%     params_i = [ref; cost];
%     params = [params; params_i];
%     ocp.set('p', params_i, i);
% end
% params = [params; params_i];
% 
% % change values for specific shooting node using:
% %   ocp.set('field', value, optional: stage_index)
% ocp.set('constr_lbx', x0, 0)
% ocp.set('constr_ubx', x0, 0)
% 
% U_max = 1;
% ubu = U_max*ones(4,1);
% lbu = - ubu;
% ocp.set('constr_lbu', lbu, 0)
% ocp.set('constr_ubu', ubu, 0)
% 
% % solve
% %ocp.solve();
% % get solution
% %utraj = ocp.get('u');
% %xtraj = ocp.get('x');
% 
% %status = ocp.get('status'); % 0 - success
% %ocp.print('stat')