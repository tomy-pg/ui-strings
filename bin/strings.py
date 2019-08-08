#!/usr/bin/python3

import argparse
import os
import sys
import fileinput
import re

def main(): 
    arg = parse_command_line()
    explore_file = arg.path
    content_list = place_file_content_in_list(explore_file)
    clean_list = clean_content_list(content_list)
    new_content = replace_explore_file_content(clean_list)
    append_content_to_file(explore_file, new_content)

def parse_command_line():
    parser = argparse.ArgumentParser()
    parser.add_argument('path', help='path to the file to review')
    return parser.parse_args()

def place_file_content_in_list(path):
    content_list = []
    with open(path, 'r') as file:
       for line in file: 
           content_list.append(line)
    return content_list

def clean_content_list(content_list):
    clean_list = []
    for line in content_list:
        if re.match('msgid', line) or re.match('msgstr', line):    
            clean_list.append(line)
    return clean_list

def append_content_to_file(path, content):
    with open(path, 'a') as file:
        for line in content:
            file.write(line)

def replace_explore_file_content(content_list):
    new_list = []
    for line in content_list:
        if re.match('msgid', line):
            content = replace_msgid_content(line)
            new_list.append(content)

        if re.match('msgstr', line):
            new_list.append(line)
    
    return new_list

def replace_msgid_content(content):
    new_msgid_content = remove_msgid(content)
    new_msgid_content = replace_msg_value(new_msgid_content)
    new_msgid_content = 'msgid' + new_msgid_content
    return new_msgid_content

def remove_msgid(text):
    text = re.sub(r'msgid', '', text)
    return text

def replace_msg_value(text):
    return re.sub(r'([a-zA-Z]+)', turn_to_uppercase, text)

def turn_to_uppercase(match):
    return match.group(0).upper()


main()
