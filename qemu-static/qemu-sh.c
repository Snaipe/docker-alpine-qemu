#include <unistd.h>
#include <err.h>

int main(int argc, char **argv)
{
	long arg_max = sysconf(_SC_ARG_MAX);
	if (arg_max == -1) {
		err(1, "sysconf");
	}

	char *prog = "/sbin/qemu-enter";

	char *args[arg_max];
	size_t i = 0, j = 1;

	args[i++] = prog;
	args[i++] = "/bin/sh";

	for (; argv[j] && i < sizeof (args) / sizeof (void *); ++i, ++j) {
		args[i] = argv[j];
	}
	args[i] = NULL;

	if (execv(prog, args) == -1)
		err(1, "execv");
}
