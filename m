Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:35949 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S944040AbdDTJhC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2017 05:37:02 -0400
MIME-Version: 1.0
In-Reply-To: <1612430.SNEha5n02K@avalon>
References: <1490362665-4422-1-git-send-email-geert+renesas@glider.be>
 <1490362665-4422-2-git-send-email-geert+renesas@glider.be> <1612430.SNEha5n02K@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Apr 2017 11:36:59 +0200
Message-ID: <CAMuHMdXOzyo+kzaGAXp+jZTtUejYyXCQzezo+SmvNVQuEC9=_Q@mail.gmail.com>
Subject: Re: [PATCH/RFC v2 1/2] arm64: dts: r8a7795: Add support for R-Car H3 ES2.0
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Mon, Mar 27, 2017 at 10:48 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Friday 24 Mar 2017 14:37:44 Geert Uytterhoeven wrote:
>> Update r8a7795.dtsi so it corresponds to R-Car H3 ES2.0 or later:
>>   - The following devices no longer exist on ES2.0, and are thus removed:
>>     fcpf2, fcpvd3, fcpvi2, fdp1-2, usb3-if1, vspd3, vspi2.
>>   - The DU <-> VSPD topology is different on ES2.0, hence remove the
>>     "vsps" property from the DU node until the driver can handle this.
>
> I think I'll need a different compatible string between ES1.x and ES2 for the
> DU. It could make sense to move the whole DU node to *-es1.dtsi. We can decide
> about that later when I'll have a DU driver prototype ready.

Why would you need a different compatible string?
Can't you use soc_device_match() to handle ES1.x SoCs?

The different DU <-> VSPD topology is handled through the vsps property in DTS.
Are the ports different, too? That can be handled in DTS.

The main reason why I kept the DU node in r8a7795.dtsi is that the board DTS
refers to it.  Sharing board DTS means there needs to be at least a
placeholder node for the DU in r8a7795.dtsi, unless you want to keep on
shuffling board overrides around.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
