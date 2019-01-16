Return-Path: <SRS0=SHeS=PY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3142C43612
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 13:33:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 71AD620675
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 13:33:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="SP+TC3Qv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732780AbfAPNdO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 08:33:14 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42061 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390520AbfAPNdN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 08:33:13 -0500
Received: by mail-lf1-f68.google.com with SMTP id l10so4870107lfh.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Jan 2019 05:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=dkVRjPzDyeIj1c4QcPgMS7rIVBwKEFcEdWyYnJMVhwM=;
        b=SP+TC3Qvx2rdw0iRPhwVvtg7TaZWTnI454ZiV0j52MOoSXP+uK7O+p6yL0vSDMFUJt
         SYi9QXYHsoRCYCtnXB5VFzlpEpIQ6YbiOIoxyIDmFuJf1gEXE4bfPo2eIFSuiU88Z64P
         ruGV4fo8ZGxrQMLmBzQvQGgptTXZ3msy0NToNWb3obaS3fxJ0lj78G9mLMOlgiH5UOXH
         YcnpMVA+6ShZhJkVLfQLCbVdlHMqQsgz84qTczfGMqwOL9pP9ZXe+yxIMIObQmYN7Q7B
         YY+LPx1eJCw4U7xQL6AlflA54rYOup2GQNwhnCAxAq/kZZzPpV++DJgOkoy1NE3OTZZE
         1/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=dkVRjPzDyeIj1c4QcPgMS7rIVBwKEFcEdWyYnJMVhwM=;
        b=OILtKjZ15Ys1ykNAwBUXvVwCNqQsJTk6WWM3qrYmYQDdeKPGMNKip3h23U7omhf4ue
         jNNSTvQdy7nce4TAWomAEy2+aJpQ5gkxCnpiUaBIIJLxG+Ij9fKies/zkQ+smxJ6TOb8
         mGYNEJhOfZ3AqtmT9FHJXXTrS/C7bY6rTWDpKma1nwfCSuwVSXCGHAjS0YcvoPE2V51V
         rEo0Sal7RxhNRJzD4JK05Wg4xiylq7IOQGZPDj4IwAPdDlNjcDV12+hquOjcEUeGJ0eh
         d6y1S9mAuvHHTt5Hkbu+Fyl8nJbUzN0osZm83vplV/k4MSiTZncYWTWgf6VlonBR5B4c
         XmdQ==
X-Gm-Message-State: AJcUukejSe0jSQv+NOwPIpAcZ5Ar6x40Il+PCOk5OMJVlnxpIf+Q+5QR
        DoQ+D1kCcsUenpeWXpOCJ7pUUNTyous=
X-Google-Smtp-Source: ALg8bN5N75H1UMcMs0USfDl3H4GJ7efdoHTdpnEFJ94PWWg7KZz49O6Dqne2s/ZEBWEJXtyq3e9zHw==
X-Received: by 2002:a19:645b:: with SMTP id b27mr6916058lfj.14.1547645590814;
        Wed, 16 Jan 2019 05:33:10 -0800 (PST)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id v19sm1158341lfe.69.2019.01.16.05.33.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jan 2019 05:33:09 -0800 (PST)
From:   "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
X-Google-Original-From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date:   Wed, 16 Jan 2019 14:33:09 +0100
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 4/6] media: adv748x: Store the source subdevice in TX
Message-ID: <20190116133309.GO7393@bigcity.dyn.berto.se>
References: <20190110140213.5198-1-jacopo+renesas@jmondi.org>
 <20190110140213.5198-5-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190110140213.5198-5-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thanks for your patch.

On 2019-01-10 15:02:11 +0100, Jacopo Mondi wrote:
> The power_up_tx() procedure needs to set a few registers conditionally to
> the selected video source, but it currently checks for the provided tx to
> be either TXA or TXB.
> 
> With the introduction of dynamic routing between HDMI and AFE entities to
> TXA, checking which TX the function is operating on is not meaningful anymore.
> 
> To fix this, store the subdevice of the source providing video data to the
> CSI-2 TX in the 'struct adv748x_csi2' representing the TX and check on it.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/i2c/adv748x/adv748x-core.c |  2 +-
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 13 ++++++++++---
>  drivers/media/i2c/adv748x/adv748x.h      |  1 +
>  3 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index ad4e6424753a..200e00f93546 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -254,7 +254,7 @@ static int adv748x_power_up_tx(struct adv748x_csi2 *tx)
>  	adv748x_write_check(state, page, 0x00, 0xa0 | tx->num_lanes, &ret);
>  
>  	/* ADI Required Write */
> -	if (is_txa(tx)) {
> +	if (tx->src == &state->hdmi.sd) {
>  		adv748x_write_check(state, page, 0xdb, 0x10, &ret);
>  		adv748x_write_check(state, page, 0xd6, 0x07, &ret);
>  	} else {
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 8c3714495e11..353b6b9bf6a7 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -46,9 +46,16 @@ static int adv748x_csi2_register_link(struct adv748x_csi2 *tx,
>  			return ret;
>  	}
>  
> -	return media_create_pad_link(&src->entity, src_pad,
> -				     &tx->sd.entity, ADV748X_CSI2_SINK,
> -				     enable ? MEDIA_LNK_FL_ENABLED : 0);
> +	ret = media_create_pad_link(&src->entity, src_pad,
> +				    &tx->sd.entity, ADV748X_CSI2_SINK,
> +				    enable ? MEDIA_LNK_FL_ENABLED : 0);
> +	if (ret)
> +		return ret;
> +
> +	if (enable)
> +		tx->src = src;
> +
> +	return 0;
>  }
>  
>  /* -----------------------------------------------------------------------------
> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
> index ab0c84adbea9..d22270f5e2c1 100644
> --- a/drivers/media/i2c/adv748x/adv748x.h
> +++ b/drivers/media/i2c/adv748x/adv748x.h
> @@ -84,6 +84,7 @@ struct adv748x_csi2 {
>  	struct media_pad pads[ADV748X_CSI2_NR_PADS];
>  	struct v4l2_ctrl_handler ctrl_hdl;
>  	struct v4l2_ctrl *pixel_rate;
> +	struct v4l2_subdev *src;
>  	struct v4l2_subdev sd;
>  };
>  
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
