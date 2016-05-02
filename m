Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:34208 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752805AbcEBJGa (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 2 May 2016 05:06:30 -0400
Received: by mail-oi0-f42.google.com with SMTP id k142so182369381oib.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 May 2016 02:06:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWxaPOfh-eU9ASTQmrbt74pyoiOT7oSyizvxbZ8zN0g8g@mail.gmail.com>
References: <1461914677-24899-1-git-send-email-geert+renesas@glider.be>
	<CACRpkdayGoAsU2+dOg4Y9BcyOORVp4OmUUCbE_cW5gPzR=D7nw@mail.gmail.com>
	<CAMuHMdW+O-qtrfbfpORX_dWCATZ9goTqQQa_sD9h1Jq=7H9DMA@mail.gmail.com>
	<CACRpkdbtwSmGmCfBLBUi2w9NHkVTLhwg8Q5srMCxNLNjze6msg@mail.gmail.com>
	<CAMuHMdX6Qrx=zjyOgag1wdYVoG-u_kmFz=Kxzs8-mriYe-2y9g@mail.gmail.com>
	<CAMuHMdWxaPOfh-eU9ASTQmrbt74pyoiOT7oSyizvxbZ8zN0g8g@mail.gmail.com>
Date: Mon, 2 May 2016 11:06:29 +0200
Message-ID: <CACRpkdZLSRQfUfc4d=uO0CtH3svN+a17HLbEQYtdy8kMAS_sUA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: Let gpio_chip.to_irq() return -ENXIO on error
From: Linus Walleij <linus.walleij@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 2, 2016 at 11:04 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> [silly response deleted]
>
> Scrap it.

:D

> The only annoying thing is that 0 cannot easily be propagated upstream as
> an error code, so it has to be tested for explicitly.

Well with the Big Penguin's clear opinion on the matter there is not
much we can do.

What about this?

diff --git a/drivers/tty/serial/serial_mctrl_gpio.c
b/drivers/tty/serial/serial_mctrl_gpio.c
index 02147361eaa9..2297ec781681 100644
--- a/drivers/tty/serial/serial_mctrl_gpio.c
+++ b/drivers/tty/serial/serial_mctrl_gpio.c
@@ -172,6 +172,13 @@ struct mctrl_gpios *mctrl_gpio_init(struct
uart_port *port, unsigned int idx)
                        dev_err(port->dev,
                                "failed to find corresponding irq for
%s (idx=%d, err=%d)\n",
                                mctrl_gpios_desc[i].name, idx, ret);
+                       /*
+                        * Satisfy the error code semantics for a missing IRQ,
+                        * 0 means NO_IRQ, but the framework needs to return
+                        * a negative to deal with the error.
+                        */
+                       if (!ret)
+                               ret = -ENOSYS;
                        return ERR_PTR(ret);
                }
                gpios->irq[i] = ret;

Yours,
Linus Walleij
