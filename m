Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:36029 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751127AbcKQIvk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 03:51:40 -0500
Received: by mail-ua0-f193.google.com with SMTP id 12so13916925uas.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2016 00:51:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXGttxjc=VicxJ5xhf0giuxp=KiQwy9xh7cVBL-NCGXRw@mail.gmail.com>
References: <1476740091-7011-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <CANqRtoRdvxgXvbLUGtUGZmeochHc2f7-MDT0Ft_X26jkSDM1Fw@mail.gmail.com>
 <1850959.FHUakZUkzN@avalon> <6140360.DygU3qqRMK@avalon> <CANqRtoTN+=-u2GCYiOtPXo1UGu2J8qkV0OYRVPsULb6qEBUgCA@mail.gmail.com>
 <CAMuHMdXGttxjc=VicxJ5xhf0giuxp=KiQwy9xh7cVBL-NCGXRw@mail.gmail.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 17 Nov 2016 17:51:38 +0900
Message-ID: <CANqRtoSSgrD3iQZfQuo=COkFt5K+akmOgQAdvNAdEtRVOsoiuw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r8a7796: Add DU device to DT
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Thu, Nov 17, 2016 at 5:31 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Magnus,
>
> On Thu, Nov 17, 2016 at 3:28 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
>> First of all, we might have slightly different view of the hardware,
>> so this might need some further discussions. Also, this topic in my
>> mind is mainly about DT integration code merge ordering for r8a7796 to
>> enable >4GB memory access early on without introducing any potential
>> issues.
>
> Note that >4GB memory is already enabled on r8a7796 by U-Boot.

Right, can you remind me - did we get any conclusion about how to
handle the memory ranges in DTS and the ones from u-boot?

It would be good with a consistent plan how to handle such.

Thanks,

/ magnus
