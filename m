Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:36447 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751396AbdGRNMU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jul 2017 09:12:20 -0400
MIME-Version: 1.0
In-Reply-To: <1500380802-26930-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1500380802-26930-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1500380802-26930-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jul 2017 15:12:18 +0200
Message-ID: <CAMuHMdXwqVcAEq+r5BOSrHhOQZiLpTkUQtgCThdMDTQhiovZjQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] usb: gadget: udc: renesas_usb3: protect
 usb3_ep->started in usb3_start_pipen()
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 18, 2017 at 2:26 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch fixes an issue that unexpected behavior happens when
> both the interrupt handler and renesas_usb3_ep_enable() are called.
> In this case, since usb3_start_pipen() checked the usb3_ep->started,
> but the flags was not protected. So, this patch protects the flag
> by usb3->lock. Since renesas_usb3_ep_enable() for EP0 will be not called,
> this patch doesn't take care of usb3_start_pipe0().
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
