Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:34221 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424431AbdD1He4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Apr 2017 03:34:56 -0400
MIME-Version: 1.0
In-Reply-To: <20170427191045.21199-1-chris.brandt@renesas.com>
References: <20170427191045.21199-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Apr 2017 09:34:54 +0200
Message-ID: <CAMuHMdXEtefpaUJbbJ7LYjYR2oHaE-epy=eZnAyE-+=GWsy9xg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r7s72100: add usb clocks to device tree
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 27, 2017 at 9:10 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> This adds the USB0 and USB1 clocks to the device tree.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Simon: see Section 29.3.2 (BUSWAIT) for the reference to the P1 clock.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
