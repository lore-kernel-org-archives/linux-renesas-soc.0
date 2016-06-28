Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:36371 "EHLO
	mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752240AbcF1NDh (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 28 Jun 2016 09:03:37 -0400
Received: by mail-io0-f182.google.com with SMTP id s63so15758177ioi.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jun 2016 06:03:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1467106492-1341-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1467106492-1341-1-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jun 2016 15:03:16 +0200
Message-ID: <CAMuHMdXVeHAYAJy1R-gRDr7emWTqYO34x=n=kQPsVkyMFdK3Cg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Initial r8a7796 PFC support
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

On Tue, Jun 28, 2016 at 11:34 AM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> This implements a minimal set of PFC functionality for the M3 and sits on
> top of renesas-drivers-2016-06-21-v4.7-rc4.  It includes the SCIF pin groups
> and enables pin control for the serial console (SCIF2) on the Salvator-X
> board.

Thanks, I've imported this into the topic/r8a7796-pfc-v1 branch of my
renesas-drivers repository.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
