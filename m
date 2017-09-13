Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:33027 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750962AbdIMP23 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Sep 2017 11:28:29 -0400
Received: by mail-pf0-f194.google.com with SMTP id h4so228562pfk.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Sep 2017 08:28:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170906084422.GD10048@verge.net.au>
References: <1504631724-27363-1-git-send-email-geert+renesas@glider.be> <20170906084422.GD10048@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Sep 2017 17:28:28 +0200
Message-ID: <CAMuHMdXYJaxU=Gt6dwqcYrA_rZgJHqsiZ9uMoH9H0vt3F67eDA@mail.gmail.com>
Subject: Re: [PATCH LOCAL/RFC] arm64: defconfig: Add renesas_defconfig
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Sep 6, 2017 at 10:44 AM, Simon Horman <horms@verge.net.au> wrote:
> On Tue, Sep 05, 2017 at 07:15:24PM +0200, Geert Uytterhoeven wrote:
>> Add a defconfig for Renesas R-Car Gen3 boards.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> Not intended for upstream merge.
>>
>> Loosely based on arm64 defconfig, with support for non-Renesas SoCs and
>> boards removed, and missing support added.
>
> Thanks,
>
> this seems reasonable to me and I'm happy to maintain this driver,
> out of mainline, in a branch in the renesas tree - f.e. topic/defconfig.
>
> I am curious to know which tree you ran savedefconfig against.
> I tried renesas-devel-20170905-v4.13 and renesas-drivers-2017-09-05-v4.13
> but both seemed to generate a diff against the file created in your patch.

I used my current development tree, which is based on
renesas-drivers-2017-09-05-v4.13.
But I see no diff when running savedefconfig against the latter?

> I tested this defconfig against renesas-devel-20170905-v4.13 on
> a salvator-x/m3 ES1.0. It boots to user-space but I observed the following:
>
> [   13.000428] sh-sci e6e88000.serial: dma_request_slave_channel failed
> [   13.015167] sh-sci e6e88000.serial: dma_request_slave_channel failed

The scif2 node in r8a7796.dtsi doesn't have "dmas" properties.
These were removed from the datasheet, and scif2 has always been a bit
weird on R-Car Gen3...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
