Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:44266 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388696AbeHAOB5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Aug 2018 10:01:57 -0400
Received: by mail-vk0-f68.google.com with SMTP id 125-v6so9159992vke.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Aug 2018 05:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20180730111726.5526-1-marek.vasut+renesas@gmail.com>
In-Reply-To: <20180730111726.5526-1-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Aug 2018 14:16:14 +0200
Message-ID: <CAMuHMdUop4fUTbgh0iCQRWTNz_X49070qPKZc0iJ9xFvhi9RHA@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: gose: Add DA9210 node for CPU DVFS
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

On Mon, Jul 30, 2018 at 1:17 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> Add DA9210 DVFS node to the I2C bus and link it to CPU0 for DVFS.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Thanks for your patch!

Oneline-summary prefix should be "ARM: dts: gose:".

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
