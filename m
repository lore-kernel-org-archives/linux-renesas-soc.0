Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:37135 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754466AbeE2GjV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 May 2018 02:39:21 -0400
Received: by mail-ot0-f196.google.com with SMTP id 77-v6so15733271otd.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 May 2018 23:39:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUmqyA8d1VYD9jRyz9pz8RXMrb8ddHor1j9auLu+7T-yA@mail.gmail.com>
References: <1527078995-4259-1-git-send-email-ykaneko0929@gmail.com>
 <CAMuHMdUuuMJZRzCcA86fWghFuWODUHFEbmvG0gqFxmvJzNxRzQ@mail.gmail.com> <CAMuHMdUmqyA8d1VYD9jRyz9pz8RXMrb8ddHor1j9auLu+7T-yA@mail.gmail.com>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date: Tue, 29 May 2018 15:39:20 +0900
Message-ID: <CAH1o70J6u+gtL=0P+CL6V30LeZLikP0KJptqm+vOO4L_hN+JWQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: r8a77965: Add Watchdog Timer controller node
 using RCLK Watchdog Timer
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert-san,

Thanks for your review.
I will correct the commit message as per your instructions.

Thanks,
Kaneko

2018-05-28 22:07 GMT+09:00 Geert Uytterhoeven <geert@linux-m68k.org>:
> Hi Kaneko-san,
>
> (after adding more coffee)
>
> The summary prefix should be "arm64: dts: renesas: r8a77965:"
>
> On Mon, May 28, 2018 at 11:32 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Wed, May 23, 2018 at 2:36 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
>>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>>
>>> Add a device node for the Watchdog Timer (WDT) controller on the Renesas
>>> R-Car M3N (R8A77965) SoC.
>
> M3-N
>
>>> Based on a similar patch of the R8A7796 device tree
>>> by Geert Uytterhoeven <geert+renesas@glider.be>.
>>>
>>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
