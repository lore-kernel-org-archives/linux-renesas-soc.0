Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:42172 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754890AbeDTNWI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 09:22:08 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] ARM: shmobile: Disable CONFIG_FB_SH_MOBILE_MERAM
Date: Fri, 20 Apr 2018 16:22:17 +0300
Message-ID: <6931756.nNlHN008Ox@avalon>
In-Reply-To: <1524230141-7612-1-git-send-email-geert+renesas@glider.be>
References: <1524230141-7612-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thank you for the patches.

For the whole series,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On Friday, 20 April 2018 16:15:39 EEST Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> The last Renesas ARM platform using this driver was removed in commit
> a521422ea4ae6128 ("ARM: shmobile: mackerel: Remove Legacy C board
> code"), hence CONFIG_FB_SH_MOBILE_MERAM can be disabled.
> 
> Thanks!
> 
> Geert Uytterhoeven (2):
>   ARM: shmobile: defconfig: Disable CONFIG_FB_SH_MOBILE_MERAM
>   ARM: multi_v7_defconfig: Disable CONFIG_FB_SH_MOBILE_MERAM
> 
>  arch/arm/configs/multi_v7_defconfig | 1 -
>  arch/arm/configs/shmobile_defconfig | 1 -
>  2 files changed, 2 deletions(-)


-- 
Regards,

Laurent Pinchart
