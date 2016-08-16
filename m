Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:34642 "EHLO
	mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751057AbcHPIX4 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 16 Aug 2016 04:23:56 -0400
MIME-Version: 1.0
In-Reply-To: <1470993268-11590-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1470993268-11590-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Aug 2016 10:23:07 +0200
Message-ID: <CAMuHMdVJ6fN1ak1zMYXKPe6h1aEmhHjWdCQLPw5EsGZq61w99A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Add DU support
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 12, 2016 at 11:14 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Only the DU parallel RGB output signals are included, HDMI and TCON pins
> will be added in separate groups.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
