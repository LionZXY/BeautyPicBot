# Bash beauty pic bot

For install bash bot for your server run this:
```bash
git clone https://github.com/LionZXY/BeautyPicBot
cd BeautyPicBot && ./install.sh
crontab -e
```

Chat id you can get by t.me/GetChatBot

And set send by cron. For example this line send image every day in 4:00 UTC:
```bash
0 4 * * * %your bot path%/send_image.sh
```