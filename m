Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:48984 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752567AbdKGJV1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Nov 2017 04:21:27 -0500
Received: by mail-lf0-f66.google.com with SMTP id r135so13635586lfe.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Nov 2017 01:21:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171101103452.7491-7-horms+renesas@verge.net.au>
References: <20171101103452.7491-1-horms+renesas@verge.net.au> <20171101103452.7491-7-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Nov 2017 10:21:24 +0100
Message-ID: <CAMuHMdVxdMGVDeb+yuWgUnOHfYBRgdeUo0Ehgnd=b+oDG+gkZA@mail.gmail.com>
Subject: Re: [PATCH v4 06/15] arm64: dts: renesas: r8a7795-es1: Point DU/VSPD
 via FCPVD to IPMMU-VI0
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 1, 2017 at 11:34 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Hook up the FCPVD devices to allow use of the VSP and DU
> together with IPMMU-VI0.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
