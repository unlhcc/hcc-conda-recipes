# THIS IS AN EXAMPLE CONFIG FILE. PLEASE CREATE YOUR OWN sascfg_personal.py FILE USING THE APPROPRIATE TEMPLATES FROM BELOW
# SEE THE CONFIGURATION DOC AT https://sassoftware.github.io/saspy/install.html#configuration

SAS_config_names=['default']

default  = {'saspath'  : '/util/opt/sas/9.4/SASFoundation/9.4/sas'
            }

# Configuration options for saspy - python Dict   # not required unless changing any of the defaults
# valid key are:
#
# 'lock_down' - True | False. True = Prevent runtime overrides of SAS_Config values below
#
# 'verbose'   - True | False. True = Allow print statements for debug type messages
#
# 'prompt'    - True | False. True = Allow prompting as necessary
#
SAS_config_options = {'lock_down': False,
                      'verbose'  : True,
                      'prompt'   : True
                     }

