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
    log.InitLog()

if __name__ == "__main__":
    main(sys.argv)

