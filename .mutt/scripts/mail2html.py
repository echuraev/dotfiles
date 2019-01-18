from subprocess import Popen, PIPE
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
import email
import sys
import re

MARKDOWN_MARKER_AT_START = r'(?m)\A^[ \t\n]*!m[ \t\n]*$'  # Remove !m at the beginning of the message
MARKDOWN_MARKER_AT_END   = r'(?m)^[ \t]*!m[ \t\n]*$\s*\Z' # Remove !m at the end of the message

# Transform Markdown string `source` into an HTML string.
def markdown(source):
    p = Popen(['pandoc', '-s', '-f', 'markdown', '-t', 'html'], stdout=PIPE, stdin=PIPE, stderr=PIPE)
    out, err = p.communicate(input=source)
    if p.returncode == 0:
        return out
    raise Exception('Pandoc failed with code: {0}; msg: {1}'.format(p.returncode, err))

# Trims the "!m" marker string from the beginning or end of the input. Returns
# true if the input was trimmed.
def trim_markdown_markers(input):
    trimmed = re.sub(MARKDOWN_MARKER_AT_START, '', input)
    trimmed = re.sub(MARKDOWN_MARKER_AT_END, '', trimmed)
    return trimmed

def process_leaf(part):
    if part['Content-Type'].find("text/plain") == 0 and part['Content-Disposition'] == "inline":
        content = part.get_payload(decode=True)
        trimmed = trim_markdown_markers(content)
        if trimmed != content:
            part.set_payload(trimmed)
            html = markdown(trimmed)
            html_part = email.message.Message()
            html_part['Content-Type'] = 'text/html'
            html_part.set_payload(html)
            return html_part

def process_part(part):
    if part.is_multipart():
        # TODO: Implement this branch of if
        return None
    else:
        html_part = process_leaf(part)
        if html_part is not None:
            msg = MIMEMultipart('alternative')
            msg['Date'] = part['Date']
            msg['From'] = part['From']
            msg['To'] = part['To']
            msg['Subject'] = part['Subject']
            msg['Message-ID'] = part['Message-ID']
            msg['MIME-Version'] = part['MIME-Version']
            msg['Content-Type'] = part['Content-Type']
            msg['Content-Disposition'] = part['Content-Disposition']
            msg['User-Agent'] = part['User-Agent']
            msg.attach(MIMEText(part.get_payload(), 'plain'))
            msg.attach(MIMEText(html_part.get_payload(), 'html'))
            return msg
    return None

def process_message(message):
    msg = email.message_from_string(message)
    msg = process_part(msg)
    if msg is not None:
        return msg.as_string()
    return message

