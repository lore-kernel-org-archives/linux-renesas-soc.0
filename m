Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:11826 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752392AbcDZLMg (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 26 Apr 2016 07:12:36 -0400
Message-ID: <571F4A5C.7090608@nvidia.com>
Date: Tue, 26 Apr 2016 16:30:44 +0530
From: Laxman Dewangan <ldewangan@nvidia.com>
MIME-Version: 1.0
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: <linux-gpio@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: Kill unused variable in sh_pfc_remove()
References: <1461666626-24805-1-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1461666626-24805-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


On Tuesday 26 April 2016 04:00 PM, Geert Uytterhoeven wrote:
> If CONFIG_PINCTRL_SH_PFC_GPIO=n:
>
>      drivers/pinctrl/sh-pfc/core.c: In function 'sh_pfc_remove':
>      drivers/pinctrl/sh-pfc/core.c:649:17: warning: unused variable 'pfc' [-Wunused-variable]
>
> Fixes: 67ec8d7b48463904 ("pinctrl: ish-pfc: Use devm_pinctrl_register() for pinctrl registration")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I won't queue this up in sh-pfc-for-v4.7, as the offending commit is not in
> that branch.
>

Ideally, you dont need the call of sh_pfc_unregister_gpiochip() if you 
use the devm_gpiochip_add_data() which is already available on all 
subsystem.

int sh_pfc_unregister_gpiochip(struct sh_pfc *pfc)
{
         gpiochip_remove(&pfc->gpio->gpio_chip);
#ifdef CONFIG_SUPERH
         gpiochip_remove(&pfc->func->gpio_chip);
#endif
         return 0;
}

So you can get rid of this calls and lines.


-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
