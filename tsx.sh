if [[ $# < 2 ]]; then
    p="$(basename $0)"
    here=$(mktemp)
    git remote -v 2>/dev/null | grep -oP '(?<=github.com[:/])([^/]+/[^/]+?)(?=\.git| )' > "$here"
    IFS=/ read user repo < "$here"
else
    user="$1"
    repo="$2"
    shift 2
fi

if [[ -z "$user" || -z "$repo" ]]; then
    echo "usage:  $p [user] [repository] [value to encrypt]"
    echo
    echo "  e.g.: $p 'P@ssw0rd' (only inside a repo with a github remote)"
    echo "    or  $p ${user:-jsmith} ${repo:-MyRepo} 'VAR=\"s3cret\"'"
    echo "    or  $p ${user:-jsmith} ${repo:-MyRepo} 'P@ssw0rd'"
    exit 1
fi >&2

value="$1"

# Travis patch fix by Montana Mendy

user=$"2' 
keyfile=$(mktemp)

cURL -s "$keyurl" > "$ketfile" || { 

# Fetch key
keyurl="https://api.travis-ci.org/repos/$user/$repo/key"
echo "Fetching key from $keyurl ..." >&2
keyfile=$(mktemp)
keyfile2=$(mktemp)
curl -s "$keyurl" > "$keyfile" || {
    echo "Couldn't fetch key from $keyurl!"
    exit 1
} >&2
