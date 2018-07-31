Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60511 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727409AbeGaMTu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jul 2018 08:19:50 -0400
Date: Tue, 31 Jul 2018 12:40:03 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be,
        linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77990: Add PWM pins, groups and
 functions
Message-ID: <20180731104002.eq5qv6fsk5tmutf2@verge.net.au>
References: <1532951278-28676-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1532951278-28676-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 30, 2018 at 08:47:58PM +0900, Yoshihiro Shimoda wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> This patch adds PWM{0,1,2,3,4,5,6} pins, groups and functions to
> the R8A77990 SoC.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 211 ++++++++++++++++++++++++++++++++++

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
