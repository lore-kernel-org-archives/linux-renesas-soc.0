Return-Path: <SRS0=SHeS=PY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05F5C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 13:48:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80528206C2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 13:48:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="ra/7WWPN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390887AbfAPNsF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 08:48:05 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35817 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404404AbfAPNpR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 08:45:17 -0500
Received: by mail-lf1-f68.google.com with SMTP id e26so4935911lfc.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Jan 2019 05:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=GwU3/93D5AciwF4ZIvfHdNs6EWGlVgfH+ZHNE8V4Osk=;
        b=ra/7WWPNoQshLxrQEStz9lGClrqL08H5QMvObMMthShquz8b1oPMbzlxNTn0k7CKXS
         LEDbzP2UDEcz3Bj4dPzL556A2W/MIH6Wf4Jkb2hrgdPKfYhB11BB/+6KPVyHCUSobX34
         ZOOK+weG0beE2DaD1kyYwP2p/50k+4QtQS1LGhJKSNMIFpHGJZc0m2S1Qlv8t9S3jaqy
         kDGjvgbHvGGI9lDh7igr2xXwF6XXFA0LqrPlYgIGe6eG1v4UHP5vT3UFzP7vdE1/Eup1
         D3CN/EbeOhnYfP2L5iuitR7b1HK4Jz98oSxu3/s6+h+JVVyaCIvfW3ONQG+NDS0N5opB
         l2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=GwU3/93D5AciwF4ZIvfHdNs6EWGlVgfH+ZHNE8V4Osk=;
        b=spehRy4B93bsg2Opm+71bLvd9V2yRLi0njoIBFD67Inf/TMcQTxOGq/k94WuHSdY/R
         CEqM5kRX8xJROYcXYmeoVHVy00lJhCE6RsGGBaazDliX/BnbuL8b9bSTzB4eZTEJyNkz
         TUIttWg5SPQMh/lXf2z28yWa5gXE3licrdYAANNV0TAVcPncWSAJHSGztQJpEevhHOxi
         WEqs3rRwPrBiWSHG+TYuPtI1fxfpr2vx/rzgKn+kFOXonlR86W0y64wCvqSRbJZ3mYgp
         j4o/XpDYAXc2A3LLZFwt9AUe6N4xWoP1mu1C6V30TVAWwoH5Pk7W9jeHmY4N4ok1Jgqn
         0MvA==
X-Gm-Message-State: AJcUukcTWg0wRrA5HoclrtC96Uxmube9mF7ympiBTYmQlFvqfxUbdPZR
        UiZIqrH9oxMJueousX2qPp61+w==
X-Google-Smtp-Source: ALg8bN5Qo65Ee2f9oDUunpCf6HzzVtAdIrjlzofHicLFhXyaaAnlgQOLaisWeXmL/DZggNUydgMTcA==
X-Received: by 2002:a19:9b50:: with SMTP id d77mr7095130lfe.137.1547646314131;
        Wed, 16 Jan 2019 05:45:14 -0800 (PST)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id g70-v6sm1057834ljg.92.2019.01.16.05.45.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jan 2019 05:45:11 -0800 (PST)
From:   "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
X-Google-Original-From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date:   Wed, 16 Jan 2019 14:45:10 +0100
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 5/6] media: adv748x: Store the TX sink in HDMI/AFE
Message-ID: <20190116134510.GQ7393@bigcity.dyn.berto.se>
References: <20190110140213.5198-1-jacopo+renesas@jmondi.org>
 <20190110140213.5198-6-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190110140213.5198-6-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thanks for your work.

On 2019-01-10 15:02:12 +0100, Jacopo Mondi wrote:
> Both the AFE and HDMI s_stream routines (adv748x_afe_s_stream() and
> adv748x_hdmi_s_stream()) have to enable the CSI-2 TX they are streaming video
> data to.
> 
> With the introduction of dynamic routing between HDMI and AFE entities to
> TXA, the video stream sink needs to be set at run time, and not statically
> selected as the s_stream functions are currently doing.
> 
> To fix this, store a reference to the active CSI-2 TX sink for both HDMI and
> AFE sources, and operate on it when starting/stopping the stream.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/i2c/adv748x/adv748x-afe.c  |  2 +-
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 15 +++++++++++++--
>  drivers/media/i2c/adv748x/adv748x-hdmi.c |  2 +-
>  drivers/media/i2c/adv748x/adv748x.h      |  4 ++++
>  4 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
> index 71714634efb0..dbbb1e4d6363 100644
> --- a/drivers/media/i2c/adv748x/adv748x-afe.c
> +++ b/drivers/media/i2c/adv748x/adv748x-afe.c
> @@ -282,7 +282,7 @@ static int adv748x_afe_s_stream(struct v4l2_subdev *sd, int enable)
>  			goto unlock;
>  	}
>  
> -	ret = adv748x_tx_power(&state->txb, enable);
> +	ret = adv748x_tx_power(afe->tx, enable);
>  	if (ret)
>  		goto unlock;
>  
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 353b6b9bf6a7..2091cda50935 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -88,14 +88,25 @@ static int adv748x_csi2_registered(struct v4l2_subdev *sd)
>  						 is_txb(tx));
>  		if (ret)
>  			return ret;
> +
> +		/* TXB can output AFE signals only. */
> +		if (is_txb(tx))
> +			state->afe.tx = tx;
>  	}
>  
>  	/* Register link to HDMI for TXA only. */
>  	if (is_txb(tx) || !is_hdmi_enabled(state))
>  		return 0;
>  
> -	return adv748x_csi2_register_link(tx, sd->v4l2_dev, &state->hdmi.sd,
> -					  ADV748X_HDMI_SOURCE, true);
> +	ret = adv748x_csi2_register_link(tx, sd->v4l2_dev, &state->hdmi.sd,
> +					 ADV748X_HDMI_SOURCE, true);
> +	if (ret)
> +		return ret;
> +
> +	/* The default HDMI output is TXA. */
> +	state->hdmi.tx = tx;
> +
> +	return 0;
>  }
>  
>  static const struct v4l2_subdev_internal_ops adv748x_csi2_internal_ops = {
> diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
> index 35d027941482..c557f8fdf11a 100644
> --- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
> +++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
> @@ -358,7 +358,7 @@ static int adv748x_hdmi_s_stream(struct v4l2_subdev *sd, int enable)
>  
>  	mutex_lock(&state->mutex);
>  
> -	ret = adv748x_tx_power(&state->txa, enable);
> +	ret = adv748x_tx_power(hdmi->tx, enable);
>  	if (ret)
>  		goto done;
>  
> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
> index d22270f5e2c1..934a9d9a75c8 100644
> --- a/drivers/media/i2c/adv748x/adv748x.h
> +++ b/drivers/media/i2c/adv748x/adv748x.h
> @@ -121,6 +121,8 @@ struct adv748x_hdmi {
>  	struct v4l2_dv_timings timings;
>  	struct v4l2_fract aspect_ratio;
>  
> +	struct adv748x_csi2 *tx;
> +
>  	struct {
>  		u8 edid[512];
>  		u32 present;
> @@ -151,6 +153,8 @@ struct adv748x_afe {
>  	struct v4l2_subdev sd;
>  	struct v4l2_mbus_framefmt format;
>  
> +	struct adv748x_csi2 *tx;
> +
>  	bool streaming;
>  	v4l2_std_id curr_norm;
>  	unsigned int input;
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
