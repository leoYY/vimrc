import lldb

def getFrame(debugger):
    return debugger.GetSelectedTarget().GetProcess().GetSelectedThread().GetSelectedFrame() 

def loopArr(debugger, command, result, internal_dict):
    params = command.split(" ")
    basePtrExpr = params[0]
    start = int(params[1])
    to = int(params[2])
    cmd = "p *(%s + %d)"
    for i in range(start, to):
        debugger.HandleCommand(cmd%(basePtrExpr, i))

def loopArrBinaryFormat(frame, basePtrExpr, start, to, elementFormat):
    elementSize = int(frame.EvaluateExpression("sizeof(%s[%d])"%(basePtrExpr, start)).value)
    vFormat=" ".join([elementFormat%(i) for i in range(elementSize)])
    print("Each line bytes size: %d"%elementSize)
    for i in range(start, to):
        elementAddr = (frame.EvaluateExpression("&(%s[%d])"%(basePtrExpr, i)).value)
        elements = []
        for j in range(elementSize):
            elementValue = int(frame.EvaluateExpression("int(((uint8_t*)&(%s[%d]))[%d])"%(basePtrExpr, i, j)).value)
            elements.append(elementValue)
        vals=vFormat.format(*elements) 
        print("%s: %s"%(elementAddr, vals))

def loopArrHex(debugger, command, result, internal_dict):
    params = command.split(" ")
    basePtrExpr = params[0]
    start = int(params[1])
    to = int(params[2])
    frame = getFrame(debugger)
    loopArrBinaryFormat(frame, basePtrExpr, start, to, "0x{%d:02x}")

def loopArrBin(debugger, command, result, internal_dict):
    params = command.split(" ")
    basePtrExpr = params[0]
    start = int(params[1])
    to = int(params[2])
    frame = getFrame(debugger)
    loopArrBinaryFormat(frame, basePtrExpr, start, to, "{%d:08b}")

def loopArrAscii(debugger, command, result, internal_dict):
    params = command.split(" ")
    basePtrExpr = params[0]
    start = int(params[1])
    to = int(params[2])
    frame = getFrame(debugger)
    loopArrBinaryFormat(frame, basePtrExpr, start, to, "{%c:08b}")

class DisassemblyMode:
    def __init__(self, debugger, unused):
        self.dbg = debugger
        self.interp = debugger.GetCommandInterpreter()
        self.store_state()
        self.mode_off = True

    def store_state(self):
        self.dis_count = self.get_string_value("stop-disassembly-count")
        self.dis_display = self.get_string_value("stop-disassembly-display")
        self.before_count = self.get_string_value("stop-line-count-before")
        self.after_count = self.get_string_value("stop-line-count-after")

    def get_string_value(self, setting):
        result = lldb.SBCommandReturnObject()
        self.interp.HandleCommand("settings show " + setting, result)
        value = result.GetOutput().split(" = ")[1].rstrip("\n")
        return value

    def set_value(self, setting, value):
        result = lldb.SBCommandReturnObject()
        self.interp.HandleCommand("settings set " + setting + " " + value, result)

    def __call__(self, debugger, command, exe_ctx, result):
        if self.mode_off:
            self.mode_off = False
            self.store_state()
            self.set_value("stop-disassembly-display","always")
            self.set_value("stop-disassembly-count", "8")
            self.set_value("stop-line-count-before", "0")
            self.set_value("stop-line-count-after", "0")
            result.AppendMessage("Disassembly mode on.")
        else:
            self.mode_off = True
            self.set_value("stop-disassembly-display",self.dis_display)
            self.set_value("stop-disassembly-count", self.dis_count)
            self.set_value("stop-line-count-before", self.before_count)
            self.set_value("stop-line-count-after", self.after_count)
            result.AppendMessage("Disassembly mode off.")

    def get_short_help(self):
        return "Toggles between a disassembly only mode and normal source mode\n"


def __lldb_init_module(debugger, internal_dict):
    debugger.HandleCommand("command script add -f init.loopArr loopArr")
    debugger.HandleCommand("command script add -f init.loopArrHex loopArrHex")
    debugger.HandleCommand("command script add -f init.loopArrBin loopArrBin")
    debugger.HandleCommand("command script add -c init.DisassemblyMode toggle-disassembly")

