Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:33390 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756804AbcHYHq1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Aug 2016 03:46:27 -0400
Received: by mail-it0-f68.google.com with SMTP id d65so5105161ith.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Aug 2016 00:46:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANqRtoRCoe6-f3ekkvvTsX5co5kj8ZTzUpgfXL8LAHqp6c7=og@mail.gmail.com>
References: <1471959320-16947-1-git-send-email-geert+renesas@glider.be>
 <874m6buh17.wl%kuninori.morimoto.gx@renesas.com> <CANqRtoRCoe6-f3ekkvvTsX5co5kj8ZTzUpgfXL8LAHqp6c7=og@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Aug 2016 09:46:25 +0200
Message-ID: <CAMuHMdUneaDwC2yMOkcfNQy2f47dTdOoxr=YyZX6VPmZW0kBQg@mail.gmail.com>
Subject: Re: renesas-drivers-2016-08-23-v4.8-rc3
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa@the-dreams.de>, Simon <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Thu, Aug 25, 2016 at 4:42 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> On Wed, Aug 24, 2016 at 9:58 AM, Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
>> I noticed that Lager "ES3.0" board can't boot on this and previous -rc2 branch.
>> In my and Shimoda-san's check, "ES2.0" seems have no problem.
>>
>> It start works if I reverted this patch.
>>
>>         09a28bb8b17e8cab3e9c120b7e37f631cc334a8f
>>         ("ARM: dts: lager: use demuxer for IIC3/I2C3")
>
> FYI, I have now received the problematic Lager ES3 board from
> Morimoto-san and I will install it for remote access.
>
> How can we check which ES version we are running? I recall seeing some
> patch from Geert that printed out useful information during boot, any
> chance that could make it upstream (if it is not already)?

It's part of my topic/renesas-debug branch. Just merge that into latest
renesas-drivers and see...

Note that that branch also has the debug code to disable unused MSTP
clocks during boot. If you only want the SoC identification, just cherry-pick
commit c8e302adee4a1f9c ("[LOCAL] soc: renesas: Print SoC Product Version").

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
