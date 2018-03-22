Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:40349 "EHLO
        mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752494AbeCVIHL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Mar 2018 04:07:11 -0400
Received: by mail-qk0-f169.google.com with SMTP id o64so8276983qkl.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Mar 2018 01:07:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANqRtoQjv51xTmqahkiuMcBFWGXGy=dqHDVhRnWyfd6BWTgMPg@mail.gmail.com>
References: <152153226789.8528.13236911976628814785.sendpatchset@little-apple>
 <20180321085133.gwc2khtzgny5wnyp@verge.net.au> <20180321095706.k2esdpa4ap4wv2i4@verge.net.au>
 <CANqRtoQjv51xTmqahkiuMcBFWGXGy=dqHDVhRnWyfd6BWTgMPg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Mar 2018 09:07:10 +0100
Message-ID: <CAMuHMdVVXY+1YdJOQEOqp1XMFaufWzbmtDDM1r6+hhOKyWJBWw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: Update IPMMU DS1 bit number
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Thu, Mar 22, 2018 at 7:07 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> On Wed, Mar 21, 2018 at 6:57 PM, Simon Horman <horms@verge.net.au> wrote:
>> On Wed, Mar 21, 2018 at 09:51:33AM +0100, Simon Horman wrote:
>>> On Tue, Mar 20, 2018 at 04:51:07PM +0900, Magnus Damm wrote:
>>> > From: Magnus Damm <damm+renesas@opensource.se>
>>> >
>>> > Judging by "R-Car-Gen3-rev0.80" IPMMU IMSSTR register documentation
>>> > for [R-Car V3M] the DS1 bit field should be bit 0.
>>> >
>>> > Update the ipmmu-main property to make it match the data sheet.
>>>
>>> Thanks, I have confirmed this. Apologies for this error.
>>>
>>> AFIK this IP block is currently unused, I wonder if it,
>>> ipmmu_mm and ipmmu_rt should have status = "disabled" added.
>>
>> Sorry, I take that back, I now see the nodes used elsewhere in
>> the same DT file.
>
> Thanks for your help! My opinion is that for R-Car Gen3 we don't
> really need to keep any IPMMU nodes in disabled state in DT. This
> since the whitelist code in the IPMMU driver will include software
> policy handling to during runtime make sure only desired devices get
> enabled.

Good, DT == hardware description taking over again.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
