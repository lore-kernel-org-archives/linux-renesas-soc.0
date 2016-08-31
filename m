Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:36015 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756381AbcHaHo4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Aug 2016 03:44:56 -0400
Received: by mail-it0-f51.google.com with SMTP id n75so30888641ith.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Aug 2016 00:44:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87pooppivx.wl%kuninori.morimoto.gx@renesas.com>
References: <1471959320-16947-1-git-send-email-geert+renesas@glider.be>
 <874m6buh17.wl%kuninori.morimoto.gx@renesas.com> <20160830112457.GB1638@katana>
 <87pooppivx.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 31 Aug 2016 09:44:43 +0200
Message-ID: <CAMuHMdVqOobeJJQHARjP8=ujZmO+pgb+QfYBOT9Cqa5xagAYUA@mail.gmail.com>
Subject: Re: renesas-drivers-2016-08-23-v4.8-rc3
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Simon <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Wed, Aug 31, 2016 at 8:20 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>> > I noticed that Lager "ES3.0" board can't boot on this and previous -rc2 branch.
>> > In my and Shimoda-san's check, "ES2.0" seems have no problem.
>>
>> I understand the issue now. It is not about ES3.0 vs. ES2.0, it is about
>> cold-boot vs. warm-boot. I remembered the DA9xxx interrupt storm
>> problems we had, and voila, I could reproduce the lockup on ES2.0 here,
>> but you need to cold-boot and have the da9xxx drivers enabled.
>
> It seems lager board has 2 type of DA9xxx chip, type A, and type B.
> We don't know which chip your / my board has.
>
> My *current* Lager board has no issue on cold / warm boot.
> Magnus has my previous Lager board, so I can't try it today.
> I think my current board and previous board have different type of chip.
> Magnus will bring me my previous board tomorrow, so I will check it,
> and try your solution.

The revision doesn't seem to be printed on the chip package, but it is
identified by the da9063 driver (CONFIG_REGULATOR_DA9063=y).

My Koelsch has:

     da9063 6-0058: Device detected (chip-ID: 0x61, var-ID: 0x30)

which corresponds to PMIC_DA9063_AD.
Magnus' Lager (remote access) has the same version.

(after adding the missing pieces to DT) Magnus's Gose has:

    da9063 6-0058: Device detected (chip-ID: 0x61, var-ID: 0x50)

which corresponds to PMIC_DA9063_BB.

Which revision do you have?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
