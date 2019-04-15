Return-Path: <SRS0=pBJi=SR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCB7C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 11:21:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 604452073F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 11:21:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbfDOLV1 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Apr 2019 07:21:27 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:17095 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbfDOLV1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Apr 2019 07:21:27 -0400
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp05-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.18 AUTH)
        with ESMTPSA id y08c83v3FBLMKCM
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 15 Apr 2019 13:21:22 +0200 (CEST)
Date:   Mon, 15 Apr 2019 13:21:22 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Message-ID: <1183091662.465085.1555327282821@webmail.strato.com>
In-Reply-To: <20190412234359.5079-3-niklas.soderlund+renesas@ragnatech.se>
References: <20190412234359.5079-1-niklas.soderlund+renesas@ragnatech.se>
 <20190412234359.5079-3-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 2/8] rcar-vin: Remove unneeded calls to
 pm_runtime_{enable,disable}
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
> Runtime PM is already enable unconditionally when the driver is probed
> and disabled when it's removed. There is no point in doing it again for
> Gen2 when opening and closing the video device.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index b821ea01786eb1ff..0841f1a0bfd7ba3a 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -797,8 +797,6 @@ static int rvin_initialize_device(struct file *file)
>  	if (ret < 0)
>  		return ret;
>  
> -	pm_runtime_enable(&vin->vdev.dev);
> -
>  	/*
>  	 * Try to configure with default parameters. Notice: this is the
>  	 * very first open, so, we cannot race against other calls,
> @@ -813,7 +811,6 @@ static int rvin_initialize_device(struct file *file)
>  
>  	return 0;
>  esfmt:
> -	pm_runtime_disable(&vin->vdev.dev);
>  	rvin_power_off(vin);
>  
>  	return ret;
> @@ -863,10 +860,8 @@ static int rvin_release(struct file *file)
>  	 * If this was the last open file.
>  	 * Then de-initialize hw module.
>  	 */
> -	if (fh_singular) {
> -		pm_runtime_disable(&vin->vdev.dev);
> +	if (fh_singular)
>  		rvin_power_off(vin);
> -	}
>  
>  	mutex_unlock(&vin->lock);
>  
> -- 
> 2.21.0
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
