Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:32870 "EHLO
	mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751531AbcFVH3q (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 22 Jun 2016 03:29:46 -0400
Received: by mail-io0-f195.google.com with SMTP id t74so5197207ioi.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Jun 2016 00:29:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1466567031-20381-5-git-send-email-horms+renesas@verge.net.au>
References: <1466567031-20381-1-git-send-email-horms+renesas@verge.net.au> <1466567031-20381-5-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Jun 2016 09:29:44 +0200
Message-ID: <CAMuHMdVDiQ4qem_0T+3cs3UmK+p5K6c07PJjefOmKeAHBO1wzg@mail.gmail.com>
Subject: Re: [PATCH v3 04/13] ARM: dts: lager: use demuxer for IIC3/I2C3
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 22, 2016 at 5:43 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Create a separate bus for dla98063 PMIC and da9210 regulator

da9063.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
