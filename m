Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABA4ECAAD5
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 27 Aug 2022 01:04:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbiH0BEf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Aug 2022 21:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbiH0BEe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 21:04:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D82868B6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 18:04:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A88F120A;
        Sat, 27 Aug 2022 03:04:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661562271;
        bh=WOyHgEMzsUmZjwukdnKWFvD4AASLtWqiRnnpX83POBg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o/KWvI6219Rdafw1d+LUYSmV98CVTpOUlcwcAn+40sEyRd0NAQwIyuIhwexQwsqfh
         5Sd92ghJjn9Bqq7vlhInii3I0Znk9hhw47ePS4DIoKgR1hPUycJC/hRPQjYP1Nf42K
         rGVrbk5zgofKh/3RheZa0AcTqhJ0N66JMCpwRnS4=
Date:   Sat, 27 Aug 2022 04:04:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v5 1/4] drm/bridge: ti-sn65dsi86: check AUX errors better
Message-ID: <Ywltl8yLRx9Wq+ux@pendragon.ideasonboard.com>
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
 <20220824130034.196041-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220824130034.196041-2-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Wed, Aug 24, 2022 at 04:00:31PM +0300, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> The driver does not check AUX_IRQ_STATUS_NAT_I2C_FAIL bit at all when
> sending AUX transfers, which leads to the driver not returning an error.
> 
> Add the check.

That looks right.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 90bbabde1595..ba84215c1511 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -582,6 +582,11 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
>  		goto exit;
>  	}
>  
> +	if (val & AUX_IRQ_STATUS_NAT_I2C_FAIL) {
> +		ret = -EIO;
> +		goto exit;
> +	}
> +
>  	if (val & AUX_IRQ_STATUS_AUX_SHORT) {
>  		ret = regmap_read(pdata->regmap, SN_AUX_LENGTH_REG, &len);
>  		if (ret)

-- 
Regards,

Laurent Pinchart
