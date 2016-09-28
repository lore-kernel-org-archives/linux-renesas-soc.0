Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:32990 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753296AbcI1J1P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Sep 2016 05:27:15 -0400
Received: by mail-io0-f177.google.com with SMTP id r145so47666846ior.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Sep 2016 02:27:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <SG2PR0401MB12965FC668CE489CB4E22F54D8CF0@SG2PR0401MB1296.apcprd04.prod.outlook.com>
References: <SG2PR0401MB12965FC668CE489CB4E22F54D8CF0@SG2PR0401MB1296.apcprd04.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Sep 2016 11:27:13 +0200
Message-ID: <CAMuHMdWbDmXN8mv-de-Mkkb_Vz+zJQ6hFDsPNKCK8OSE46_WdA@mail.gmail.com>
Subject: Re: LVDS SUPPORT RCAR
To: Jithin T Raj <jithin.t@tataelxsi.co.in>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jithin,

On Wed, Sep 28, 2016 at 11:05 AM, Jithin T Raj <jithin.t@tataelxsi.co.in> wrote:
> I am using 3.10.31-ltsi ..i have already added the specified line at the end of r8a7791.dts.

LVDS support for Koelsch was only added to v3.19, and not backported
to 3.10.31-ltsi.

Please use a newer kernel version. E.g. v4.7, or v4.1.17-ltsi.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
