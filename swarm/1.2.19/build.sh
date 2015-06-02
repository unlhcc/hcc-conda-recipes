mkdir -pv $PREFIX/bin
make
cp {swarm,scripts/amplicon_contingency_table.py,scripts/swarm_breaker.py} $PREFIX/bin
