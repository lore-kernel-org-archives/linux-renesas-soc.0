Return-Path: <SRS0=9KLO=XG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC90C49ED6
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 11 Sep 2019 22:41:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3EAB52089F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 11 Sep 2019 22:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568241714;
	bh=S7k9+7deU42jLNS2H9i2XlXGswPeZvkhOLSvHN9qtfM=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=PHmVZIHpMBCS7jFInIZaBHB34yFBVc54yfCudt3XFsYjKXtmRHKXq7VQYoo4+Gduv
	 y6bMzXpOAC3z3F54J6kIMgjTq/2MfDx31v2w/MFEEg6b2yxrV8zWYy5L55zQVIU4mb
	 UKMluJMbYOkj7v/4dutIb0BUl1a4IOrsDtYlk5XI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbfIKWly (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 11 Sep 2019 18:41:54 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42784 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727664AbfIKWlx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Sep 2019 18:41:53 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E01D133A;
        Thu, 12 Sep 2019 00:41:51 +0200 (CEST)
Subject: Re: [PATCH] rcar-vin: Use bytes per line instead of width for UV
 offset
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190905212517.7872-1-niklas.soderlund+renesas@ragnatech.se>
From:   Kieran Bingham <kbingham@kernel.org>
Message-ID: <08a28d4c-e975-91a6-8830-51f96ec371c6@kernel.org>
Date:   Wed, 11 Sep 2019 23:41:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905212517.7872-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On 05/09/2019 22:25, Niklas Söderlund wrote:
> The image size is doubled for NV16 and is calculated as bytesperline *
> height * 2 to accommodate the split of UV data. When writing the offset
> to hardware width is used instead of bytesperline, fix this.

s/hardware width/hardware, the width/ ?


> 

Eeep, Subtle bug :)

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index c7859b329dd4f02a..af4f774149f08597 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -703,8 +703,8 @@ static int rvin_setup(struct rvin_dev *vin)
>  	switch (vin->format.pixelformat) {
>  	case V4L2_PIX_FMT_NV16:
>  		rvin_write(vin,
> -			   ALIGN(vin->format.width * vin->format.height, 0x80),
> -			   VNUVAOF_REG);
> +			   ALIGN(vin->format.bytesperline * vin->format.height,
> +				 0x80), VNUVAOF_REG);
>  		dmr = VNDMR_DTMD_YCSEP;
>  		output_is_yuv = true;
>  		break;
> 

