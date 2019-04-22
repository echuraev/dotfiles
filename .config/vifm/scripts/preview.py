#!/usr/bin/env python

import argparse
import os

DEFAULT_LIMIT = 1000000       # 1Mb
DEFAULT_TEXT_LIMIT = 3000000  # 3Mb
CACHE_DIR = '/tmp/preview_cache'

#  Private functions {{{ #
def _preview_grafical_image(args):
    preview_bin = "/usr/local/bin/term-img"
    size_params = ""
    if args.width != None and args.height != None:
        size_params = '--width {0} --height {1}'.format(args.width, args.height)
    return '{0} {1} "{2}" > /dev/tty'.format(preview_bin, size_params, args.file)

def _preview_text_image_info(args):
    return 'cd "{0}" && convert -identify {1} -verbose /dev/null'.format(os.path.dirname(args.file), os.path.basename(args.file))

def _preview_grafical_pdf(args):
    filename = args.file.replace(os.sep, "_")
    image_path = os.path.join(args.cache_dir, filename + '.png')

    if not os.path.exists(image_path):
        cmd = 'pdftoppm -png -singlefile "{0}" "{1}"'.format(args.file, os.path.splitext(image_path)[0])
        os.system(cmd)
    args.file = image_path
    return _preview_grafical_image(args)

def _preview_text_pdf(args):
    return 'pdftotext -nopgbrk "{0}" -'.format(args.file)
#  }}} Private functions #
#  Public functions {{{ #
def preview_image(args):
    in_tmux = False
    if "TMUX" in os.environ:
        print("\nTMUX doesn't support image preview!\n")
        in_tmux = True

    cmd = ""
    img_size = os.path.getsize(args.file)

    if img_size <= args.max_size and in_tmux is False:
        cmd = _preview_grafical_image(args)
    elif img_size <= args.max_text_size:
        cmd = _preview_text_image_info(args)

    if len(cmd) > 0:
        os.system(cmd)
    else:
        print("Image is too large for preview")


def preview_pdf(args):
    in_tmux = False
    if "TMUX" in os.environ:
        print("\nTMUX doesn't support image preview!\n")
        in_tmux = True

    cmd = ""
    if in_tmux is False:
        cmd = _preview_grafical_pdf(args)
    else:
        cmd = _preview_text_pdf(args)
    os.system(cmd)
#  }}} Public functions #

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Script for preview files")
    parser.add_argument('file', type=str, help="Path to image file")
    parser.add_argument('--width', type=str, help="Width of preview image")
    parser.add_argument('--height', type=str, help="Height of preview image")
    parser.add_argument('--max_size', type=int, default=DEFAULT_LIMIT,
            help="Won't show preview for images more when this size (Default: {0} bytes)".format(DEFAULT_LIMIT))
    parser.add_argument('--max_text_size', type=int, default=DEFAULT_TEXT_LIMIT,
            help="Won't show text preview for images more when this size (Default: {0} bytes)".format(DEFAULT_TEXT_LIMIT))
    parser.add_argument('--cache_dir', type=str, default=CACHE_DIR,
            help="Path to cache dir (Default: {0})".format(CACHE_DIR))

    args = parser.parse_args()

    if not os.path.exists(args.cache_dir):
        os.makedirs(args.cache_dir)

    ext = os.path.splitext(args.file)[1]
    #print os.path.abspath(args.file)
    if ext == '.pdf':
        preview_pdf(args)
    else:
        preview_image(args)

# vim: foldmethod=marker:foldlevel=0
