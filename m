Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f196.google.com ([209.85.221.196]:38033 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728388AbeKOSo6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Nov 2018 13:44:58 -0500
MIME-Version: 1.0
References: <874ledyrc6.wl-kuninori.morimoto.gx@renesas.com> <1bfdc10a-41e9-2a1f-b944-a8816186e998@pengutronix.de>
In-Reply-To: <1bfdc10a-41e9-2a1f-b944-a8816186e998@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Nov 2018 09:37:53 +0100
Message-ID: <CAMuHMdWgX=BxPLuYv2NJaBgqSbvJYfmo+WTQf-42m00bsYNhvw@mail.gmail.com>
Subject: Re: [PATCH resend] can: rcar_can: convert to SPDX identifiers
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>, linux-can@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marc,

On Thu, Sep 27, 2018 at 11:05 AM Marc Kleine-Budde <mkl@pengutronix.de> wrote:
> On 09/26/2018 03:41 AM, Kuninori Morimoto wrote:
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >
> > This patch updates license to use SPDX-License-Identifier
> > instead of verbose license text.
> >
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>
> Wolfram Sang has already supplied a similar patch, but not for Makefile
> and Kconfig. I've applied your patch for Makefile and Kconfig and
> adjusted the commit message accordingly.

Is it possible all of this fell through the cracks? There's no SPDX to be found
in drivers/net/can/rcar/ in next-20181115?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
