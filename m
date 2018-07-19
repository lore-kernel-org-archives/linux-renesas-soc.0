Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:38038 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732003AbeGSS1E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jul 2018 14:27:04 -0400
Received: by mail-ua0-f193.google.com with SMTP id o11-v6so5749366uak.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jul 2018 10:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <153200105784.13504.12882377600823578834.sendpatchset@little-apple>
 <153200106718.13504.7319401547888522726.sendpatchset@little-apple>
 <f7dad4b7-d1d6-3fcc-750d-deffc0e26717@cogentembedded.com> <CANqRtoQiyxrBwmNEZcDjMfR3ZPH-XfmXjJe0eCuvRE_zB0QKOw@mail.gmail.com>
In-Reply-To: <CANqRtoQiyxrBwmNEZcDjMfR3ZPH-XfmXjJe0eCuvRE_zB0QKOw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jul 2018 19:42:40 +0200
Message-ID: <CAMuHMdUh+EteHBVEG9ByHGiAdqQu8UbqNmkqYrncrEn3H7PG0g@mail.gmail.com>
Subject: Re: [PATCH/RFC 01/02] ravb: Do not announce 100Mbps HDX as supported
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Thu, Jul 19, 2018 at 7:25 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> On Thu, Jul 19, 2018 at 11:32 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > On 07/19/2018 02:51 PM, Magnus Damm wrote:
> >> From: Magnus Damm <damm+renesas@opensource.se>
> >>
> >> According to the data sheet the Ethernet-AVB hardware in R-Car Gen3
> >> and R-Car Gen2 SoCs do not support half duplex operation. So update
> >> the driver to mark 100Mbit HDX as unsupported.
> >
> >    What about 1000Mbit HDX?
>
> For Twister Pair I believe 10 and 100 Mbps come in HDX and FDX flavors
> while 1 Gbps is HDX-only.

 1 Gbps is _F_DX-only?

> https://en.wikipedia.org/wiki/Ethernet_over_twisted_pair

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
