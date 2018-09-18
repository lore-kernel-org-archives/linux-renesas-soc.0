Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f195.google.com ([209.85.221.195]:34210 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727140AbeIRMpi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Sep 2018 08:45:38 -0400
MIME-Version: 1.0
References: <20180917182623.29221-1-chris.brandt@renesas.com>
In-Reply-To: <20180917182623.29221-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Sep 2018 09:14:10 +0200
Message-ID: <CAMuHMdUtAGM1ZK-Hw-uFwrv2f+jgWoYz-yM1Gd44-6sSCOxkFA@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Add earlycon for R7S9210
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 17, 2018 at 8:26 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Since the register offsets are different for RZ/A2 SCIF, we need
> to declare a separate string for it.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
