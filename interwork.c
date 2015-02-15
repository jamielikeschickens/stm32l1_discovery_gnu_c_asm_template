extern int AsmStart(void); // Import the `AsmStart' assembler label as a function
int Double(int); // Stack misalignment can occur if function prototypes not properly declared

void _init() {}

int main(void) {
	int result = 0 ;

	//	C 'main()' starting ;
	// Running assembler code... ;
	result = AsmStart() ;

	// Finshed running assembler, back in C\n") ;
	// Result is <result>) ;
	// Done! ;
	return result ; // after this line, we're done and the processor will take an exception
}

/* Integer doubling function 
 * Argument passed in r0
 * Result passed back in r0
 * (C) Simon Hollis 2015
 */
int Double(int number)  { 
	// Doubling... 
	return number * 2 ;
}
