Return-Path: <SRS0=fG2q=3Z=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5A5C35247
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  5 Feb 2020 17:33:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B863920659
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  5 Feb 2020 17:33:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rAYlUf5z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbgBERdj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 5 Feb 2020 12:33:39 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58092 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgBERdj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Feb 2020 12:33:39 -0500
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B5D84F8;
        Wed,  5 Feb 2020 18:33:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1580924017;
        bh=3rppcfl802crYXV1mq6To15oEXeQJ2Eo2DfgnPf0fxQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rAYlUf5zqywJCno3IDvWoX0GxB10MYGQQsR2ZfVibQKKSbiAu0rcwCgeDo+FvtRP5
         TpvAiz0X+S6OzwGKVwpHpD6a0RTTsFq+v567Rjlhuyem2HETsAlhIXBuS4wBvks0oY
         X+LDaZ1rkJqWGmmWgIZKAqHxT1r2aLwqTOA31hKg=
Date:   Wed, 5 Feb 2020 19:33:22 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] drm: shmobile: Reduce include dependencies
Message-ID: <20200205173322.GB4722@pendragon.ideasonboard.com>
References: <20200205093226.72064-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200205093226.72064-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

Thank you for the patch.

On Wed, Feb 05, 2020 at 11:32:26AM +0200, Andy Shevchenko wrote:
> This file doesn't need everything provided by <linux/kernel.h>.
> All it needs are some types, which are provided by <linux/types.h>.
> 
> Note, <drm/drm_mode.h> already includes <linux/types.h>, but
> not relying on implicit includes is indeed a good thing.

Do we even need linux/types.h ? Apart from struct drm_mode_modeinfo,
shmob_drm.h seems to only contain plain C without using any externally
defined types.

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: Update commit message (Geert, Laurent)
>  include/linux/platform_data/shmob_drm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/platform_data/shmob_drm.h b/include/linux/platform_data/shmob_drm.h
> index fe815d7d9f58..08605fdb2226 100644
> --- a/include/linux/platform_data/shmob_drm.h
> +++ b/include/linux/platform_data/shmob_drm.h
> @@ -10,7 +10,7 @@
>  #ifndef __SHMOB_DRM_H__
>  #define __SHMOB_DRM_H__
>  
> -#include <linux/kernel.h>
> +#include <linux/types.h>
>  
>  #include <drm/drm_mode.h>
>  

-- 
Regards,

Laurent Pinchart
