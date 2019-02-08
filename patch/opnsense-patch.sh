# Copyright (c) 2016-2019 Franco Fichtner <franco@opnsense.org>
ARGS=
CACHEDIR="/var/cache/opnsense-patch"
PATCHES=
REFRESH="/usr/local/opnsense/www/index.php"
# user options
DO_FORCE=
DO_INSECURE=
DO_LIST=

	echo "Must be root." >&2
while getopts a:c:efilp:r:s: OPT; do
	e)
		rm -rf ${CACHEDIR}/*
		;;
	f)
		DO_FORCE="-f"
		;;
		DO_INSECURE="--no-verify-peer"
		;;
	l)
		DO_LIST="-l"
		echo "Usage: man opnsense-patch" >&2
mkdir -p ${CACHEDIR}

patch_load()
{
	for PATCH in $(find ${CACHEDIR}/ -name "${REPOSITORY}-*"); do
		if [ ! -s "${PATCH}" ]; then
			rm -f "${PATCH}"
			continue
		fi

		HASH=$(grep '^From [0-9a-f]' ${PATCH} | cut -d ' ' -f 2)
		SUBJECT=$(grep '^Subject: \[PATCH\]' ${PATCH} | cut -d ' ' -f 3-)
		FILE=$(basename ${PATCH})

		if [ -z "${HASH}" -o -z "${SUBJECT}" ]; then
			rm -f "${PATCH}"
			continue
		fi

		echo ${FILE} ${HASH} ${SUBJECT}
	done
}

PATCHES=$(patch_load)

patch_found()
{
	ARG=${1}
	ARGLEN=$(echo -n ${ARG} | wc -c | awk '{ print $1 }')

	echo "${PATCHES}" | while read FILE HASH SUBJECT; do
		if [ "$(echo ${HASH} | cut -c -${ARGLEN})" = ${ARG} ]; then
			echo ${FILE}
			return
		fi
	done
}

patch_print()
{
	echo "${PATCHES}" | while read FILE HASH SUBJECT; do
		if [ -z "${FILE}" ]; then
			continue
		fi
		LINE="$(echo ${HASH} | cut -c -11)"
		LINE="${LINE} $(echo ${SUBJECT} | cut -c -50)"
		echo ${LINE}
	done
}

if [ -n "${DO_LIST}" ]; then
	patch_print
	exit 0
fi
	FOUND="$(patch_found ${ARG})"

	if [ -n "${FOUND}" ]; then
		if [ -n "${DO_FORCE}" ]; then
			rm ${CACHEDIR}/${FOUND}
		else
			echo "Found local copy of ${ARG}, skipping fetch."
			ARGS="${ARGS} ${FOUND}"
			continue;
		fi
	fi

	WANT="${REPOSITORY}-${ARG}"

	fetch ${DO_INSECURE} -q -o "${CACHEDIR}/${WANT}" \
	    "${SITE}/${ACCOUNT}/${REPOSITORY}/commit/${ARG}.patch"

	if [ ! -s "${CACHEDIR}/${WANT}" ]; then
		rm -f "${CACHEDIR}/${WANT}"
		echo "Failed to fetch: ${ARG}" >&2
		exit 1
	fi

	ARGS="${ARGS} ${WANT}"
for ARG in ${ARGS}; do
	if ! patch -Et -p ${PATCHLEVEL} -d "${PREFIX}" -i "${CACHEDIR}/${ARG}"; then
	cat "${CACHEDIR}/${ARG}" | while read PATCHLINE; do
if [ -n "${ARGS}" ]; then
	echo "All patches have been applied successfully.  Have a nice day."
fi
if [ -f ${REFRESH} ]; then
	# force browser to reload JS/CSS
	touch ${REFRESH}
fi