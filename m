Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:45278 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbeKSTXO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 14:23:14 -0500
MIME-Version: 1.0
References: <20181118173327.4704-1-marek.vasut+renesas@gmail.com>
 <20181118230250.GA2553@kunai> <6ffce819-4d8e-e54a-ba82-0845c36a6ec4@gmail.com>
In-Reply-To: <6ffce819-4d8e-e54a-ba82-0845c36a6ec4@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Nov 2018 10:00:02 +0100
Message-ID: <CAMuHMdUjONJYypV0a5wnxyBx+sUMHzRwZObQ=d7xFG2ZSCM3Ag@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77965: Add CAN controller nodes
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marek,

On Mon, Nov 19, 2018 at 12:46 AM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 11/19/2018 12:02 AM, Wolfram Sang wrote:
> > On Sun, Nov 18, 2018 at 06:33:26PM +0100, Marek Vasut wrote:
> >> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >>
> >> This patch adds CAN{0,1} controller nodes for the R8A77965 SoC.
> >>
> >> Based on several similar patches of the R8A7795 device tree
> >> by Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
> >> and Geert Uytterhoeven <geert+renesas@glider.be>.
> >>
> >> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> >> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> >> Cc: Rob Herring <robh@kernel.org>
> >> Cc: Simon Horman <horms+renesas@verge.net.au>
> >> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >> Cc: linux-renesas-soc@vger.kernel.org
> >> Cc: linux-arm-kernel@lists.infradead.org
> >
> > Were you able to do some testing using EXIO connectors? Would be nice to
> > know what was tested.
>
> Not on the M3N, since I don't see it broken out on the EXIO ; is it
> really there ? It'd be easy to test on M3NSK with KF, but I don't have
> either KF or M3NSK.

Please have a look at EXIO Connector D, pins 13/14/15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
