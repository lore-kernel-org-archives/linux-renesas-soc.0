Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57029 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbeKGULZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Nov 2018 15:11:25 -0500
Date: Wed, 7 Nov 2018 11:41:34 +0100
From: Simon Horman <horms@verge.net.au>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert+renesas@glider.be, laurent.pinchart@ideasonboard.com,
        linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 2/4] pinctrl: sh-pfc: Fix VIN versioned groups name
Message-ID: <20181107104134.j2agucwh6kxhrknl@verge.net.au>
References: <1541500533-21843-1-git-send-email-jacopo+renesas@jmondi.org>
 <1541500533-21843-3-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541500533-21843-3-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 06, 2018 at 11:35:31AM +0100, Jacopo Mondi wrote:
> Versioned VIN groups can appear on different sets of pins. Using the
> VIN_DATA_PIN_GROUP macro now supports proper naming of said groups through
> an optional 'version' argument.
> 
> Use the 'version' argument for said macro to fix naming of versioned
> groups for R-Car SoCs that defines them.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
