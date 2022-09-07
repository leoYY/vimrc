import lldb

def loopArr(debugger, command, result, internal_dict):
    params = command.split(" ")
    basePtrExpr = params[0]
    start = int(params[1])
    to = int(params[2])
    cmd = "p *(%s + %d)"
    for i in range(start, to):
        debugger.HandleCommand(cmd%(basePtrExpr, i))

def __lldb_init_module(debugger, internal_dict):
    debugger.HandleCommand("command script add -f init.loopArr loopArr")
