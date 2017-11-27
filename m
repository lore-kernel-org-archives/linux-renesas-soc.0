Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:45999 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753007AbdK0SSP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Nov 2017 13:18:15 -0500
MIME-Version: 1.0
In-Reply-To: <20171127180528.rg5imhfthbso477s@ninjato>
References: <1510839994-12473-1-git-send-email-geert+renesas@glider.be> <20171127180528.rg5imhfthbso477s@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Nov 2017 19:18:14 +0100
Message-ID: <CAMuHMdX7e8vkcmLBYk9who1pmLGe7Q98_5fo3hS+Q7vqtFo5iw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: eeprom: Add Renesas R1EX24128
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Nov 27, 2017 at 7:05 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>>  Documentation/devicetree/bindings/eeprom/eeprom.txt | 2 +-
>
> I just noticed this file is missing in the AT24 entry in MAINTAINERS. I
> wanted to prepare a patch for that but then I was wondering if the name
> "eeprom.txt" is really suitable? I have doubts. Would "at24.txt" be a
> better name maybe? Rob?

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
