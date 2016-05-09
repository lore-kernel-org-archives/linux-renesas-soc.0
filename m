Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ig0-f194.google.com ([209.85.213.194]:34298 "EHLO
	mail-ig0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752589AbcEIH6i (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 9 May 2016 03:58:38 -0400
Received: by mail-ig0-f194.google.com with SMTP id kj7so10674981igb.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 May 2016 00:58:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <0d331be5-9540-86f6-406e-ec5647551e73@de.bosch.com>
References: <1462778041-19595-1-git-send-email-dirk.behme@de.bosch.com>
	<1462778041-19595-10-git-send-email-dirk.behme@de.bosch.com>
	<CAMuHMdWHmu0WQSeU8oHwUhm20ZGqzmLGXG1tz8suuGqY=b49Vg@mail.gmail.com>
	<c75e9eda-642d-c1f8-5a10-68e27aa49ae3@de.bosch.com>
	<CAMuHMdVr8r5D72BiF6__gfZOJkNxmPcykB0pNeJq7zcdsVpN-A@mail.gmail.com>
	<0d331be5-9540-86f6-406e-ec5647551e73@de.bosch.com>
Date: Mon, 9 May 2016 09:58:32 +0200
Message-ID: <CAMuHMdWpDkmWe01s53LU4SX3s1tnHdd5EF1wxm6Gy8VJOd_K1Q@mail.gmail.com>
Subject: Re: [PATCH 09/10] ARM: r8a779x: Add boot mode reg support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Dirk Behme <dirk.behme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 9, 2016 at 9:57 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>>         reset-controller@e6160000 {
>>                 compatible = "renesas,r8a7795-rst";
>
> Hmm, do we really want the r8a7795 here? Then we would need
>
> r8a7790-rst
> r8a7791-rst
> r8a7792-rst
> r8a7793-rst
> r8a7794-rst
> r8a7795-rst
> r8a7796-rst

We can add fallback values "renesas,rcar-gen2-rst" and "renesas,rcar-gen3-rst".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
