#
# spec file for AISL
#


Name:           aisl
Version:        %{_version}
Release:        1
License:        GPL
Summary:        Asynchronous Internet Service Library
Url:            https://github.com/lowenware/AISL
Group:          System Environment/Libraries
Source:         https://lowenware.com/src/aisl-%{version}.tar.gz
BuildRequires:  cmake gcc
Provides:       libaisl

%description
With AISL library you can easily create asynchronous web services.
It is written in plain C for best performance and lightness.
%prep
%setup -q

%build
%cmake

%{__make} %{?_smp_mflags}

%install
%cmake

%{__make} install DESTDIR=%{buildroot} CMAKE_INSTALL_LIBDIR=%{_libdir} %{?_smp_mflags} 

%post

%postun

%files
%defattr(-,root,root)
%doc README.md LICENSE AUTHORS
%{_libdir}/lib%{name}.so

%package devel
Group:          Development/Libraries
Summary:        Header files for AISL development
Version:        %{version}
Release:        1
License:        GPL

%description devel
Header files for development using AISL library.


%files devel
%{_includedir}/aisl

