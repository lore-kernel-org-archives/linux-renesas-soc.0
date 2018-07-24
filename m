Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:42978 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388319AbeGXHyI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 03:54:08 -0400
MIME-Version: 1.0
References: <24093fd0-1b9b-a211-f988-0272483185d6@cogentembedded.com> <6a15eddc-a30d-a4e8-aa0d-05ee2091e32a@cogentembedded.com>
In-Reply-To: <6a15eddc-a30d-a4e8-aa0d-05ee2091e32a@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Jul 2018 08:49:00 +0200
Message-ID: <CAMuHMdUmTe6VTka5XMDmFH0Myd502ThOcYEj6D61GsB8UGTBwQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] sh_eth: call sh_eth_tsu_get_offset() from TSU
 register accessors
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Mon, Jul 23, 2018 at 8:13 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> With sh_eth_tsu_get_offset() now actually returning TSU register's offset,
> we  can at last use it in sh_eth_tsu_{read|write}(). Somehow this saves 248
> bytes of object code with AArch64 gcc 4.8.5... :-)

Adding two more users may be the trigger for gcc not to inline the
function anymore?

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
