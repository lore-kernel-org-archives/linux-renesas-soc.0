Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60426 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935755AbeBLN4m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Feb 2018 08:56:42 -0500
Date: Mon, 12 Feb 2018 14:56:37 +0100
From: Simon Horman <horms@verge.net.au>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert@linux-m68k.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: shmobile: Enable RZA1 pin controller
Message-ID: <20180212135619.vymu7i2r6eriltxh@verge.net.au>
References: <1518197658-30806-1-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1518197658-30806-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Feb 09, 2018 at 06:34:18PM +0100, Jacopo Mondi wrote:
> Enable PINCTRL_RZA1 option in shmobile_defconfig
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> Hi Simon,
>   this fixes the issue you reported on Genmai when applying shmobile_defconfig.

Thanks!

Tested-by: Simon Horman <horms+renesas@verge.net.au>

I will apply this for v4.17.
