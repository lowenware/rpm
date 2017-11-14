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

%_gpg_name      %{packager}
%_signature     gpg
%_gpgbin        /usr/bin/gpg


%_topdir        /path/to/this/repository/root
%_tmppath       /var/tmp

%_rpmtopdir     %{_topdir}
%_buildrootdir  %{_rpmtopdir}/buildroot
%_builddir      %{_rpmtopdir}/build
%_rpmdir        %{_rpmtopdir}/rpms
%_sourcedir     %{_rpmtopdir}/sources
%_specdir       %{_rpmtopdir}/specs
%_srcrpmdir     %{_rpmdir}/src

```
