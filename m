Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:32807 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751266AbdBAMiq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2017 07:38:46 -0500
MIME-Version: 1.0
In-Reply-To: <1485442460-18339-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1485442422-18259-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1485442460-18339-1-git-send-email-vladimir.barinov@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Feb 2017 13:38:44 +0100
Message-ID: <CAMuHMdXDr-docSsx8WMto7_5yJL1kL3bsPXxezL8Or3r+WVdqQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: m3ulcb: Update memory node to 2 GiB map
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 26, 2017 at 3:54 PM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
>
> This patch updates memory region:
>
>   - After changes, the new map of the m3ulcb board on R8A7796 SoC
>     Bank0: 1GiB RAM : 0x000048000000 -> 0x0007fffffff
>     Bank1: 1GiB RAM : 0x000600000000 -> 0x0063fffffff
>
>   - Before changes, the old map looked like this:
>     Bank0: 1GiB RAM : 0x000048000000 -> 0x0007fffffff
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
