Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:36741 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937392AbcJ0PkC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 11:40:02 -0400
Received: by mail-lf0-f67.google.com with SMTP id b75so2160253lfg.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Oct 2016 08:40:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXh+h+GTrhNKk0qahbGN2YTZokERvp23vCPVTLKpgxwBA@mail.gmail.com>
References: <20161027102856.26426.48132.sendpatchset@little-apple>
 <20161027102915.26426.82003.sendpatchset@little-apple> <CAMuHMdXh+h+GTrhNKk0qahbGN2YTZokERvp23vCPVTLKpgxwBA@mail.gmail.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 27 Oct 2016 20:07:09 +0900
Message-ID: <CANqRtoQ1EXM5nFu=siA+oXWZAh8vQkCA4N2xoY0DyzVEFDM65Q@mail.gmail.com>
Subject: Re: [PATCH 02/04] arm64: dts: r8a7795: Hook up SYS-DMAC to IPMMU
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Joerg Roedel <joro@8bytes.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Thu, Oct 27, 2016 at 7:42 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Magnus,
>
> On Thu, Oct 27, 2016 at 12:29 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> Hook up r8a7795 DMAC nodes to IPMMU-MP1, IPMMU-DS0 and IPMMU-DS1.
>>
>> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>> ---
>>
>>  This patch can be merged any time, but it is however not recommended
>>  to enable IPMMU-MP1, IPMMU-DS0 or IPMMU-DS1 until various dependencies
>>  have been resolved:
>
> Forgive my ignorance, but how does the driver core treat devices with
> iommus properties pointing to disabled IOMMU nodes?
> Is this ignored silently, or does this cause -EPROBEDEFER, like for clocks
> and power-domains?

Not sure about current state of the driver core to be honest. Earlier
I needed to add a local workaround in the ->xlate() callback in the
IPMMU driver but I need to revisit to see if that needs to be updated.
Any ideas?

I do however know that the IPMMU driver stack included in
renesas-drivers works both with and without iommus properties and in
case an iommus property is used then both enabled and disabled are
known to work.

Looking at mainline, at this point the IPMMU driver changes for
r8a7795 and r8a7796 are not included yet, so there is no driver code
that will match with the DT compat string. Once we queue up the IPMMU
driver code for merge then we need to make sure it still works as
expected.

I just booted r8a7795 Salvator-X with these patches on top of
renesas-devel-20161024-v4.9-rc2 (that lacks the IPMMU driver for
r8a7795) and the DU device that is connected via FCP and VSP operate
as usual. So all seems fine what I can tell.

Thanks,

/ magnus
