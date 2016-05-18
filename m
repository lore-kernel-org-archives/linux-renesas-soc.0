Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:35150 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752149AbcERIEY (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 18 May 2016 04:04:24 -0400
Received: by mail-io0-f193.google.com with SMTP id i75so7949525ioa.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2016 01:04:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <c22b4495-bae3-d4b9-08d1-2ce2c25a5bf8@de.bosch.com>
References: <1461047395-6532-1-git-send-email-dirk.behme@de.bosch.com>
	<20160427233028.GA5155@verge.net.au>
	<5721A2A5.9010908@de.bosch.com>
	<20160428234345.GD18128@verge.net.au>
	<20160429113515.333c42ef@arm.com>
	<5728E470.7050408@gmail.com>
	<20160516081257.GC4955@verge.net.au>
	<c22b4495-bae3-d4b9-08d1-2ce2c25a5bf8@de.bosch.com>
Date: Wed, 18 May 2016 10:04:23 +0200
Message-ID: <CAMuHMdUEy169J_DJEOiD5741-FstJ2yQOWzaJB-on6AA4p2StA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: r8a7795: Increase the size of GIC-400 mapped registers
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Simon Horman <horms@verge.net.au>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Wed, May 18, 2016 at 10:00 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> In parallel, a r8a7796.dtsi was added where this change is missing, now:
>
> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/tree/arch/arm64/boot/dts/renesas/r8a7796.dtsi?h=topic/gen3-latest
>
> Do you need a new patch to add this to the r8a7796.dtsi, too? Or could you
> apply
>
> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/commit/arch/arm64/boot/dts/renesas?h=topic/gen3-latest&id=f7c7e97097915643a86051fe557b41a87c837172
>
> to the r8a7796.dtsi, too?

The initial r8a7796.dtsi in renesas-drivers is a very preliminary one, just
to get things going.
The final one will be added through properly submitted and reviewed patches.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
