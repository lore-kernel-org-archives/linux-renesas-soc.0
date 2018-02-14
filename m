Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f177.google.com ([209.85.220.177]:38141 "EHLO
        mail-qk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934803AbeBNJO5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 04:14:57 -0500
Received: by mail-qk0-f177.google.com with SMTP id s198so9710369qke.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2018 01:14:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180213232812.31408-1-marek.vasut+renesas@gmail.com>
References: <20180213232812.31408-1-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2018 10:14:56 +0100
Message-ID: <CAMuHMdX625D9+U1r_OnQyhwrtMBz-kdc-xtoLMtjv+Gk84p+zQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: stout: enable R-Car Gen2 regulator quirk
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marek,

On Wed, Feb 14, 2018 at 12:28 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
> Regulator setup is suboptimal on H2 Stout too.

Worse, Stout has 2 DA9210 regulators, so you have to add a check for a
DA9210 at address 0x70.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
