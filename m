Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:33057 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754586AbcIFHHs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Sep 2016 03:07:48 -0400
MIME-Version: 1.0
In-Reply-To: <1642221.rsatzvhHS5@wasted.cogentembedded.com>
References: <2481458.x1iQg26kO7@wasted.cogentembedded.com> <1642221.rsatzvhHS5@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Sep 2016 09:07:47 +0200
Message-ID: <CAMuHMdUy83QMc--X+eGmEzO0ZyO-iVL_u7-GhvfFWN9+c1-g1w@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: r8a7792: add MSIOF clocks
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 5, 2016 at 10:55 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Describe the MSIOF0/1 clocks and their parent, MP clock in the R8A7792
> device  tree.
>
> Based  on the original (and large) patch by Vladimir Barinov
> <vladimir.barinov@cogentembedded.com>.
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
