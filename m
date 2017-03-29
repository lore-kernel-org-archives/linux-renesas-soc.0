Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:36430 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752316AbdC2Sfu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Mar 2017 14:35:50 -0400
Received: by mail-lf0-f50.google.com with SMTP id x137so14432898lff.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Mar 2017 11:35:49 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170329183544.724690205@cogentembedded.com>
Date: Wed, 29 Mar 2017 21:35:44 +0300
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 0/1] Add missing signal data to R8A7791 PFC driver
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

   Here's a set of 2 patches against the 'fixes' branch of Linus Walleij's
'linux-pinctrl.git'.  The patches add support for (1) the HSCIF1 configured to
use signal group E (which is currently broken) and for (2) the DVC_MUTE signal.

[1/2] pinctrl: sh-pfc: r8a7791: add missing HSCIF1 pinmux data
[2/2] pinctrl: sh-pfc: r8a7791: add missing DVC_MUTE signal

MBR, Sergei
