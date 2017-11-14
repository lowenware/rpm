#/usr/bin/env bash

mkdir -p {BUILD,BUILDROOT,RPMS,SOURCES,SRPMS,GIT}

function deploy {
  DEPLOY_GIT="GIT/$1"
  echo "> git clone --recursive -j8 https://github.com/lowenware/$1.git ${DEPLOY_GIT}"
  git clone --recursive -j8 https://github.com/lowenware/$1.git ${DEPLOY_GIT}
  echo "> ${DEPLOY_GIT}/project.sh deploy SOURCES/"
  DEPLOY_FLAGS=$( ${DEPLOY_GIT}/project.sh deploy SOURCES/ )
  echo "> rpmbuild -ba --target i386 --define "${DEPLOY_FLAGS}" SPECS/$1.spec"
  rpmbuild -ba --target i386 --define "${DEPLOY_FLAGS}" SPECS/$1.spec
  echo "> rpmbuild -ba --target x86_64 --define "${DEPLOY_FLAGS}" SPECS/$1.spec"
  rpmbuild -ba --target x86_64 --define "${DEPLOY_FLAGS}" SPECS/$1.spec
  echo "> rm -Rf ${DEPLOY_GIT} && rpmbuild --clean"
  rm -Rf ${DEPLOY_GIT}  && rpmbuild --clean
}

case $1 in
  all)
    deploy AISL
  ;;
  aisl)
    deploy AISL
  ;;
  *)
    echo "Specify package to deploy or use 'all' keyword"
  ;;
esac
