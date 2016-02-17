#!/usr/bin/env python
# -*- coding: utf8 -*-

# --------------------------------------------------------------------------
#  Copyright 2015-2016 Sam Deane, Elegant Chaos. All rights reserved.
#  This source code is distributed under the terms of Elegant Chaos's
#  liberal license: http://www.elegantchaos.com/license/liberal
# --------------------------------------------------------------------------

import keychain

try:
    import github3
except:
    print("You need to install github3 with: sudo pip install --pre github3.py")
    print("You may also need to install pip first with: sudo easy_install pip")
    exit(1)

def login_using_keychain():
    info = keychain.get_or_set_password("github.com")
    if info:
        (user, password) = info
        gh = github3.login(user, password=password)
        return gh


if __name__ == '__main__':

    gh = login_using_keychain()

    issue = gh.issue("BohemianCoding", "Sketch", "3444")
    print issue.as_dict().keys()
    print issue.title
