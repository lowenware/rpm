# Löwenware RPM build environment

Use deploy.sh script to generate rpms for package in this manner
```bash
./deploy.sh aisl
```

or you can generate all available packages by using

```bash
./deploy.sh all
```

## Requirements
- git
- gcc (i386 & x86_64)
- tar
- gzip
- .rpmmacros file in your home folder

## .rpmmacros example

```rpm
%packager       User Name <user@email.com>

%_topdir        /path/to/this/repository/root
%_tmppath       /var/tmp

%_rpmtopdir     %{_topdir}
%_builddir      %{_rpmtopdir}/BUILD
%_rpmdir        %{_rpmtopdir}/RPMS
%_sourcedir     %{_rpmtopdir}/SOURCES
%_specdir       %{_rpmtopdir}/SPECS
%_srcrpmdir     %{_rpmtopdir}/SRPMS
```
