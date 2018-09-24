function multiplas_entradas (A, b)
	cols_b = columns (b);
	[L, U, P] = LU_pivot (A);
	[lin_a, cols_a] = size (A);
	for j=1:cols_b
		_b = b(:, j);
		y = L_substituicao (L,_b);
		rank = _rank (U, y);
		if (rank == lin_a)
			x = U_substituicao (U, y);
		elseif (rank < lin_a && rank > -1)
			x = solve_mult_sol (U, y);
		elseif (rank == -1)	
			disp ("solução inconsistente");
		endif
	end
endfunction
				
			
			