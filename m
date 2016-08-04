Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:34798 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754010AbcHDIEe (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 04:04:34 -0400
Received: by mail-oi0-f41.google.com with SMTP id k131so5390150oib.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Aug 2016 01:04:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3787651.qWyGt9oMl5@wasted.cogentembedded.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com> <3787651.qWyGt9oMl5@wasted.cogentembedded.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Aug 2016 10:04:25 +0200
Message-ID: <CACRpkdbPsu=uhHW7N0GS1evMkbYUrA+465Ou5m0R-kOoDUtQ0w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7792: add missing pinmux data
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jul 22, 2016 at 3:51 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:

> The patch I've based my R8A7792 PFC work on had some VIN pinmux data missing
> and I  just  noticed that while adding the VIN pin groups...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

This looks like a fix that should go in ASAP?

Geert, do you want me to apply this directly for fixes with
your ACK?

Yours,
Linus Walleij
