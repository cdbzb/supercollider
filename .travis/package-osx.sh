#!/bin/sh

mkdir -p $HOME/artifacts
cd $TRAVIS_BUILD_DIR/BUILD/Install
zip -q -r --symlinks $HOME/artifacts/SC-$TRAVIS_COMMIT.zip SuperCollider

mkdir -p $HOME/uploads
cp $HOME/artifacts/SC-$TRAVIS_COMMIT.zip $HOME/uploads/SuperCollider-$VERSION_TO_BUILD-macOS.zip

cd $TRAVIS_BUILD_DIR/package
./create_package.sh -v $VERSION_TO_BUILD
./create_package.sh -v $VERSION_TO_BUILD -l
mv -v SuperCollider-*.tar.bz2 $HOME/uploads/