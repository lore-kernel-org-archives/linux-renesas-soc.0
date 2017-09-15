Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:37977 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750838AbdIOH1p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 03:27:45 -0400
Received: by mail-pf0-f195.google.com with SMTP id q76so860269pfq.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Sep 2017 00:27:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170915071549.GC32275@verge.net.au>
References: <1504631724-27363-1-git-send-email-geert+renesas@glider.be>
 <20170906084422.GD10048@verge.net.au> <CAMuHMdXYJaxU=Gt6dwqcYrA_rZgJHqsiZ9uMoH9H0vt3F67eDA@mail.gmail.com>
 <20170915071549.GC32275@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Sep 2017 09:27:44 +0200
Message-ID: <CAMuHMdXEVHg2iVG7EK7YW=NfdpQbgGCoXtxLYLfP-JhDgBe_4A@mail.gmail.com>
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

On Fri, Sep 15, 2017 at 9:15 AM, Simon Horman <horms@verge.net.au> wrote:
> On Wed, Sep 13, 2017 at 05:28:28PM +0200, Geert Uytterhoeven wrote:
>> On Wed, Sep 6, 2017 at 10:44 AM, Simon Horman <horms@verge.net.au> wrote:
>> > I tested this defconfig against renesas-devel-20170905-v4.13 on
>> > a salvator-x/m3 ES1.0. It boots to user-space but I observed the following:
>> >
>> > [   13.000428] sh-sci e6e88000.serial: dma_request_slave_channel failed
>> > [   13.015167] sh-sci e6e88000.serial: dma_request_slave_channel failed
>>
>> The scif2 node in r8a7796.dtsi doesn't have "dmas" properties.
>> These were removed from the datasheet, and scif2 has always been a bit
>> weird on R-Car Gen3...
>
> Ok, so its unrelated?

I expect the same to happen with arm64 defconfig?

Oh wait, I haven't submitted a patch to enable CONFIG_SERIAL_SH_SCI_DMA
in arm64 defconfg yet, only for shmobile_defconfig and multi_v7_defconfig.

Perhaps the loglevel of the dma_request_slave_channel failure should be
lowered from dev_warn() to dev_dbg()? So far I was reluctant to do that.

Or should we add the dmas properties for SCIF2 on r8a7796, like we do on
r8a7795, despite the documentation lacking information about the existence
of SCIF2/IRDA?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
