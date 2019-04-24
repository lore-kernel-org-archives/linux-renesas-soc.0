Return-Path: <SRS0=xaBA=S2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370EBC10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 08:15:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F423A208E4
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 08:15:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ToE+MSsU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbfDXIPv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 24 Apr 2019 04:15:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40842 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727350AbfDXIPv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Apr 2019 04:15:51 -0400
Received: from [192.168.43.26] (unknown [149.254.234.198])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 860DD5F;
        Wed, 24 Apr 2019 10:15:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1556093748;
        bh=9RC96SplLzDb7U7aPOskJGh4ukqTfvWDditqM7P+Umk=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ToE+MSsUa8nZ7VP9or77Rf8oJCLQd0QKtvXsO0DCB0cIuHGOR3wNzvdKQk+1A66Xk
         FRpVwKIfpiQ15j/BW3NDRmNSRo9kKiTEfLlmDmodkSW+SaVrW7oaV6fXxHiOmPYNxc
         /AnsxItVEb4PHrL7Sv2xCTIW8w0OrfVPKDviuqOg=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH/RFC 01/15] drm: Clarify definition of the
 DRM_BUS_FLAG_(PIXDATA|SYNC)_* macros
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190306232345.23052-2-laurent.pinchart+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 sbsRB8KNNvVXBOVNwko86rQqF9drZuw=
Organization: Ideas on Board
Message-ID: <827c40e2-5c1f-4a13-4d97-1c4368809c79@ideasonboard.com>
Date:   Wed, 24 Apr 2019 09:15:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190306232345.23052-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Thank you for the patch,

On 06/03/2019 23:23, Laurent Pinchart wrote:
> The DRM_BUS_FLAG_PIXDATA_POSEDGE and DRM_BUS_FLAG_PIXDATA_NEGEDGE macros
> and their DRM_BUS_FLAG_SYNC_* counterparts define on which pixel clock
> edge data and sync signals are driven. They are however used in some
> drivers to define on which pixel clock edge data and sync signals are
> sampled, which should usually (but not always) be the opposite edge of
> the driving edge. This creates confusion.
> 
> Create four new macros for both PIXDATA and SYNC that explicitly state
> the driving and sampling edge in their name to remove the confusion. The
> driving macros are defined as the opposite of the sampling macros to
> made code simpler based on the assumption that the driving and sampling

s/made/make/

> edges are opposite.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>



> ---
>  include/drm/drm_connector.h | 36 ++++++++++++++++++++++++++++++++----
>  1 file changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8fe22abb1e10..411c0eb4c00e 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -330,19 +330,47 @@ struct drm_display_info {
>  
>  #define DRM_BUS_FLAG_DE_LOW		(1<<0)
>  #define DRM_BUS_FLAG_DE_HIGH		(1<<1)
> -/* drive data on pos. edge */
> +
> +/*
> + * Don't use those two flags directly, use the DRM_BUS_FLAG_PIXDATA_DRIVE_*
> + * and DRM_BUS_FLAG_PIXDATA_SAMPLE_* variants to qualify the flags explicitly.
> + * The DRM_BUS_FLAG_PIXDATA_SAMPLE_* flags are defined as the opposite of the
> + * DRM_BUS_FLAG_PIXDATA_DRIVE_* flags to make code simpler, as signals are
> + * usually to be sampled on the opposite edge of the driving edge.
> + */
>  #define DRM_BUS_FLAG_PIXDATA_POSEDGE	(1<<2)
> -/* drive data on neg. edge */
>  #define DRM_BUS_FLAG_PIXDATA_NEGEDGE	(1<<3)
> +
> +/* Drive data on rising edge */
> +#define DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE	DRM_BUS_FLAG_PIXDATA_POSEDGE
> +/* Drive data on falling edge */
> +#define DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE	DRM_BUS_FLAG_PIXDATA_NEGEDGE
> +/* Sample data on rising edge */
> +#define DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE	DRM_BUS_FLAG_PIXDATA_NEGEDGE
> +/* Sample data on falling edge */
> +#define DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE	DRM_BUS_FLAG_PIXDATA_POSEDGE
> +
>  /* data is transmitted MSB to LSB on the bus */
>  #define DRM_BUS_FLAG_DATA_MSB_TO_LSB	(1<<4)
>  /* data is transmitted LSB to MSB on the bus */
>  #define DRM_BUS_FLAG_DATA_LSB_TO_MSB	(1<<5)
> -/* drive sync on pos. edge */
> +
> +/*
> + * Similarly to the DRM_BUS_FLAG_PIXDATA_* flags, don't use these two flags
> + * directly, use one of the DRM_BUS_FLAG_SYNC_(DRIVE|SAMPLE)_* instead.
> + */
>  #define DRM_BUS_FLAG_SYNC_POSEDGE	(1<<6)
> -/* drive sync on neg. edge */
>  #define DRM_BUS_FLAG_SYNC_NEGEDGE	(1<<7)
>  
> +/* Drive sync on rising edge */
> +#define DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE		DRM_BUS_FLAG_SYNC_POSEDGE
> +/* Drive sync on falling edge */
> +#define DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE		DRM_BUS_FLAG_SYNC_NEGEDGE
> +/* Sample sync on rising edge */
> +#define DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE	DRM_BUS_FLAG_SYNC_NEGEDGE
> +/* Sample sync on falling edge */
> +#define DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE	DRM_BUS_FLAG_SYNC_POSEDGE
> +
>  	/**
>  	 * @bus_flags: Additional information (like pixel signal polarity) for
>  	 * the pixel data on the bus, using DRM_BUS_FLAGS\_ defines.
> 

-- 
Regards
--
Kieran
