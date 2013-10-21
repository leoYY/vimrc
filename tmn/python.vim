"""
    @author     : @USER
    @date       : @DATE
    @last update: @DATE
    @summary    : 
    @version    : 1.0.0.0
"""

import sys,os,getopt,logging,traceback

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

# =====================================


def usage():
    print "Usage: @FILE_NAME [options] ..."

def main():
    try:
        opts,args = getopt.getopt(sys.argv[1:],"vh",["version","help"])
    except GetoptError:
        sys.exit(2)

if __name__ == "__main__":
    try :
        main()
    except Exception, e:
        LOG.CRITICAL("%s"%(traceback.print_exc()))
        sys.exit(-1)

