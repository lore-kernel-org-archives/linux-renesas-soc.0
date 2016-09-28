Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:35183 "EHLO
        mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750997AbcI1HOZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Sep 2016 03:14:25 -0400
Received: by mail-io0-f179.google.com with SMTP id 92so41272713iol.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Sep 2016 00:14:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <SG2PR0401MB129656CA9F79AA1CE7F384F1D8CF0@SG2PR0401MB1296.apcprd04.prod.outlook.com>
References: <SG2PR0401MB129656CA9F79AA1CE7F384F1D8CF0@SG2PR0401MB1296.apcprd04.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Sep 2016 09:14:23 +0200
Message-ID: <CAMuHMdVhnWMLs5_Bwr4a1Dpqkwixy+_6TyEFmBvdsSazfVtyow@mail.gmail.com>
Subject: Re: LVDS SUPPORT RCAR M2(R8A7791)
To: Jithin T Raj <jithin.t@tataelxsi.co.in>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "laurent.pinchart@ideasonboard.com"
        <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 28, 2016 at 8:43 AM, Jithin T Raj <jithin.t@tataelxsi.co.in> wrote:
> ubuntu@teltvm2468l:~/Jithin/Koelsch/kernel$ make -j4 r8a7791-koelsch.dtb
>   CC      scripts/mod/devicetable-offsets.s
>   GEN     scripts/mod/devicetable-offsets.h
>   HOSTCC  scripts/mod/file2alias.o
>   HOSTLD  scripts/mod/modpost
>   DTC     arch/arm/boot/dts/r8a7791-koelsch.dtb
> Error: arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi:41.4-5 label or path, 'lvds_connector', not found
> FATAL ERROR: Syntax error parsing input tree
> make[1]: *** [arch/arm/boot/dts/r8a7791-koelsch.dtb] Error 1
> make: *** [r8a7791-koelsch.dtb] Error 2

Which source tree are you using?
lvds_connector should be defined in arch/arm/boot/dts/r8a7791-koelsch.dts

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
