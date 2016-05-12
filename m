Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:35823 "EHLO
	mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751628AbcELRsg (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 12 May 2016 13:48:36 -0400
Received: by mail-io0-f195.google.com with SMTP id i75so111188ioa.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2016 10:48:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1463041641-27485-1-git-send-email-dirk.behme@de.bosch.com>
References: <1463041641-27485-1-git-send-email-dirk.behme@de.bosch.com>
Date: Thu, 12 May 2016 19:48:35 +0200
Message-ID: <CAMuHMdWEe44Kr4LB0PW996oes+ijpVjwCH9=QSHH5y+YAh9vFg@mail.gmail.com>
Subject: Re: [PATCH 0/6] arm64: renesas: Obtain MD pin values using syscon/regmap
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Thu, May 12, 2016 at 10:27 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> This is a resend of
>
> http://www.spinics.net/lists/linux-sh/msg44757.html
>
> It's rebased against
>
> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/gen3-latest
> 0ea1cc9f0c9537d3fb42722c188
> [WIP] arm64: r8a7796: Integration
>
> and adds support for r8a7796, too.
>
> It's boot tested on r8a7795 Salvator-X and checked that the same
> mode value is read without and with this patch series.

Thanks a lot for updating my old series!

Now we have both variants (drivers/misc vs. syscon) public, perhaps we can make
an educated decision about which route to take?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
