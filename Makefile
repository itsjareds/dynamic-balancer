CC=gcc
CFLAGS=

MPICC=mpicc
MPIFLAGS=

TAR=tar

BINS=static_mpi dynamic_mpi
ARCHIVE=LICENSE README.md Makefile workload.pbs static_mpi.c dynamic_mpi.c

all: $(BINS)

%_mpi: %_mpi.c
	$(MPICC) $(MPIFLAGS) -o $@ $<

%: %.c
	$(CC) $(CFLAGS) -o $@ $<

archive: $(ARCHIVE)
	$(TAR) -czf asg2.tar.gz $(ARCHIVE)

clean:
	rm -f $(BINS)
