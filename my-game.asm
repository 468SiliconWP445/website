forever:
			push 0
			call time       
			push eax
			call srand
			
		    push offset message1
			call printf
			add esp, 4

			push offset message2
			call printf
			add esp, 4

			push offset message3
			call printf
			add esp, 4

			call rand   
			mov ebx, 12     
			xor edx, edx    
			div ebx          
			inc edx        
			mov a, edx

			call rand       
			mov ebx, 12     
			xor edx, edx     
			div ebx          
			inc edx      
			mov b, edx

			call rand        
			mov ebx, 3   
			xor edx, edx     
			div ebx         
			inc edx         
			mov sign_id, edx

			mov eax, sign_id

			cmp eax, 1
			je sign_equals_minus

			cmp eax, 2
			je sign_equals_plus

			jmp sign_equals_multiply

		sign_equals_minus:
			mov byte ptr [sign], '-'
			jmp next

		sign_equals_plus:
			mov byte ptr [sign], '+'
			jmp next

		sign_equals_multiply:
			mov byte ptr [sign], '*'
			jmp next

		next:
			movzx eax, byte ptr [sign]
			push b
			push eax
			push a
			push offset message4
			call printf
			add esp, 16

			mov eax, sign_id

			cmp eax, 1
			je answer_minus

			cmp eax, 2
			je answer_plus

			jmp answer_multiply

		answer_minus:
			mov eax, a
			mov ebx, b
			sub eax, ebx
			mov ans, eax
			jmp three

		answer_plus:
			mov eax, a
			mov ebx, b
			add eax, ebx
			mov ans, eax
			jmp three

		answer_multiply:
			mov eax, a
			mov ebx, b
			mul ebx
			mov ans, eax
			jmp three

		three:
			push offset user_ans
			push offset message5
			call scanf_s
			add esp, 8

			mov eax, [ans]
			cmp eax, [user_ans]
			je correct_ans

			jmp incorrect_ans

		correct_ans:
			push offset correct_message
			call printf
			add esp, 4

			lea eax, gold
			inc dword ptr [eax]

			push offset message6
			call printf
			add esp, 4

			push gold
			push offset message7
			call printf
			add esp, 8

			push offset message8
			call printf
			add esp, 4

			jmp forever

		incorrect_ans:
			push offset incorrect_message
			call printf
			add esp, 4

			lea eax, gold
			dec dword ptr [eax]

			lea eax, gold
			cmp dword ptr [eax], 1
			jl reset_gold
			
			push offset message6
			call printf
			add esp, 4

			push gold
			push offset message7
			call printf
			add esp, 8

			push offset message8
			call printf
			add esp, 4

			jmp forever

		reset_gold:
			mov dword ptr [eax], 0

			push offset message6
			call printf
			add esp, 4

			push gold
			push offset message7
			call printf
			add esp, 8

			push offset message8
			call printf
			add esp, 4

			jmp forever
