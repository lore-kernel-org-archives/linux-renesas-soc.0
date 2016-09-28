Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:35829 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751521AbcI1IwI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Sep 2016 04:52:08 -0400
Received: by mail-io0-f180.google.com with SMTP id 92so45188279iol.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Sep 2016 01:52:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <SG2PR0401MB12962EFA3F1287EBE29D42DAD8CF0@SG2PR0401MB1296.apcprd04.prod.outlook.com>
References: <SG2PR0401MB12962EFA3F1287EBE29D42DAD8CF0@SG2PR0401MB1296.apcprd04.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Sep 2016 10:52:06 +0200
Message-ID: <CAMuHMdVgx-vPp2g9YwRc-XA6wsgDWKXJQo_f4eL=MaJRGQWiHA@mail.gmail.com>
Subject: Re: LVDS SUPPORT RCAR M2
To: Jithin T Raj <jithin.t@tataelxsi.co.in>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jithin,

On Wed, Sep 28, 2016 at 10:10 AM, Jithin T Raj <jithin.t@tataelxsi.co.in> wrote:
>       Thank you for the information  Actually i am a newby in this field..i have an RCAR M2 koelsch board  with me and  i am trying to up the lvds support in that..
> I have "r8a77xx-aa104xd12-panel.dtsi" in arch/arm/boot/dts/...
> when i checked the arch/arm/boot/dts/r8a7791-koelsch.dts file,it does not contain lvds connector definition..can anyone please help me to define the same in arch/arm/boot/dts/r8a7791-koelsch.dts

Which source tree are you using?

Have you added the line

    #include "r8a77xx-aa104xd12-panel.dtsi"

to arch/arm/boot/dts/r8a7791-koelsch.dts yourself?
At the end of the file?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
