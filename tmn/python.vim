"""
    @author     : @USER
    @date       : @DATE
    @last update: @DATE
    @summary    : 
    @version    : 1.0.0.0
"""

import sys,os,getopt,logging,traceback
# import search path
# sys.path.append() 
import gflags

# ================ log ===============
LOGFILE="./@FILE.log"

LOGLEVEL="NOTICE"
FORMAT="[%(levelname)s] %(asctime)s : %(pathname)s %(module)s:%(funcName)s[%(lineno)d] %(message)s"
LEVEL = {}
LEVEL['NOTICE'] = logging.NOTSET
LEVEL['DEBUG'] = logging.DEBUG
LEVEL['INFO'] = logging.INFO
LEVEL['WARNING'] = logging.WARNING
LEVEL['ERROR'] = logging.ERROR
LEVEL['CRITICAL'] = logging.CRITICAL

def InitLog():
    logger = logging.getLogger()
    hdlr = logging.FileHandler(LOGFILE)
    formatter = logging.Formatter(FORMAT)
    hdlr.setFormatter(formatter)
    logger.addHandler(hdlr)
    logger.setLevel(LEVEL[str(LOGLEVEL)])
    return logger
LOG=InitLog()

def main(argv):
    reload(sys)
    sys.setdefaultencoding('utf8')
    try:
        argv = gflags.FLAGS(argv)
    except gflags.UnrecognizedFlagError as e:
        print "%s"%(e)
    except gflags.FlagsError as e:
        print "%s \\n Usage: %s ARGS\\n %s"%(e, sys.argv[0], FLAGS)
        sys.exit(1)

if __name__ == "__main__":
    main(sys.argv)

