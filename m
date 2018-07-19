Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:46720 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727615AbeGSUy0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jul 2018 16:54:26 -0400
Received: by mail-vk0-f65.google.com with SMTP id b14-v6so5011126vke.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jul 2018 13:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <153200105784.13504.12882377600823578834.sendpatchset@little-apple>
 <153200106718.13504.7319401547888522726.sendpatchset@little-apple>
 <f7dad4b7-d1d6-3fcc-750d-deffc0e26717@cogentembedded.com> <CANqRtoQiyxrBwmNEZcDjMfR3ZPH-XfmXjJe0eCuvRE_zB0QKOw@mail.gmail.com>
 <CAMuHMdUh+EteHBVEG9ByHGiAdqQu8UbqNmkqYrncrEn3H7PG0g@mail.gmail.com> <19a353c1-34bb-ab61-8ace-c664f9764fd5@cogentembedded.com>
In-Reply-To: <19a353c1-34bb-ab61-8ace-c664f9764fd5@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jul 2018 22:09:31 +0200
Message-ID: <CAMuHMdUCrinbjiUpjQ92+h5Abac6_PAMyaCyRHjTVX1H+-tXGA@mail.gmail.com>
Subject: Re: [PATCH/RFC 01/02] ravb: Do not announce 100Mbps HDX as supported
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Thu, Jul 19, 2018 at 7:56 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 07/19/2018 08:42 PM, Geert Uytterhoeven wrote:
> >>>> From: Magnus Damm <damm+renesas@opensource.se>
> >>>> According to the data sheet the Ethernet-AVB hardware in R-Car Gen3
> >>>> and R-Car Gen2 SoCs do not support half duplex operation. So update
> >>>> the driver to mark 100Mbit HDX as unsupported.
> >>>
> >>>    What about 1000Mbit HDX?
> >>
> >> For Twister Pair I believe 10 and 100 Mbps come in HDX and FDX flavors
> >> while 1 Gbps is HDX-only.
> >
> >  1 Gbps is _F_DX-only?
>
>    No, only higher speeds are FDX only.
>
> >> https://en.wikipedia.org/wiki/Ethernet_over_twisted_pair

That wiki page says "However, half-duplex operation for gigabit speed isn't
supported by any existing hardware.".
Running ethtool on a few systems shows that some of them don't support it, while
others do.

I don't have any higher speed Ethernet cards yet (do you? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
