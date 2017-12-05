Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:34484 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751323AbdLEJKU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Dec 2017 04:10:20 -0500
MIME-Version: 1.0
In-Reply-To: <20171204133327.3505-3-thomas.petazzoni@free-electrons.com>
References: <20171204133327.3505-1-thomas.petazzoni@free-electrons.com> <20171204133327.3505-3-thomas.petazzoni@free-electrons.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Dec 2017 10:10:19 +0100
Message-ID: <CAMuHMdV2u26uWGeJFz+f11hUtvM45ax1jbG98JWTcZwGgbrSrg@mail.gmail.com>
Subject: Re: [PATCH 2/2] net: sh_eth: don't use NULL as "struct device" for
 the DMA mapping API
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 4, 2017 at 2:33 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Using NULL as argument for the DMA mapping API is bogus, as the DMA
> mapping API may use information from the "struct device" to perform
> the DMA mapping operation. Therefore, pass the appropriate "struct
> device".
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
