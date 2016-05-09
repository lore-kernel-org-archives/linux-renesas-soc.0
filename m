Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ig0-f195.google.com ([209.85.213.195]:36506 "EHLO
	mail-ig0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752907AbcEIHtv (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 9 May 2016 03:49:51 -0400
Received: by mail-ig0-f195.google.com with SMTP id c3so10765384igl.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 May 2016 00:49:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1462778041-19595-1-git-send-email-dirk.behme@de.bosch.com>
References: <1462778041-19595-1-git-send-email-dirk.behme@de.bosch.com>
Date: Mon, 9 May 2016 09:49:50 +0200
Message-ID: <CAMuHMdUMBZSBD9FXmOZaRz-MfFcsc-StZ0Mzry37mn6Ju_kObA@mail.gmail.com>
Subject: Re: [PATCH 00/10] arm64: renesas: Obtain MD pin values using syscon/regmap
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

Thanks for your series!

On Mon, May 9, 2016 at 9:13 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> This is a resend of
>
> http://www.spinics.net/lists/linux-sh/msg44757.html

I guess you meant http://www.spinics.net/lists/linux-sh/msg45969.html?

You do want to keep (part of) the bindings from "[PATCH 1/6] reset: Add
renesas,rst DT bindings." from the former series, though ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
