Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:35257 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754024AbeEWMFe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 May 2018 08:05:34 -0400
MIME-Version: 1.0
In-Reply-To: <20180523114230.10109-5-marek.vasut+renesas@gmail.com>
References: <20180523114230.10109-1-marek.vasut+renesas@gmail.com> <20180523114230.10109-5-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 May 2018 14:05:33 +0200
Message-ID: <CAMuHMdVzNgaS6cnuW0x-mNK4vF3-9Ry+0GNZ3fYjjSUapeZW7A@mail.gmail.com>
Subject: Re: [PATCH 5/6] mfd: da9063: Handle less LDOs on DA9063L
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 23, 2018 at 1:42 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> Move the LDOs present only on DA9063 at the end of the list, so that
> the DA9063L can simply indicate less LDOs and still share the list of
> regulators with DA9063.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
