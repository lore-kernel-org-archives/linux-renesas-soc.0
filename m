Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw0-f172.google.com ([209.85.161.172]:33162 "EHLO
        mail-yw0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933510AbcIFNTA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Sep 2016 09:19:00 -0400
Received: by mail-yw0-f172.google.com with SMTP id l8so54673687ywb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Sep 2016 06:19:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160825164623.GI2856@katana>
References: <1471959320-16947-1-git-send-email-geert+renesas@glider.be>
 <874m6buh17.wl%kuninori.morimoto.gx@renesas.com> <CANqRtoRCoe6-f3ekkvvTsX5co5kj8ZTzUpgfXL8LAHqp6c7=og@mail.gmail.com>
 <CAMuHMdUneaDwC2yMOkcfNQy2f47dTdOoxr=YyZX6VPmZW0kBQg@mail.gmail.com> <20160825164623.GI2856@katana>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Sep 2016 15:18:59 +0200
Message-ID: <CAMuHMdW+PF0h4B060C-xogip5TRaR11gZCPXFh+CsM7eZuCuOQ@mail.gmail.com>
Subject: Re: renesas-drivers-2016-08-23-v4.8-rc3
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 25, 2016 at 6:46 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> > How can we check which ES version we are running? I recall seeing some
>> > patch from Geert that printed out useful information during boot, any
>> > chance that could make it upstream (if it is not already)?
>>
>> It's part of my topic/renesas-debug branch. Just merge that into latest
>> renesas-drivers and see...
>
> I second Magnus in wanting this upstream. The FIXMEs are about the
> cache. Maybe submit an initial version without cache report first? Or
> are there other issues? It would be really helpful to have this in the
> bootlogs by default, I'd say.

I've accidentally stumbled upon a patch from Arnd to match against
SoC revisions:
[PATCH 1/4] base: soc: introduce soc_device_match() interface
http://lists.infradead.org/pipermail/linux-arm-kernel/2016-May/431902.html

Now, soc_device_register() seems to be the API to publish the SoC
revision. Unfortunately the SoC bus itself is registered from a core_initcall(),
which may be too late for our purposes.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
