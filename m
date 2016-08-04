Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:32836 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750736AbcHDICQ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 04:02:16 -0400
Received: by mail-oi0-f49.google.com with SMTP id j185so312265823oih.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Aug 2016 01:02:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1468913374-32065-1-git-send-email-geert+renesas@glider.be>
References: <1468913374-32065-1-git-send-email-geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Aug 2016 09:57:03 +0200
Message-ID: <CACRpkdayXYjGRh_Dh_UrmfPyCKKS7LpubBnzbzxM_woW_Zpisw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Correct header from R-Car Gen3
 to R8A7795
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 19, 2016 at 9:29 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> This source file handles r8a7795 only, which is not the sole member of
> the R-Car Gen3 family.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued up in sh-pfc-for-v4.9.

OK! Acked-by.

Yours,
Linus Walleij
