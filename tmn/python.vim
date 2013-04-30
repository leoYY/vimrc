"""
    @author     : @USER
    @date       : @DATE
    @last update: @DATE
    @summary    : 
    @version    : 1.0.0.0
"""

import sys,os,getopt

def usage():
    print "Usage: @FILE_NAME [options] ..."

def main():
    try:
        opts,args = getopt.getopt(sys.argv[1:],"vh",["version","help"])
    except GetoptError:
        sys.exit(2)

if __name__ == "__main__":
    main()
    pass
