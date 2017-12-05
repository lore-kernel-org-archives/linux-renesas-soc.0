Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:33648 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751269AbdLEIgN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Dec 2017 03:36:13 -0500
MIME-Version: 1.0
In-Reply-To: <20171204133327.3505-2-thomas.petazzoni@free-electrons.com>
References: <20171204133327.3505-1-thomas.petazzoni@free-electrons.com> <20171204133327.3505-2-thomas.petazzoni@free-electrons.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Dec 2017 09:36:11 +0100
Message-ID: <CAMuHMdXCmYAJKaFEhnrOVEAYEpjs77AGv-j4JgGW2xyt8HjT0g@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: sh_eth: use correct "struct device" when calling
 DMA mapping functions
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
> There are two types of "struct device": the one representing the
> physical device on its physical bus (platform, SPI, PCI, etc.), and
> the one representing the logical device in its device class (net,
> etc.).
>
> The DMA mapping API expects to receive as argument a "struct device"
> representing the physical device, as the "struct device" contains
> information about the bus that the DMA API needs.
>
> However, the sh_eth driver mistakenly uses the "struct device"
> representing the logical device (embedded in "struct net_device")
> rather than the "struct device" representing the physical device on
> its bus.
>
> This commit fixes that by adjusting all calls to the DMA mapping API.
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
