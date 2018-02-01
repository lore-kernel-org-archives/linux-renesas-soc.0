Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:43280 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754957AbeBAU1O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Feb 2018 15:27:14 -0500
MIME-Version: 1.0
In-Reply-To: <1eb6b81c-500e-ef21-7c21-e8bc7a1ff227@cogentembedded.com>
References: <1eb6b81c-500e-ef21-7c21-e8bc7a1ff227@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Feb 2018 21:27:12 +0100
Message-ID: <CAMuHMdWeN8hf3rxHRofn9rD3MKD4rcPVVNM3W3+7nBatmUvxjw@mail.gmail.com>
Subject: Re: [PATCH] DT: net: renesas,ravb: document R8A77980 bindings
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, netdev <netdev@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 1, 2018 at 9:13 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Renesas R-Car V3H (R8A77980) SoC has the R-Car gen3 compatible EtherAVB
> device, so document the SoC specific bindings.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
