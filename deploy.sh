#/usr/bin/env bash

mkdir -p {build,buildroot,rpms,sources,git}

function deploy {
  DEPLOY_GIT="git/$1"
  echo "> git clone --recursive https://github.com/lowenware/$1.git ${DEPLOY_GIT}"
  git clone --recursive https://github.com/lowenware/$1.git ${DEPLOY_GIT}
  echo "> ${DEPLOY_GIT}/project.sh deploy SOURCES/"
  DEPLOY_FLAGS=$( ${DEPLOY_GIT}/project.sh deploy sources/ )
  echo "> rpmbuild -ba --target i386 --define "${DEPLOY_FLAGS}" SPECS/$1.spec"
  rpmbuild -ba --target i386 --define "${DEPLOY_FLAGS}" specs/$1.spec
  echo "> rpmbuild -ba --target x86_64 --define "${DEPLOY_FLAGS}" SPECS/$1.spec"
  rpmbuild -ba --target x86_64 --define "${DEPLOY_FLAGS}" specs/$1.spec
  echo "> rm -Rf ${DEPLOY_GIT}"
  rm -Rf ${DEPLOY_GIT} 

  RPMS=$(find ./ -type f -name "*.rpm")
  for f in $RPMS; do
    echo "> rpmsign --addsign $f"
    rpmsign --addsign $f
  done
}

case $1 in
  all)
    deploy AISL
  ;;
  aisl)
    deploy AISL
  ;;
  clean)
    rm -Rf ./{build,buildroot,rpms,sources,git}
  ;;
  *)
    echo "Specify package to deploy or use 'all' keyword"
  ;;
esac
