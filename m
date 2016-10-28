Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:36081 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755519AbcJ1N4W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2016 09:56:22 -0400
Received: by mail-lf0-f42.google.com with SMTP id b75so57340775lfg.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2016 06:56:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20161028135019.GD4041@verge.net.au>
References: <20160914164549.31121-1-ulrich.hecht+renesas@gmail.com>
 <CANqRtoS1x3vYsAOR1cvxOUdQ0f-6ppE2_7sZx580FqB7WwmBwQ@mail.gmail.com> <20161028135019.GD4041@verge.net.au>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 28 Oct 2016 22:56:18 +0900
Message-ID: <CANqRtoQj1YgjG7=UnDP-vOB52vq1GMU8ifmJDN4vkrS5Rta1EQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] r8a7796 SYS-DMAC integration
To: Simon Horman <horms@verge.net.au>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Fri, Oct 28, 2016 at 10:50 PM, Simon Horman <horms@verge.net.au> wrote:
> On Fri, Oct 28, 2016 at 06:12:37PM +0900, Magnus Damm wrote:
>> Hi Ulrich, Simon, everyone,
>>
>> On Thu, Sep 15, 2016 at 1:45 AM, Ulrich Hecht
>> <ulrich.hecht+renesas@gmail.com> wrote:
>> > Hi!
>> >
>> > This enables the three DMA controllers. Identical to the setup on r8a7795.
>> > Based on renesas-drivers-2016-09-13-v4.8-rc6.
>> >
>> > CU
>> > Uli
>> >
>> >
>> > Ulrich Hecht (3):
>> >   clk: renesas: r8a7796: Add SYS-DMAC clocks
>> >   arm64: renesas: r8a7796: add SYS-DMAC controller nodes
>> >   dmaengine: rcar-dmac: Document R-Car M3-W bindings
>>
>> Thanks for your efforts. I noticed that the clock bits have been
>> queued up by Geert, but other parts seem to be missing.
>>
>> Can you please ping/poke/resend or whatever is needed to move the rest
>> of the series forward?
>
> I'm happy to queue up the arm64 patch (which Ulrich recently pinged me
> about). But I wanted to first confirm that it doesn't haven any
> implications for enabling 64bit memory.

Thanks. The SYS-DMAC hardware is a rare case that is able to perform
64-bit bus mastering without the IPMMU, so it is fine to enable at
this point even though the IPMMU is not available.

Cheers,

/ magnus
