#! /bin/sh

REPO_ID=153712871
PDF_URL=https://${CIRCLE_BUILD_NUM}-${REPO_ID}-gh.circle-artifacts.com/0/root/project/sphinx-txt/build/output.pdf
HTML_URL=https://${CIRCLE_BUILD_NUM}-${REPO_ID}-gh.circle-artifacts.com/0/root/project/sphinx-txt/build/html/index.html
BODY="build succeeded!! :tada: \n\n**PDF URL:** ${PDF_URL}\n**HTML URL:** ${HTML_URL}"
PR_ID=`echo $CIRCLE_PULL_REQUESTS | cut -d'/' -f7`
curl -H "Authorization: token ${GitHub_ACCESS_TOKEN}" https://api.github.com/repos/yamamo-i/sphinx-ci/issues/${PR_ID}/comments -d"{
    \"body\": \"${BODY}\"
}"
