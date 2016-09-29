Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:35544 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755214AbcI2Gff (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Sep 2016 02:35:35 -0400
Received: by mail-it0-f67.google.com with SMTP id l13so586560itl.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Sep 2016 23:35:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <SG2PR0401MB12961FCFA0E7D9A29DB6276BD8CE0@SG2PR0401MB1296.apcprd04.prod.outlook.com>
References: <SG2PR0401MB12961FCFA0E7D9A29DB6276BD8CE0@SG2PR0401MB1296.apcprd04.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Sep 2016 08:35:32 +0200
Message-ID: <CAMuHMdX9wv2L4NaDWQRHVJP2X2KY_j-XgzBvZ7UtjAZ1Tp5vig@mail.gmail.com>
Subject: Re: LVDS Support in R-Car E2(ALT) Board
To: Jithin T Raj <jithin.t@tataelxsi.co.in>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jithin,

On Thu, Sep 29, 2016 at 6:14 AM, Jithin T Raj <jithin.t@tataelxsi.co.in> wrote:
> I have successfully applied the patch and build R-car M2 Kernel for
> Koelsch Board..now it support LVDS..Thank you all especially Geert and
> Laurent..now i tried the same source tree(v4.7.5) to build for R-Car

Good to hear it works on Koelsch!

> E2(ALT)Board to make LVDS up..but i am getting the following error
> during making .dtb file
>
> ubuntu@teltvm2468l:~/jithin_new/linux-4.7.5$ make -j4 r8a7794-alt.dtb
>   DTC     arch/arm/boot/dts/r8a7794-alt.dtb
> Error: arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi:39.1-16 Label or path lvds_connector not found
> FATAL ERROR: Syntax error parsing input tree
> make[1]: *** [arch/arm/boot/dts/r8a7794-alt.dtb] Error 1
> make: *** [r8a7794-alt.dtb] Error 2
> ubuntu@teltvm2468l:~/jithin_new/linux-4.7.5$
>
> I have included the "#include "r8a77xx-aa104xd12-panel.dtsi" in r8a7794-alt.dts
>
> my source tree is v4.7.5 stable edition

No one has added LVDS support for r8a7794/alt yet.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
