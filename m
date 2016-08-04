Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:34640 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751528AbcHDHou (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 03:44:50 -0400
Received: by mail-oi0-f45.google.com with SMTP id k131so4931775oib.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Aug 2016 00:44:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3437294.RhgABMHgKt@wasted.cogentembedded.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com> <3437294.RhgABMHgKt@wasted.cogentembedded.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Aug 2016 09:44:49 +0200
Message-ID: <CACRpkdb8Lj=jP9-EWcFtoSt+ostyRRM=L1zxQ-gn944k6bkxOQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7792: add SDHI pin groups
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 12, 2016 at 11:40 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:

> Add SDHI0 pin groups to the R8A7792 PFC driver.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I expect Geert to queue this and send it with the first pull request
for the v4.9 development cycle.

Yours,
Linus Walleij
