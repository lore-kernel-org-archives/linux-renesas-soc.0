Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:35987 "EHLO
	mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750779AbcEYHCT (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 25 May 2016 03:02:19 -0400
Received: by mail-it0-f68.google.com with SMTP id p81so4070065itd.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 May 2016 00:02:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1464138700-12219-1-git-send-email-horms+renesas@verge.net.au>
References: <1464138700-12219-1-git-send-email-horms+renesas@verge.net.au>
Date: Wed, 25 May 2016 09:02:17 +0200
Message-ID: <CAMuHMdVUSmRtFHFA1E9_sqFUEo9KER2CSW4qtjcsY0LWs6tfeA@mail.gmail.com>
Subject: Re: [PATCH] rm64: dts: r8a7795: Drop 0x from unit address of gic
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 25, 2016 at 3:11 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Drop 0x from unit address of gic as this is the desired form for
> a unit address.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

If you increase the entropy of the universe even more by adding the missing
"a" prefix to the one-line summary, you can add my

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
