Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:37053 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932201AbcIAH00 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 03:26:26 -0400
Received: by mail-it0-f52.google.com with SMTP id e124so51534653ith.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Sep 2016 00:26:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <871t149kdu.wl%kuninori.morimoto.gx@renesas.com>
References: <1471959320-16947-1-git-send-email-geert+renesas@glider.be>
 <874m6buh17.wl%kuninori.morimoto.gx@renesas.com> <20160830112457.GB1638@katana>
 <87pooppivx.wl%kuninori.morimoto.gx@renesas.com> <CAMuHMdVqOobeJJQHARjP8=ujZmO+pgb+QfYBOT9Cqa5xagAYUA@mail.gmail.com>
 <878tvca1op.wl%kuninori.morimoto.gx@renesas.com> <20160901055044.GA1603@katana>
 <871t149kdu.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Sep 2016 09:26:24 +0200
Message-ID: <CAMuHMdWm9-vX3CM2HVgTVR=ANeBUAi82DPU_fnqY5WGWbN7RvQ@mail.gmail.com>
Subject: Re: renesas-drivers-2016-08-23-v4.8-rc3
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Simon <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Thu, Sep 1, 2016 at 9:06 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>> > I can reproduce this on Lager board now.
>> > If I OFF:ed on SW8 : 4bit (= MD21), kernel boot will be failed.
>> > It happened on both board
>>
>> Even with my recent patch?
>
> I tried your patch, and it solved this issue.

Interesting...

Does "[PATCH/RFT 0/4] ARM: shmobile: R-Car Gen2: Allow booting secondary CPU
cores in debug mode", without Wolfram's patch, also fix it?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
