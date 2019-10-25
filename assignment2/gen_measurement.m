function y_measured = gen_measurement(beta, phi, p, r)

    R = 0.2^2*eye(2);
    C = [0 0 1 0
         0 0 0 1];
    coder.extrinsic('randn');
    v = sqrt(R)*randn(2,1,1);
    y_measured = C*[beta phi p r]' + v;
    
end