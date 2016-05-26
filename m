Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:33447 "EHLO
	mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750904AbcEZHOG (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 26 May 2016 03:14:06 -0400
Received: by mail-io0-f196.google.com with SMTP id s67so1000591ios.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 May 2016 00:14:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
References: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
Date: Thu, 26 May 2016 09:14:04 +0200
Message-ID: <CAMuHMdWoBv-13eNMr_ymtmRo-LPdznarRMyXFw0pG7xF_07A6A@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: Renesas: R-Car3: Add product register support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Wed, May 25, 2016 at 10:58 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> Instead of hard coding the product register in rcar_du_crtc.c,
> read it based on the device tree.
>
> This patch series is based on
>
> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/gen3-latest
> renesas-drivers-2016-05-17-v4.6
> 4717ef6d59c3204e385c
> Revert "ASoC: simple-card: Add pm callbacks to platform driver"
>
> It's boot tested on r8a7795 Salvator-X and checked that the same
> product register value is read without and with this patch series.

Thanks for your series!

Given the use of PRR you saw is in a patch that's definitely not ready for
upstream, I think adding a full-fledged PRR driver is a bit premature.

So far we've always planned to handle differences in ES versions using the
compatible value, cfr. "renesas,sata-r8a7790-es1".
But in general we target the latest (production) version in upstream.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
