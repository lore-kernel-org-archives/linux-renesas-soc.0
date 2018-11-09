Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59778 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727532AbeKITrV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Nov 2018 14:47:21 -0500
Date: Fri, 9 Nov 2018 11:07:25 +0100
From: Simon Horman <horms@verge.net.au>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert+renesas@glider.be, laurent.pinchart@ideasonboard.com,
        linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 1/6] pinctrl: sh-pfc: Add optional arg to
 VIN_DATA_PIN_GROUP
Message-ID: <20181109100724.6orvu3gfvlknebgn@verge.net.au>
References: <1541693247-15599-1-git-send-email-jacopo+renesas@jmondi.org>
 <1541693247-15599-2-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541693247-15599-2-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 08, 2018 at 05:07:22PM +0100, Jacopo Mondi wrote:
> VIN data groups may appear on different sets of pins, usually named
> "vinX_data_[a|b]". The existing VIN_DATA_PIN_GROUP() does not support
> appending the '_a' or '_b' suffix, leading to the definition of group
> names not consistent with the ones defined using the SH_PFC_PIN_GROUP()
> macro.
> 
> Fix this by making the VIN_DATA_PIN_GROUP macro a variadic one,
> which accepts an optional 'version' argument.
> 
> Fixes: 423caa52534f ("pinctrl: sh-pfc: r8a779[01]: Move 'union vin_data' to shared header file")
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
