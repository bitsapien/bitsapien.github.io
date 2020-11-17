import telepot
import os
import subprocess

offsetFile = 'offset'

bot = telepot.Bot(os.getenv('BOT_SECRET'))
offsetFileContent = (open(offsetFile, 'r').readline())
if(offsetFileContent.isnumeric()):
    offset = int(offsetFileContent) + 1
elif(offsetFileContent == ''):
    offset = 0
else:
    print("The offset file looks fishy")

messages = bot.getUpdates(offset)

for message in messages:
    entities = message.get('message').get('entities')
    if entities:
        for entity in entities:
            if(entity['type'] == 'url'):
                url = message['message']['text']
                os.system(f'. ../scripts.sh && readlater "{url}"')
    newOffset = message['update_id']
    open(offsetFile, 'w').write(str(newOffset))



