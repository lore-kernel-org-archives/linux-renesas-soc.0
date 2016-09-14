Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f45.google.com ([209.85.214.45]:37106 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755671AbcINNVo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2016 09:21:44 -0400
Received: by mail-it0-f45.google.com with SMTP id 186so23251803itf.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2016 06:21:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB1165DA353BCD0325E83D207D8AF10@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <SG2PR06MB1165DA353BCD0325E83D207D8AF10@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Sep 2016 15:21:42 +0200
Message-ID: <CAMuHMdUFbaFxLFhFwCYGX=6NMBK-rYt6Y7o9CgAK=dAbBp9cVg@mail.gmail.com>
Subject: Re: How to put an 'if' statement in a dts?
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Wed, Sep 14, 2016 at 2:35 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On the RZ/A1 RSK board, the one card slot can be used for SDHI or MMC (SDHI1 and MMC share the same pins).
>
> For the r7s72100-rskrza1.dts, I would like to add in support for both SDHI1 and MMC for someone to use as reference. Of course they should only pick one.
>
> So my options are:
>
> A) Make some type of an 'if' statement in the dts that can be selected at boot time

Ugh, doesn't sound right.

> B) Leave one as 'status = "disabled"', and then the user just has to switch around the 'status' properties before boot (either modify the dts file or change it in u-boot with the fdt command)

I take it you can actually use both SDHI or MMC on RSK, without
changing a jumper?

> C) Pick one and forget about the other (because you're not allowed to have inactive nodes in your board dts files)

Probably SDHI is the best performing option?

You could also provide a DT overlay for switching to MMC.
But upstream DT overlay support is incomplete.
Cfr. http://elinux.org/R-Car/DT-Overlays

> The MMC also needs a 3.3v "regulator-fixed" node, so it would be nice to put that in the 'if' statement too, but since the dts for the rskrza1 board is mostly for reference, it's not a big deal if that one is just always active.

On Genmai, the regulator setup is more complex (seem to support both
3.3V and 5V),
so if we add support for that, there's a second example.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
