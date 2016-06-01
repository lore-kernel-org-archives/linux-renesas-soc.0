Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:36688 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757281AbcFAHiM (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 03:38:12 -0400
Received: by mail-io0-f193.google.com with SMTP id m17so1896566ioi.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jun 2016 00:38:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5578588.eXCR2ytE51@wasted.cogentembedded.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
	<5578588.eXCR2ytE51@wasted.cogentembedded.com>
Date: Wed, 1 Jun 2016 09:38:11 +0200
Message-ID: <CAMuHMdUs6j4U_m-UgG45LR5Xxi7Pt3k6YqY4Wk9MmX3asDPoCQ@mail.gmail.com>
Subject: Re: [PATCH 03/13] soc: renesas: rcar-sysc: add R8A7792 support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 1, 2016 at 12:15 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add support for R-Car V2H (R8A7792) SoC power areas to the SYSC driver.
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
