# args to compile_and_run are:
#	extra compile flags
#	extra run flags
#	expected process return value, if not zero

# setTestOpts(when(fast(), skip))

# Impredicativity
test('IM1', normal, compile_and_run, [''])
test('IM2', normal, compile_fail, [''])
