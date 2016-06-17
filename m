Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:36012 "EHLO
	mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933415AbcFQNA1 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 17 Jun 2016 09:00:27 -0400
MIME-Version: 1.0
In-Reply-To: <1466166314-10996-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
References: <1466166314-10996-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Jun 2016 15:00:23 +0200
Message-ID: <CAMuHMdUufppSHD3J_0j3z0LCXJxQ3rbhUa4+cQVdQ73EWZz-fw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a7795: Add DRIF clock
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-clk <linux-clk@vger.kernel.org>,
	"open list:MEDIA DRIVERS FOR RENESAS - FCP"
	<linux-renesas-soc@vger.kernel.org>,
	Chris Paterson <chris.paterson2@renesas.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ramesh,

On Fri, Jun 17, 2016 at 2:25 PM, Ramesh Shanmugasundaram
<ramesh.shanmugasundaram@bp.renesas.com> wrote:
> This patch adds DRIF module clocks for r8a7795 SoC.
>
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>

Thanks!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

(i.e. will queue in clk-renesas-for-v4.8)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
