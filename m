Return-Path: <SRS0=pBJi=SR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FF0C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 11:24:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9428F20693
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 11:24:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbfDOLYW convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Apr 2019 07:24:22 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:34883 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbfDOLYW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Apr 2019 07:24:22 -0400
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp05-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.18 AUTH)
        with ESMTPSA id y08c83v3FBOJKFO
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 15 Apr 2019 13:24:19 +0200 (CEST)
Date:   Mon, 15 Apr 2019 13:24:19 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Message-ID: <1707991043.465380.1555327459891@webmail.strato.com>
In-Reply-To: <20190412234359.5079-5-niklas.soderlund+renesas@ragnatech.se>
References: <20190412234359.5079-1-niklas.soderlund+renesas@ragnatech.se>
 <20190412234359.5079-5-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 4/8] rcar-vin: Do not sync subdevice format when opening
 the video device
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev55
X-Originating-IP: 85.212.102.112
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On April 13, 2019 at 1:43 AM Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se> wrote:
> 
> 
> The format is already synced when the subdevice is bound, there is no
> need to do do it every time the video device is opened.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 25 ---------------------
>  1 file changed, 25 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index f67cef97b89a3bd4..71651c5a69483367 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -782,38 +782,13 @@ static int rvin_initialize_device(struct file *file)
>  	struct rvin_dev *vin = video_drvdata(file);
>  	int ret;
>  
> -	struct v4l2_format f = {
> -		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
> -		.fmt.pix = {
> -			.width		= vin->format.width,
> -			.height		= vin->format.height,
> -			.field		= vin->format.field,
> -			.colorspace	= vin->format.colorspace,
> -			.pixelformat	= vin->format.pixelformat,
> -		},
> -	};
> -
>  	ret = rvin_power_on(vin);
>  	if (ret < 0)
>  		return ret;
>  
> -	/*
> -	 * Try to configure with default parameters. Notice: this is the
> -	 * very first open, so, we cannot race against other calls,
> -	 * apart from someone else calling open() simultaneously, but
> -	 * .host_lock is protecting us against it.
> -	 */
> -	ret = rvin_s_fmt_vid_cap(file, NULL, &f);
> -	if (ret < 0)
> -		goto esfmt;
> -
>  	v4l2_ctrl_handler_setup(&vin->ctrl_handler);
>  
>  	return 0;
> -esfmt:
> -	rvin_power_off(vin);
> -
> -	return ret;
>  }
>  
>  static int rvin_open(struct file *file)
> -- 
> 2.21.0
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
