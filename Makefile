mandir=/usr/share/man/man1
cmddir=/usr/bin

install: install-man install-cmd

clean: clean-man clean-cmd

install-cmd:
	cp rpglectags $(cmddir)/rpglectags

clean-cmd:
	rm $(cmddir)/rpglectags

install-man:
	cp rpglectags.1 $(mandir)/rpglectags.1

clean-man:
	rm $(mandir)/rpglectags.1

pod:
	pod2text rpglectags > README
	awk '/=head1 DESCRIPTION/{ n=0 }/=head1 INSTALL/ { n=1 }!n' rpglectags \
		| pod2man -n rpglectags -c 'RPG/ILE Ctags' > rpglectags.1
