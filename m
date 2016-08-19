Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:36573 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750879AbcHSJRx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Aug 2016 05:17:53 -0400
Received: by mail-it0-f66.google.com with SMTP id j124so1140514ith.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Aug 2016 02:17:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1471525955-11713-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1471525955-11713-1-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Aug 2016 11:17:51 +0200
Message-ID: <CAMuHMdU3g6UF+4HUsDo806XQ9sv3QWe-zxGv0fu3jC3xrW_Bag@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Initial r8a7796 PFC support
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Thu, Aug 18, 2016 at 3:12 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> This implements a minimal set of PFC functionality for the M3 and sits on
> top of renesas-drivers-2016-08-09-v4.8-rc1.  It includes the SCIF pin groups
> and enables pin control for the serial console (SCIF2) on the Salvator-X
> board.
>
> This revision has scif_clk support, no bogus pin assignments, and enhanced
> ePAPR compliance.  See below for details.

Thank you, I've applied the first two patches to sh-pfc-for-v4.9.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
