
# generate all mode_xxx_generic.lua files

myFile = open("D:\\Program Files (x86)\\Steam\\steamapps\\common\\dota 2 beta\\game\\dota\\scripts\\npc\\Bot Modes","r")
done = 0
while True:
	line = myFile.readline()
	if line == '':
		break
	if line.startswith("BOT_MODE_") and not line.startswith("BOT_MODE_NONE"):
		print(line)
		mode = line[len("BOT_MODE_"):len(line)-1].lower()
		createFile = open("D:\\Program Files (x86)\\Steam\\steamapps\\common\\dota 2 beta\\game\\dota\\scripts\\vscripts\\bots\\mode_"+mode+"_generic.lua","w")
		createFile.write("\n\n\n\n")
		createFile.write("_G._savedEnv = getfenv()\n")
		createFile.write("module( \"mode_"+mode+"_generic\", package.seeall )\n")

		createFile.write("\n\n\n\n\n\n\n\n\n\n\n")
		createFile.write("for k,v in pairs( mode_"+mode+"_generic) do _G._savedEnv[k] = v end")
		createFile.write("\n\n\n\n")
		createFile.close()
myFile.close()