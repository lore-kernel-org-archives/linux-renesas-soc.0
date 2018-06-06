Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:37569 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932103AbeFFGYg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 02:24:36 -0400
MIME-Version: 1.0
In-Reply-To: <20180605231013.1803-1-marek.vasut+renesas@gmail.com>
References: <20180605231013.1803-1-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jun 2018 08:24:35 +0200
Message-ID: <CAMuHMdVR3dE+FW-O+obbXAwYx_meaJmSoQf61rdiQF2YYDZFGw@mail.gmail.com>
Subject: Re: [PATCH v4 01/12] mfd: da9063: Fix failpath in core
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

Hi Marek,

On Wed, Jun 6, 2018 at 1:10 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
> In case mfd_add_devices() fails, da9063_irq_exit() is not called to
> undo the IRQchip setup done by da9063_irq_init(). Fix this by adding
> the missing fail path.

Thanks for your patch!

> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Please retain Reviewed-by tags (from Vaishali and me).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
