#!/usr/bin/env python

import argparse
import os

DEFAULT_LIMIT = 1000000       # 1Mb
DEFAULT_TEXT_LIMIT = 3000000  # 3Mb

def preview_image(args):
    in_tmux = False
    if "TMUX" in os.environ:
        print("\nTMUX doesn't support image preview!\n")
        in_tmux = True

    cmd = ""
    img_size = os.path.getsize(args.image)

    if img_size <= args.max_size and in_tmux is False:
        preview_bin = "/usr/local/bin/term-img"
        if args.width != None and args.height != None:
            cmd = '{0} --width {1} --height {2} "{3}" > /dev/tty'.format(preview_bin, args.width, args.height, args.image)
        else:
            cmd = '{0} "{1}" > /dev/tty'.format(preview_bin, args.image)
    elif img_size <= args.max_text_size:
        cmd = 'cd "{0}" && convert -identify {1} -verbose /dev/null'.format(os.path.dirname(args.image), os.path.basename(args.image))

    if len(cmd) > 0:
        os.system(cmd)
    else:
        print("Image is too large for preview")

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Script for preview images")
    parser.add_argument('image', type=str, help="Path to image file")
    parser.add_argument('--width', type=str, help="Width of preview image")
    parser.add_argument('--height', type=str, help="Height of preview image")
    parser.add_argument('--max_size', type=int, default=DEFAULT_LIMIT,
            help="Won't show preview for images more when this size (Default: {0} bytes)".format(DEFAULT_LIMIT))
    parser.add_argument('--max_text_size', type=int, default=DEFAULT_TEXT_LIMIT,
            help="Won't show text preview for images more when this size (Default: {0} bytes)".format(DEFAULT_TEXT_LIMIT))

    args = parser.parse_args()
    preview_image(args)

