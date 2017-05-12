Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:35574 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750991AbdELOjF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 May 2017 10:39:05 -0400
Received: by mail-it0-f65.google.com with SMTP id 67so6071002itx.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 May 2017 07:39:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1493721024-15042-1-git-send-email-horms+renesas@verge.net.au>
References: <1493721024-15042-1-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 May 2017 16:39:03 +0200
Message-ID: <CAMuHMdWeLAq7nZ7zu2xJ7vG-oM+-TSZm0eY68Cm-9eUREMjhXg@mail.gmail.com>
Subject: Re: [PATCH/RFT renesas-devel] arm64: dts: ulcb: Set drive-strength
 for ravb pins
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Tue, May 2, 2017 at 12:30 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> The EthernetAVB should not depend on the bootloader to setup correct
> drive-strength values.  Values for drive-strength where found by
> examining the registers after the bootloader has configured the
> registers and successfully used the EthernetAVB.
>
> Based on:
> * commit 7d73a4da2681 ("arm64: dts: r8a7795: salvator-x: Set drive-streng=
th
>   for ravb pins")
> * commit 4903987033be ("arm64: dts: r8a7796: salvator-x: Set drive-streng=
th
>   for ravb pins")
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> * Compile tested only due to lack of hardware access

So how did you examine the registers? ;-)

Hence I examined the registers myself:
  - H3ULCB has the same register settings as Salvator-X with H3 ES1.0
  - M3ULCB has the same register settings as Salvator-X with M3-W ES1.0
    or H3 ES2.0.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
