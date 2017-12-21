Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:36483 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753485AbdLUMdu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 07:33:50 -0500
Received: by mail-qt0-f193.google.com with SMTP id a16so32190146qtj.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Dec 2017 04:33:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171221123017.l43x7zka3qhqtfyn@ninjato>
References: <20171221115423.13591-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVau_wMd8aNVD9+fEsbMoozQxvOvjhoXKziMgh8Q3EcOQ@mail.gmail.com> <20171221123017.l43x7zka3qhqtfyn@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Dec 2017 13:33:48 +0100
Message-ID: <CAMuHMdX2urn2UQxB+_WwZV563EDekq+yDzmCQt5TMGAFaFmFRg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: add GPIO extender
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Thu, Dec 21, 2017 at 1:30 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> Missing gpio-controller, #gpio-cells,
>
> I can fix that...
>
>> and interrupts properties?
>
> ... but this is not tested!

It's hardware description ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
