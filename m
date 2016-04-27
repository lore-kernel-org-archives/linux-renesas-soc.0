Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14323 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752161AbcD0KFg (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 27 Apr 2016 06:05:36 -0400
Message-ID: <57208C23.3000303@nvidia.com>
Date: Wed, 27 Apr 2016 15:23:39 +0530
From: Laxman Dewangan <ldewangan@nvidia.com>
MIME-Version: 1.0
To: Arnd Bergmann <arnd@arndb.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
CC: Simon Horman <horms+renesas@verge.net.au>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	<linux-renesas-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: ish-pfc: avoid unused variable warning
References: <1461751049-2751427-1-git-send-email-arnd@arndb.de>
In-Reply-To: <1461751049-2751427-1-git-send-email-arnd@arndb.de>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


On Wednesday 27 April 2016 03:26 PM, Arnd Bergmann wrote:
> After the conversion to devm_pinctrl_register, we get a warning in
> sh_pfc_remove when CONFIG_PINCTRL_SH_PFC_GPIO is disabled:
>
> drivers/pinctrl/sh-pfc/core.c: In function 'sh_pfc_remove':
> drivers/pinctrl/sh-pfc/core.c:603:17: unused variable 'pfc' [-Werror=unused-variable]
>    struct sh_pfc *pfc = platform_get_drvdata(pdev);
>
> This moves the variable definition inside of the same ifdef
> that has the only user, to get a clean build again.
>


Similar patch from Geert also:
[PATCH] pinctrl: sh-pfc: Kill unused variable in sh_pfc_remove()

If devm_gpiochip_add_data() used then this may not be required.
