#!/usr/bin/env python

import argparse
import os

DEFAULT_LIMIT = 1000000       # 1Mb
DEFAULT_TEXT_LIMIT = 3000000  # 3Mb

def _preview_grafical_image(args):
    preview_bin = "/usr/local/bin/term-img"
    size_params = ""
    if args.width != None and args.height != None:
        size_params = '--width {0} --height {1}'.format(args.width, args.height)
    return '{0} {1} "{2}" > /dev/tty'.format(preview_bin, size_params, args.image)

def _preview_text_image_info(args):
    return 'cd "{0}" && convert -identify {1} -verbose /dev/null'.format(os.path.dirname(args.image), os.path.basename(args.image))

def preview_image(args):
    in_tmux = False
    if "TMUX" in os.environ:
        print("\nTMUX doesn't support image preview!\n")
        in_tmux = True

    cmd = ""
    img_size = os.path.getsize(args.image)

    if img_size <= args.max_size and in_tmux is False:
        cmd = _preview_grafical_image(args)
    elif img_size <= args.max_text_size:
        cmd = _preview_text_image_info(args)

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

