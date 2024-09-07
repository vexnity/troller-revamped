import discord
from discord.ext import commands
import cv2
from ffpyplayer.player import MediaPlayer
import pynput
import threading
import os

TOKEN = "REPLACEME"  # Placeholder for the actual token



FilePath = "troll in suit.mp4"
th1 = threading.Thread(target=lambda: None)
th1_started = False

intents = discord.Intents.default()
intents.message_content = True
bot = commands.Bot(command_prefix='!', intents=intents)

@bot.event
async def on_ready():
    print(f'Logged in as {bot.user.name}')

@bot.command()
async def execute(ctx):
    global th1, th1_started
    print("Received !execute command")

    if not th1_started or not th1.is_alive():
        if th1_started and not th1.is_alive():
            print("Restarting video playback thread...")
            th1 = threading.Thread(target=play_video)
        else:
            print("Starting video playback thread...")
            th1 = threading.Thread(target=play_video)
            th1.start()
            th1_started = True
        await ctx.send('Executing video playback.')
    else:
        await ctx.send('Video playback already in progress.')

def play_video():
    print("Starting video playback...")
    mouse_listener = pynput.mouse.Listener(suppress=True)
    keyboard_listener = pynput.keyboard.Listener(suppress=True)
    video = cv2.VideoCapture(FilePath)
    player = MediaPlayer(FilePath)
    mouse_listener.start()
    keyboard_listener.start()

    try:
        with open("resume_flag.txt", "w") as f:
            f.write('True')
    except:
        print("flagError")

    while True:
        grabbed, frame = video.read()
        audio_frame, val = player.get_frame()
        if not grabbed:
            mouse_listener.stop()
            keyboard_listener.stop()
            try:
                with open("resume_flag.txt", "w") as f:
                    f.write('False')
                break
            except:
                print("flagError")

        cv2.namedWindow("Video", cv2.WND_PROP_FULLSCREEN)
        cv2.setWindowProperty("Video", cv2.WND_PROP_FULLSCREEN, cv2.WINDOW_FULLSCREEN)
        cv2.setWindowProperty("Video", cv2.WND_PROP_TOPMOST, 1)
        cv2.imshow("Video", frame)

        cv2.waitKey(30)
        if val != 'eof' and audio_frame is not None:
            img, t = audio_frame

    video.release()
    cv2.destroyAllWindows()
    mouse_listener.stop()
    keyboard_listener.stop()
    print("Video playback finished.")

bot.run(TOKEN)
