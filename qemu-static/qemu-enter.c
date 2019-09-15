#include <unistd.h>
#include <err.h>

int main(int argc, char **argv)
{
	long arg_max = sysconf(_SC_ARG_MAX);
	if (arg_max == -1) {
		err(1, "sysconf");
	}

	char *args[arg_max];
	size_t i = 0, j = 1;

	args[i++] = argv[1];
	args[i++] = "-0";
	args[i++] = argv[1];
	args[i++] = "-execve";

	for (; argv[j] && i < sizeof (args) / sizeof (void *); ++i, ++j) {
		args[i] = argv[j];
	}
	args[i] = NULL;

	if (execv("/lib/ld-qemu.so", args) == -1)
		err(1, "execve");
}
