Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:36311 "EHLO
        mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751646AbeB1InT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Feb 2018 03:43:19 -0500
Received: by mail-qk0-f169.google.com with SMTP id d206so2010913qkb.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Feb 2018 00:43:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180226101718.5353-1-marek.vasut+renesas@gmail.com>
References: <20180226101718.5353-1-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Feb 2018 09:43:18 +0100
Message-ID: <CAMuHMdU=S2RbnzkGcyHd9iNke4tiY8D8P9XnFdSoJD5TN3oOaA@mail.gmail.com>
Subject: Re: [RFC][PATCH] ARM: shmobile: Rework the PMIC IRQ line quirk
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marek,

On Mon, Feb 26, 2018 at 11:17 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
> Rather than hard-coding the quirk topology, which stopped scaling,
> parse the information from DT. The code looks for all compatible
> PMICs -- da9036 and da9210 -- and checks if their IRQ line is tied
> to the same pin. If so, the code sends a matching sequence to the
> PMIC to deassert the IRQ.

Note that not all R-Car Gen2 boards have all regulators described in DT yet.
E.g. gose lacks da9210. So that has to be fixed first.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
