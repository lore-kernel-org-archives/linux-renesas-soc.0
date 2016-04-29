Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:35956 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752065AbcD2JJm (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 29 Apr 2016 05:09:42 -0400
Received: by mail-oi0-f49.google.com with SMTP id x201so111998904oif.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2016 02:09:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1461666626-24805-1-git-send-email-geert+renesas@glider.be>
References: <1461666626-24805-1-git-send-email-geert+renesas@glider.be>
Date: Fri, 29 Apr 2016 11:09:41 +0200
Message-ID: <CACRpkdYvK85EMaZLURrt6MqkV2kv7DTqsq6AdktOsp8dcUmJeQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: Kill unused variable in sh_pfc_remove()
From: Linus Walleij <linus.walleij@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 26, 2016 at 12:30 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> If CONFIG_PINCTRL_SH_PFC_GPIO=n:
>
>     drivers/pinctrl/sh-pfc/core.c: In function 'sh_pfc_remove':
>     drivers/pinctrl/sh-pfc/core.c:649:17: warning: unused variable 'pfc' [-Wunused-variable]
>
> Fixes: 67ec8d7b48463904 ("pinctrl: ish-pfc: Use devm_pinctrl_register() for pinctrl registration")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I won't queue this up in sh-pfc-for-v4.7, as the offending commit is not in
> that branch.

OK patch applied.

Yours,
Linus Walleij
