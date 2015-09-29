#! /bin/bash
su - root -c '
slackpkg update gpg
slackpkg update
slackpkg upgrade-all
'