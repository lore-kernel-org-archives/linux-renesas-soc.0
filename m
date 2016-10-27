Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:34283 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934351AbcJ0Nt4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 09:49:56 -0400
Received: by mail-oi0-f68.google.com with SMTP id p136so4614409oic.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Oct 2016 06:49:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANqRtoQ1EXM5nFu=siA+oXWZAh8vQkCA4N2xoY0DyzVEFDM65Q@mail.gmail.com>
References: <20161027102856.26426.48132.sendpatchset@little-apple>
 <20161027102915.26426.82003.sendpatchset@little-apple> <CAMuHMdXh+h+GTrhNKk0qahbGN2YTZokERvp23vCPVTLKpgxwBA@mail.gmail.com>
 <CANqRtoQ1EXM5nFu=siA+oXWZAh8vQkCA4N2xoY0DyzVEFDM65Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Oct 2016 13:14:53 +0200
Message-ID: <CAMuHMdV_Dpsqwy12bKCJ9vrmU94+-U3hT0ATxc8_CWZKwCUOEw@mail.gmail.com>
Subject: Re: [PATCH 02/04] arm64: dts: r8a7795: Hook up SYS-DMAC to IPMMU
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Joerg Roedel <joro@8bytes.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Thu, Oct 27, 2016 at 1:07 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
> On Thu, Oct 27, 2016 at 7:42 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Thu, Oct 27, 2016 at 12:29 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
>>> From: Magnus Damm <damm+renesas@opensource.se>
>>>
>>> Hook up r8a7795 DMAC nodes to IPMMU-MP1, IPMMU-DS0 and IPMMU-DS1.
>>>
>>> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>>> ---
>>>
>>>  This patch can be merged any time, but it is however not recommended
>>>  to enable IPMMU-MP1, IPMMU-DS0 or IPMMU-DS1 until various dependencies
>>>  have been resolved:
>>
>> Forgive my ignorance, but how does the driver core treat devices with
>> iommus properties pointing to disabled IOMMU nodes?
>> Is this ignored silently, or does this cause -EPROBEDEFER, like for clocks
>> and power-domains?
>
> Not sure about current state of the driver core to be honest. Earlier
> I needed to add a local workaround in the ->xlate() callback in the
> IPMMU driver but I need to revisit to see if that needs to be updated.
> Any ideas?
>
> I do however know that the IPMMU driver stack included in
> renesas-drivers works both with and without iommus properties and in
> case an iommus property is used then both enabled and disabled are
> known to work.
>
> Looking at mainline, at this point the IPMMU driver changes for
> r8a7795 and r8a7796 are not included yet, so there is no driver code
> that will match with the DT compat string. Once we queue up the IPMMU
> driver code for merge then we need to make sure it still works as
> expected.

Not finding a driver for a compat string and a disabled node should behave
the same (although we had issues in the past where the disabled was ignored).

> I just booted r8a7795 Salvator-X with these patches on top of
> renesas-devel-20161024-v4.9-rc2 (that lacks the IPMMU driver for
> r8a7795) and the DU device that is connected via FCP and VSP operate
> as usual. So all seems fine what I can tell.

Thanks for checking!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
