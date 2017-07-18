Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:33408 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751434AbdGRNKE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jul 2017 09:10:04 -0400
MIME-Version: 1.0
In-Reply-To: <1500380802-26930-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1500380802-26930-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1500380802-26930-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jul 2017 15:10:02 +0200
Message-ID: <CAMuHMdXGEFxzDSWnQyS9_0SauwwVB-anT_EVwsrn4H0TULazSw@mail.gmail.com>
Subject: Re: [PATCH 1/3] usb: gadget: udc: renesas_usb3: fix free size in renesas_usb3_dma_free_prd()
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Tue, Jul 18, 2017 at 2:26 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> The commit 2d4aa21a73ba ("usb: gadget: udc: renesas_usb3: add support
> for dedicated DMAC") has a bug in the renesas_usb3_dma_free_prd().
> The size of dma_free_coherent() should be the same with dma_alloc_coherent()
> Otherwise, this code causes a WARNING by mm/page_alloc.c when
> renesas_usb3_dma_free_prd() is called. So, this patch fixes it.
>
> Fixes: 2d4aa21a73ba ("usb: gadget: udc: renesas_usb3: add support for dedicated DMAC")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
