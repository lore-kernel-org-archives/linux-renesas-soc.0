Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:35994 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752911AbdLEKmb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Dec 2017 05:42:31 -0500
MIME-Version: 1.0
In-Reply-To: <4c0c70ac-6db2-7c8a-4e5e-9364919e5012@cogentembedded.com>
References: <20171204141744.18599-1-thomas.petazzoni@free-electrons.com>
 <20171204141744.18599-2-thomas.petazzoni@free-electrons.com> <4c0c70ac-6db2-7c8a-4e5e-9364919e5012@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Dec 2017 11:42:30 +0100
Message-ID: <CAMuHMdVvT_Vk+a99Jdxbr7wo7qKV_9FMk_zGHcfE47ofJSP4FA@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: sh_eth: add support for SH7786
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        "David S. Miller" <davem@davemloft.net>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 4, 2017 at 5:56 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 12/04/2017 05:17 PM, Thomas Petazzoni wrote:
>
>> This commit adds the sh_eth_cpu_data structure that describes the
>> SH7786 variant of the IP.
>
>
>    The manual seems to be unavailable, so I have to trust you. :-)

Google rej09b0501_7786hm.pdf

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
