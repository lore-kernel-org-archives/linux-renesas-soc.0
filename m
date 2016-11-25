Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34939 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751021AbcKYJXG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Nov 2016 04:23:06 -0500
Received: by mail-wm0-f68.google.com with SMTP id a20so7197385wme.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Nov 2016 01:23:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CANqRtoTTsg-QLZSY3fe8qm1zKa6GZAtCE2z-DyDEuHpCx1pGpA@mail.gmail.com>
References: <1476740091-7011-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <CANqRtoRdvxgXvbLUGtUGZmeochHc2f7-MDT0Ft_X26jkSDM1Fw@mail.gmail.com>
 <1850959.FHUakZUkzN@avalon> <6140360.DygU3qqRMK@avalon> <CANqRtoTN+=-u2GCYiOtPXo1UGu2J8qkV0OYRVPsULb6qEBUgCA@mail.gmail.com>
 <CAMuHMdXGttxjc=VicxJ5xhf0giuxp=KiQwy9xh7cVBL-NCGXRw@mail.gmail.com>
 <CANqRtoSSgrD3iQZfQuo=COkFt5K+akmOgQAdvNAdEtRVOsoiuw@mail.gmail.com>
 <CAMuHMdUB45+TuFyAfKk8MxpfnkrEHb2hUAnEowdrZnUbavuxOQ@mail.gmail.com> <CANqRtoTTsg-QLZSY3fe8qm1zKa6GZAtCE2z-DyDEuHpCx1pGpA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Nov 2016 10:22:59 +0100
Message-ID: <CAMuHMdWVvdkdrUTNU+JsJp7yak2baCDyS2=k6YMD1CCrYN5r3A@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r8a7796: Add DU device to DT
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

(this time with CC kept)

On Fri, Nov 25, 2016 at 9:16 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> On Mon, Nov 21, 2016 at 8:09 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Thu, Nov 17, 2016 at 9:51 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
>>> On Thu, Nov 17, 2016 at 5:31 PM, Geert Uytterhoeven
>>> <geert@linux-m68k.org> wrote:
>>>> On Thu, Nov 17, 2016 at 3:28 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
>>>>> First of all, we might have slightly different view of the hardware,
>>>>> so this might need some further discussions. Also, this topic in my
>>>>> mind is mainly about DT integration code merge ordering for r8a7796 to
>>>>> enable >4GB memory access early on without introducing any potential
>>>>> issues.
>>>>
>>>> Note that >4GB memory is already enabled on r8a7796 by U-Boot.
>>>
>>> Right, can you remind me - did we get any conclusion about how to
>>> handle the memory ranges in DTS and the ones from u-boot?
>>>
>>> It would be good with a consistent plan how to handle such.
>>
>> I think we should just apply "arm64: dts: r8a7796: salvator-x: Update memory
>> node to 4 GiB map".
>
> I guess that we cannot control what u-boot will pass to us, but with
> the patch above at least we have some chance of having a consistent
> memory map.

Indeed.

>> IMHO it doesn't make much sense to pretend the memory is not present nor
>> enabled.
>
> Enabling all the memory makes sense at this point, but I'd like us to
> keep considering performance of bounce buffers and/or IPMMU when
> merging different on-chip devices that may not support addressing of
> the full physical memory space.
>
> We earlier had issues with "enable-and-forget" development approach in
> case of USB host over on-chip PCI for the R-Car Gen2 family of
> devices. In that case the hardware was unable to do bus mastering to
> all the memory but this was not considered as part of the upstreaming
> plan and instead came as a nasty surprise later on. So for each device
> that we develop code for and integrate i would like to make sure that
> we understand how memory handling is supposed to work and what
> potential workarounds we may have to use.

Sure.

All existing devices in r8a7796.dtsi in Simon's tree either use PIO, or DMA
through SYS-DMAC. The latter supports 64-bit addressing hardware-wise,
but the software side needs a patch to enable that, cfr. "[PATCH/RFC 5/5]
dmaengine: rcar-dmac: Widen DMA mask to 40 bits".
Without that, it still works, but using swiotlb bounce buffers.

Once that's fixed, there are no performance deteriorations due to bounce
buffers, with the current set of enabled devices.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
