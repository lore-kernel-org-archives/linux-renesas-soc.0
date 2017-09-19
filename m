Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:38105 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751000AbdISJN0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Sep 2017 05:13:26 -0400
Received: by mail-pg0-f67.google.com with SMTP id m30so1717490pgn.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Sep 2017 02:13:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170830064402.GB10398@verge.net.au>
References: <1503912370-20180-1-git-send-email-geert+renesas@glider.be> <20170830064402.GB10398@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Sep 2017 11:13:25 +0200
Message-ID: <CAMuHMdVCUcy48qDvDSDZ9MAgCLiSUd4zgFD2iu5eWkTVinN1Jw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: draak: Add serial console pins
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 30, 2017 at 8:44 AM, Simon Horman <horms@verge.net.au> wrote:
> On Mon, Aug 28, 2017 at 11:26:10AM +0200, Geert Uytterhoeven wrote:
>> Add pin control for SCIF2.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> To be applied after v4.14-rc1, when commit 794a6711764658a1 ("pinctrl:
>> sh-pfc: Initial R8A77995 PFC support") has hit mainline.
>>
>> Else the serial console will fail, reporting (on earlycon):
>>
>>     sh-sci e6e88000.serial: could not find pctldev for node /soc/pin-controller@e6060000/scif2, deferring probe
>
> Thanks, please ping me once that has happened.
> In the meantime I have marked this patch as deferred.

Ping...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
