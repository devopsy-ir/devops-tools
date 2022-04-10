#!/usr/bin/env python
# pylint: disable=C0116,W0613
# This program is dedicated to the public domain under the CC0 license.

"""
Simple Bot to send Telegram messages or files.

This Bot uses the Updater class to handle the bot and the JobQueue to send
timed messages.

First, a few handler functions are defined. Then, those functions are passed to
the Dispatcher and registered at their respective places.
Then, the bot is started and runs until we press Ctrl-C on the command line.

Usage:
Basic Alarm Bot example, sends a message after a set time.
Press Ctrl-C on the command line or send a signal to the process to stop the
bot.
"""

import logging

from telegram import Update
from telegram.ext import Updater, CommandHandler, CallbackContext
from pathlib import Path


# Enable logging
logging.basicConfig(
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s', level=logging.INFO
)

logger = logging.getLogger(__name__)


# Define a few command handlers. These usually take the two arguments update and
# context. Error handlers also receive the raised TelegramError object in error.
# Best practice would be to replace context with an underscore,
# since context is an unused local variable.
# This being an example and not having context present confusing beginners,
# we decided to have it present as context.
def start(update: Update, context: CallbackContext) -> None:
    """Sends explanation on how to use the bot."""
    update.message.reply_text('Hi! Use /apk to receive uploaded APK file link')

def apk(update: Update, context: CallbackContext) -> None:
    """Send a file OR file's link."""
    chat_id = update.message.chat_id


    path_to_file = '/build/vector-gplay-universal-debug.link.txt'
    path = Path(path_to_file)

    if path.is_file():
      print(f'The file {path_to_file} exists')
      f = open('{}'.format(path_to_file), 'rb')
      link = f.readlines()
      f.close()

      text = "{}".format(link)
      update.message.reply_text(text)
    else:
      print(f'The file {path_to_file} does not exist')
      text = 'No APK file!'
      update.message.reply_text(text)
#    context.bot.send_document(chat_id=chat_id, document=open('doc1.docx', 'rb'), filename="doc1.docx")

def main() -> None:
    """Run bot."""
    # Create the Updater and pass it your bot's token.
    updater = Updater(token="5216083863:AAF_sAT_51gZJLpYSNkLYKcLBAjDmzPOXDA"
#    , request_kwargs={'proxy_url': 'http://173.45.80.74:8085/'}
)

    # Get the dispatcher to register handlers
    dispatcher = updater.dispatcher

    # on different commands - answer in Telegram
    dispatcher.add_handler(CommandHandler("start", start))
    dispatcher.add_handler(CommandHandler("help", start))
    dispatcher.add_handler(CommandHandler("apk", apk))

    # Start the Bot
    updater.start_polling()

    # Block until you press Ctrl-C or the process receives SIGINT, SIGTERM or
    # SIGABRT. This should be used most of the time, since start_polling() is
    # non-blocking and will stop the bot gracefully.
    updater.idle()


if __name__ == '__main__':
    main()
