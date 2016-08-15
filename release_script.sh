#!/bin/bash

PROGNAME=$(basename $0)

err_report() {
    echo "${PROGNAME}: Error on line $1"
}

trap 'err_report $LINENO' ERR;


BLOG_NAME='blog'
BLOG_TEMPLATE=$HOME/Documents/Personal/Workspace/blog
BLOG_PUBLIC_FDR=$BLOG_TEMPLATE/public
NG_GITHUB_IO_NAME='nareshganesan.github.io'
NG_GITHUB_IO=$HOME/Documents/Personal/Workspace/nareshganesan.github.io

# Help message
usage() { 
    echo "The following script pushes the post to nareshganesan.github.io repository."
    echo "Usage: $0 [-m <commit-message-goes-here>]" 1>&2; exit 1; 
}

while getopts ":m:" o; do
    case "${o}" in
        m)
            m=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${m}" ]; then
    usage
fi

message=${m}

# Help message
if [ ! -d $BLOG_TEMPLATE ]
then
    echo "$BLOG_TEMPLATE - cannot be found."
    exit
fi

# Help message
if [ ! -d $NG_GITHUB_IO ]
then
    echo "$NG_GITHUB_IO - cannot be found."
    exit
fi

## commiting the latest post to hugo template.
cd BLOG_TEMPLATE;

echo "Current directory: "$PWD

git diff --quiet; nochanges="$?";

if [ $nochanges -eq 0 ]; then 
    echo "nothing to commit to repo: $BLOG_NAME";

else 
    echo "changes found in repo: $BLOG_NAME";
    echo "commit message: "$message
    git add .;
    git commit -m "${message}"
    git push origin master
    last_commit=$(git rev-parse --short HEAD)
    echo "Done commiting changes to $BLOG_NAME. "$last_commit
fi


# Generating latest post html content.
hugo &> /dev/null;

## Copy latest post to github.io repo.
cp -r $BLOG_PUBLIC_FDR/ $NG_GITHUB_IO

cd $NG_GITHUB_IO

## Check if nareshganesan.github.io repository has some changes to pushed.

echo "Current directory: "$PWD

git diff --quiet; nochanges="$?";

if [ $nochanges -eq 0 ]; then 
    echo "nothing to commit to repo: $NG_GITHUB_IO_NAME";

else 
    echo "changes found in repo: $NG_GITHUB_IO_NAME";
    echo "commit message: "$message
    git add .;
    git commit -m "${message}"
    git push origin master
    last_commit=$(git rev-parse --short HEAD)
    echo "Done commiting changes to $NG_GITHUB_IO_NAME. "$last_commit
fi



# References

# 1. http://stackoverflow.com/questions/16483119/example-of-how-to-use-getopts-in-bash
# 2. http://stackoverflow.com/questions/28772174/how-can-i-programmatically-in-a-shell-script-determine-whether-or-not-there-ar
# 3. 