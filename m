Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:35175 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751807AbdGEKSD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2017 06:18:03 -0400
MIME-Version: 1.0
In-Reply-To: <20170627173152.532417992@cogentembedded.com>
References: <20170627173152.532417992@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jul 2017 12:18:01 +0200
Message-ID: <CAMuHMdV9o0HhZgJS2cyWPmsdqgRmXpjSfKrKQMN=x5VTpXZoUw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: r8a7795: add IMR-LX4 support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Konstantin Kozhevnikov
        <Konstantin.Kozhevnikov@cogentembedded.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Tue, Jun 27, 2017 at 7:30 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Describe the IMR-LX4 devices in the R8A7795 device tree.
>
> Based on the original (and large) patch by Konstantin Kozhevnikov
> <Konstantin.Kozhevnikov@cogentembedded.com>.
>
> Signed-off-by: Konstantin Kozhevnikov <Konstantin.Kozhevnikov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> ---
> This patch is against the 'renesas-devel-20170626-v4.12-rc7' tag of Simon
> Horman's 'renesas.git' repo.
>
> The IMR-LX4 bindings were documented in the IMR driver patch and ACK'ed by Rob
> Herring, so I don't expect them to change...
>
> Changes in version 2:
> - added SoC specific "compatible" prop values;
> - refreshed the patch;
> - added Geert's tag.

In the mean time, r8a7795.dtsi gained reset controller support, so
you should add "resets" properties were appropriate.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
