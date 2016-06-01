Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:36378 "EHLO
	mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753885AbcFAI0u (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 04:26:50 -0400
Received: by mail-it0-f65.google.com with SMTP id i127so2014940ita.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jun 2016 01:26:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <653cbab7-e7d7-476f-62b1-e9479827cfbb@de.bosch.com>
References: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
	<CAMuHMdWoBv-13eNMr_ymtmRo-LPdznarRMyXFw0pG7xF_07A6A@mail.gmail.com>
	<c0890925-f003-8aa5-22fd-315229593037@de.bosch.com>
	<CANqRtoSHkH2N6_UJ_mjij9k3GaAsSBDuUxjTTLZryHzy74Sh1Q@mail.gmail.com>
	<eccba76d-465c-ca86-bda2-1f0ededc6918@de.bosch.com>
	<CANqRtoR5008j-W2wbz2oVkYZv=-P4j6OZMQGz2fTXO1PwSeCtw@mail.gmail.com>
	<426527f7-d1fe-8574-7f25-66298bb55eab@de.bosch.com>
	<CAMuHMdVFZcb0VnM6E971q08c5qzJn2+dOhqv9VL9zvb0T9ocAQ@mail.gmail.com>
	<653cbab7-e7d7-476f-62b1-e9479827cfbb@de.bosch.com>
Date: Wed, 1 Jun 2016 10:26:49 +0200
Message-ID: <CAMuHMdWVM7dD90wcJQyx6d39DOoRmXUHGXwY54du6Ypm3qEejw@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: Renesas: R-Car3: Add product register support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Wed, Jun 1, 2016 at 9:38 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> Sorry, if that was unclear. I took the example and transferred it to R-Car3
> where we have ES1 - ES3.
>
> So, taking this example, on R-Car3 we might end up with
>
>         {
>                 .compatible = "renesas,sata-r8a7795",
>                 .data = (void *)RCAR_GEN2_SATA
>         },
>         {
>                 .compatible = "renesas,sata-r8a7795-es1",
>                 .data = (void *)RCAR_R8A7795_ES1_SATA
>         },
>         {
>                 .compatible = "renesas,sata-r8a7795-es2",
>                 .data = (void *)RCAR_R8A7795_ES2_SATA
>         },
>         {
>                 .compatible = "renesas,sata-r8a7795-es3",
>                 .data = (void *)RCAR_R8A7795_ES3_SATA
>         },

Are there known differences in the SATA implementations on R-Car H3 ES1, ES2,
and ES3? If not, just "renesas,sata-r8a7795" will do.

BTW having different compatible values in the driver makes it much easier to
audit kernel sources for support for ESx deviations.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
