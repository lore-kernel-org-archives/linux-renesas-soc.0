Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:38378 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752633AbeF2ObC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Jun 2018 10:31:02 -0400
MIME-Version: 1.0
References: <20180629142513.20743-1-geert+renesas@glider.be> <20180629142513.20743-6-geert+renesas@glider.be>
In-Reply-To: <20180629142513.20743-6-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 Jun 2018 16:30:49 +0200
Message-ID: <CAMuHMdXBsdkmcakVrLcBgMYD2ULD+nY7y5mKDWm3PN-nJQVw-w@mail.gmail.com>
Subject: Re: [PATCH 2/4] serial: sh-sci: Stop using deprecated dmaengine_terminate_all()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg KH <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jun 29, 2018 at 4:25 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> As of commit b36f09c3c441a6e5 ("dmaengine: Add transfer termination
> synchronization support"), dmaengine_terminate_all() is deprecated.
>
> Replace calls to dmaengine_terminate_all() in DMA release code by calls
> to dmaengine_terminate_sync(), as the latter waits until all running
> completion callbacks have finished.
>
> Replace calls to dmaengine_terminate_all() in DMA failure paths by calls
> to dmaengine_terminate_async(), as these are usually done in atomic
> context.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/tty/serial/sh-sci.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 898c1034cad23a88..061660ccf9442d02 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1613,7 +1613,7 @@ dev_dbg_dma(port->dev, "%s\n", __func__);
>         s->chan_rx_saved = s->chan_rx = NULL;
>         s->cookie_rx[0] = s->cookie_rx[1] = -EINVAL;
>  WARN(!chan, "RX DMA channel already released\n");

Woops, I had some old versions of the patches lying around, and accidentally
sent them with the real series.

Sorry for that, the "[x/4]" patches should be ignored.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
