Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:37731 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750992AbcIBIKV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 04:10:21 -0400
Received: by mail-it0-f50.google.com with SMTP id e124so24936944ith.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Sep 2016 01:10:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87a8frulzm.wl%kuninori.morimoto.gx@renesas.com>
References: <1471959320-16947-1-git-send-email-geert+renesas@glider.be>
 <874m6buh17.wl%kuninori.morimoto.gx@renesas.com> <20160830112457.GB1638@katana>
 <87pooppivx.wl%kuninori.morimoto.gx@renesas.com> <CAMuHMdVqOobeJJQHARjP8=ujZmO+pgb+QfYBOT9Cqa5xagAYUA@mail.gmail.com>
 <878tvca1op.wl%kuninori.morimoto.gx@renesas.com> <20160901055044.GA1603@katana>
 <871t149kdu.wl%kuninori.morimoto.gx@renesas.com> <CAMuHMdWm9-vX3CM2HVgTVR=ANeBUAi82DPU_fnqY5WGWbN7RvQ@mail.gmail.com>
 <87a8frulzm.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Sep 2016 10:10:19 +0200
Message-ID: <CAMuHMdWkpxcYjpE5_fftiM=HP49s9EjT8ZNWzsxvVLuz2vuhTg@mail.gmail.com>
Subject: Re: renesas-drivers-2016-08-23-v4.8-rc3
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Simon <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Fri, Sep 2, 2016 at 3:38 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>> >> Even with my recent patch?
>> >
>> > I tried your patch, and it solved this issue.
>>
>> Interesting...
>>
>> Does "[PATCH/RFT 0/4] ARM: shmobile: R-Car Gen2: Allow booting secondary CPU
>> cores in debug mode", without Wolfram's patch, also fix it?
>
> Interesting...
>
> Your patch (without Wolfram's patch) also solved this issue

I can offer some explanation, though...

The regulator quirk code masks all interrupts and events. Some of these events
are error states, but not all of them are. Hence they may be set (and cause
problems due to unhandled interrupts without the quirk) depending on power
consumption on the various power rails. The latter are influenced by secondary
CPU booting, and possibly by configuration of reset debug hardware.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
