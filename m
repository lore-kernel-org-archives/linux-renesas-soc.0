Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41397 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727175AbeLJLy2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 06:54:28 -0500
Date: Mon, 10 Dec 2018 12:54:24 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77990: Add support for pull-up only
 pins
Message-ID: <20181210115423.adooqj4ulrv2gz46@verge.net.au>
References: <20181207140343.5197-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181207140343.5197-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Dec 07, 2018 at 03:03:43PM +0100, Geert Uytterhoeven wrote:
> The R-Car Gen3 HardWare Manual Errata for Rev. 1.00 (Jul 2, 2018) states
> that the USB30_OVC pin supports pull-up only.  It has a bit assigned in
> the pull-enable register (PUEN5), but not in the pull-up/down control
> register (PUD5).
> 
> Add a check for this, to prevent configuring a prohibited setting.
> 
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Fixes: 83f6941a42a5e773 ("pinctrl: sh-pfc: r8a77990: Add bias pinconf support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
