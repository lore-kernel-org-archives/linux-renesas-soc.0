Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:43300 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932766AbdKGJgN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Nov 2017 04:36:13 -0500
Received: by mail-lf0-f65.google.com with SMTP id a16so13698792lfk.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Nov 2017 01:36:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171101103452.7491-12-horms+renesas@verge.net.au>
References: <20171101103452.7491-1-horms+renesas@verge.net.au> <20171101103452.7491-12-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Nov 2017 10:36:10 +0100
Message-ID: <CAMuHMdXH7bNiOaNqm=7sgwGn6cY4COwVxtGoHT3ZHgR3QmVE0Q@mail.gmail.com>
Subject: Re: [PATCH v4 11/15] arm64: dts: renesas: r8a7795-es1: Point VSPI via
 FCPVI to IPMMU-VP
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
> Hook up the FCPVI devices to allow use of VSPI with IPMMU-VP.
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
