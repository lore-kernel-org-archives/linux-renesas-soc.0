Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:34335 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752222AbcFHMIa (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 8 Jun 2016 08:08:30 -0400
Received: by mail-oi0-f51.google.com with SMTP id e72so8943346oib.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jun 2016 05:08:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1465320786-10333-1-git-send-email-ben.dooks@codethink.co.uk>
References: <1465320786-10333-1-git-send-email-ben.dooks@codethink.co.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 8 Jun 2016 14:08:28 +0200
Message-ID: <CACRpkdaq8jzBT8o8RVnnA6xQ1YVqFoYf+wgmrWciJx0qbDLs=g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: fix warnings by include core.h
To: Ben Dooks <ben.dooks@codethink.co.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-kernel@lists.codethink.co.uk,
	Alessandro Rubini <rubini@unipv.it>,
	linux-renesas-soc@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jun 7, 2016 at 7:33 PM, Ben Dooks <ben.dooks@codethink.co.uk> wrote:

> Fix warnings about emev2_pinmux_info and r8a7779_pinmux_info
> by using core.h instead of sh_pfc.h in these files. This gives
> the declarations of the two structures and removes the following
> warnings:
>
> drivers/pinctrl/sh-pfc/pfc-emev2.c:1695:30: warning: symbol 'emev2_pinmux_info' was not declared. Should it be static?
> drivers/pinctrl/sh-pfc/pfc-r8a7779.c:3888:30: warning: symbol 'r8a7779_pinmux_info' was not declared. Should it be static?
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Geert/Laurent:

- take a look at this patch
- shall I apply this directly?

Yours,
Linus Walleij
