# platform = Mozilla Firefox
# strategy = policy

firefox_cfg="policies.json"
# Default to /etc/firefox/policies to use for remediations.
firefox_dirs="/etc/firefox/policies"
permissions=644

declare __REMEDIATE_PYTHON
if [ -x /usr/bin/python ]; then
    __REMEDIATE_PYTHON=/usr/bin/python
elif [ -x /usr/bin/python3 ]; then
    __REMEDIATE_PYTHON=/usr/bin/python3
elif [ -x /usr/bin/python2 ]; then
    __REMEDIATE_PYTHON=/usr/bin/python2
else
    echo "Python required and no python interpreter found."
    exit 1
fi
declare __FIREFOX_DISTRIBUTION
if find /usr -iname firefox\* -type f -print | grep -qe "firefox.sh$\|firefox-bin$"; then
   __FIREFOX_DISTRIBUTION=$(dirname "$(find /usr -iname firefox\* -type f -print | grep -e "firefox.sh$\|firefox-bin$" | head -n1)")/distribution
fi
# If there's a policies file in the distribution directory already, modify it.
if [ -f ${__FIREFOX_DISTRIBUTION}/policies.json ]; then
        firefox_dirs="${__FIREFOX_DISTRIBUTION}"
fi
# Check the possible Firefox install directories
for firefox_dir in ${firefox_dirs}; do
    if ! [ -d "${firefox_dir}" ]; then
        mkdir -p "${firefox_dir}"
        chmod 755 "${firefox_dir}"
    fi
    # Make sure the Firefox .cfg file exists and has the appropriate permissions
    if ! [ -f "${firefox_dir}/${firefox_cfg}" ] ; then
        echo "{" > "${firefox_dir}/${firefox_cfg}"
        echo "    \"policies\": {" >> "${firefox_dir}/${firefox_cfg}"
        echo "    }" >> "${firefox_dir}/${firefox_cfg}"
        echo "}" >> "${firefox_dir}/${firefox_cfg}"
        chmod ${permissions} "${firefox_dir}/${firefox_cfg}"
    fi
    # If the key exists, change it. Otherwise, add it to the config_file.
    if [ -x ${__REMEDIATE_PYTHON} ]; then
        echo """
import json
_file=open('${firefox_dir}/${firefox_cfg}', 'r')
_tree=json.load(_file)
_file.close()


if 'EnableTrackingProtection' in _tree['policies']:
   pass
else:
   _tree['policies']['EnableTrackingProtection'] = dict()

_tree['policies']['EnableTrackingProtection']['Cryptomining'] = True

_file=open('${firefox_dir}/${firefox_cfg}', 'w')
json.dump(_tree, _file, indent=4, sort_keys=True)
_file.close()
""" | ${__REMEDIATE_PYTHON}
        chmod ${permissions} "${firefox_dir}/${firefox_cfg}"
    fi
done