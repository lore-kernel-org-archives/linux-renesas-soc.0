Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:36403 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752933AbcI3JBG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Sep 2016 05:01:06 -0400
Received: by mail-it0-f43.google.com with SMTP id u134so32946070itb.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Sep 2016 02:01:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <SG2PR0401MB1296B711E2F1042146BBD155D8C10@SG2PR0401MB1296.apcprd04.prod.outlook.com>
References: <SG2PR0401MB1296B711E2F1042146BBD155D8C10@SG2PR0401MB1296.apcprd04.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Sep 2016 11:01:04 +0200
Message-ID: <CAMuHMdU-A-NsgKuRBLh50Mob5C5S09vtyHAjbDiBNYfuBygqdg@mail.gmail.com>
Subject: Re: LVDS IF connector (R-Car E2) RTPORC7794SEB00011S ALT Board
To: Jithin T Raj <jithin.t@tataelxsi.co.in>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "laurent.pinchart@ideasonboard.com"
        <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jithin,

On Fri, Sep 30, 2016 at 10:46 AM, Jithin T Raj <jithin.t@tataelxsi.co.in> wrote:
>    I have an  (R-Car E2) RTPORC7794SEB00011S ALT Board with me ..On that I
> can see a "LVDS IF" Output at the back side..is it same as LVDS?then how

IF = Interface, so I assume yes ;-)

> can i make it work on that Board

As Laurent already told you, please look how it's handled on Marzen.
Marzen uses a thc63lvdm83d RGB-LVDS bridge, while ALT uses a
thc63lvdm87.

References:
  - arch/arm/boot/dts/r8a7779-marzen.dts
  - drivers/gpu/drm/rcar-du/rcar_du_kms.c

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
