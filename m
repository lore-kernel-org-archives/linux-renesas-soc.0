Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE6EC67839
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 08:14:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 29AC92086D
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 08:14:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hXlG0u5g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29AC92086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbeLNIOb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 03:14:31 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49056 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726615AbeLNIOb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 03:14:31 -0500
Received: from avalon.localnet (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1EA90549;
        Fri, 14 Dec 2018 09:14:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1544775269;
        bh=bmy3whZ+CullPp11OWYCdiD8/J1hytUvk8WzBEuc/+0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hXlG0u5grgd7WQPiF9gA5FSsIe3SQaxqaFgd/fsytkOIiJSQYVLqtMFDy/DCXD/Iu
         DJcJpDvQ7872nGSFE58eGBtixo25zpJKWMh7RnEb1YyebqDnRyJtYKVOjoayOtaYFP
         wlqAON/fXWio3cYxL2KLxZRFkUg/IBNVi9qGTStM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        kieran.bingham+renesas@ideasonboard.com,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
Subject: Re: [PATCH 2/2] drm: rcar-du: Add Standby Mode to suspend()
Date:   Fri, 14 Dec 2018 10:15:17 +0200
Message-ID: <10902832.ksRS9jOFM4@avalon>
Organization: Ideas on Board Oy
In-Reply-To: <1544772318-17408-2-git-send-email-na-hoan@jinso.co.jp>
References: <1544772318-17408-1-git-send-email-na-hoan@jinso.co.jp> <1544772318-17408-2-git-send-email-na-hoan@jinso.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Hoan-san,

On Friday, 14 December 2018 09:25:18 EET Nguyen An Hoan wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> 
> Enter Standby Mode before suspend by drm
> We will not need to "Release from Module Standby Mode"
> because after resume() is called, this is done.
> 
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index 32dba13..1ab3f56 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -426,6 +426,20 @@ static struct drm_driver rcar_du_driver = {
>  static int rcar_du_pm_suspend(struct device *dev)
>  {
>  	struct rcar_du_device *rcdu = dev_get_drvdata(dev);
> +	int ret;
> +	unsigned int i = 0;
> +
> +	for (i = 0; i < rcdu->num_crtcs; i++)
> +	{
> +		struct rcar_du_crtc *rcrtc = &rcdu->crtcs[i];
> +
> +		ret = rcar_du_crtc_standby(rcrtc);
> +		if(ret)
> +		{
> +			dev_err(dev, "failed to enter Standby mode\n");
> +			return ret;
> +		}
> +	}

Could you please explain why this is needed ? The call to 
drm_mode_config_helper_suspend() should disable all CRTCs, so there shouldn't 
be a need to disable them manually first.

>  	return drm_mode_config_helper_suspend(rcdu->ddev);
>  }

-- 
Regards,

Laurent Pinchart



