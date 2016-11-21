Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:35779 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753528AbcKULJL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 06:09:11 -0500
Received: by mail-it0-f65.google.com with SMTP id b123so14672563itb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2016 03:09:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CANqRtoSSgrD3iQZfQuo=COkFt5K+akmOgQAdvNAdEtRVOsoiuw@mail.gmail.com>
References: <1476740091-7011-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <CANqRtoRdvxgXvbLUGtUGZmeochHc2f7-MDT0Ft_X26jkSDM1Fw@mail.gmail.com>
 <1850959.FHUakZUkzN@avalon> <6140360.DygU3qqRMK@avalon> <CANqRtoTN+=-u2GCYiOtPXo1UGu2J8qkV0OYRVPsULb6qEBUgCA@mail.gmail.com>
 <CAMuHMdXGttxjc=VicxJ5xhf0giuxp=KiQwy9xh7cVBL-NCGXRw@mail.gmail.com> <CANqRtoSSgrD3iQZfQuo=COkFt5K+akmOgQAdvNAdEtRVOsoiuw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Nov 2016 12:09:10 +0100
Message-ID: <CAMuHMdUB45+TuFyAfKk8MxpfnkrEHb2hUAnEowdrZnUbavuxOQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r8a7796: Add DU device to DT
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Thu, Nov 17, 2016 at 9:51 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> On Thu, Nov 17, 2016 at 5:31 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Thu, Nov 17, 2016 at 3:28 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
>>> First of all, we might have slightly different view of the hardware,
>>> so this might need some further discussions. Also, this topic in my
>>> mind is mainly about DT integration code merge ordering for r8a7796 to
>>> enable >4GB memory access early on without introducing any potential
>>> issues.
>>
>> Note that >4GB memory is already enabled on r8a7796 by U-Boot.
>
> Right, can you remind me - did we get any conclusion about how to
> handle the memory ranges in DTS and the ones from u-boot?
>
> It would be good with a consistent plan how to handle such.

I think we should just apply "arm64: dts: r8a7796: salvator-x: Update memory
node to 4 GiB map".

IMHO it doesn't make much sense to pretend the memory is not present nor
enabled.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
