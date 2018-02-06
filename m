Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:44569 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752212AbeBFAGY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 19:06:24 -0500
MIME-version: 1.0
Content-transfer-encoding: 8BIT
Content-type: text/plain; charset="utf-8"
Message-id: <5A78F17D.1010400@samsung.com>
Date: Tue, 06 Feb 2018 09:06:21 +0900
From: Inki Dae <inki.dae@samsung.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
        linux-renesas-soc@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/exynos: fix comparison to bitshift when dealing
 with a mask
In-reply-to: <20180205201002.23621-3-wsa+renesas@sang-engineering.com>
References: <20180205201002.23621-1-wsa+renesas@sang-engineering.com>
        <CGME20180205201026epcas5p214598aead48b3d8118b8f1fe114da8ec@epcas5p2.samsung.com>
        <20180205201002.23621-3-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



2018년 02월 06일 05:09에 Wolfram Sang 이(가) 쓴 글:
> Due to a typo, the mask was destroyed by a comparison instead of a bit
> shift.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Only build tested. To be applied individually per subsystem.
> 
>  drivers/gpu/drm/exynos/regs-fimc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/regs-fimc.h b/drivers/gpu/drm/exynos/regs-fimc.h
> index 30496134a3d072..d7cbe53c4c01f4 100644
> --- a/drivers/gpu/drm/exynos/regs-fimc.h
> +++ b/drivers/gpu/drm/exynos/regs-fimc.h
> @@ -569,7 +569,7 @@
>  #define EXYNOS_CIIMGEFF_FIN_EMBOSSING		(4 << 26)
>  #define EXYNOS_CIIMGEFF_FIN_SILHOUETTE		(5 << 26)
>  #define EXYNOS_CIIMGEFF_FIN_MASK			(7 << 26)
> -#define EXYNOS_CIIMGEFF_PAT_CBCR_MASK		((0xff < 13) | (0xff < 0))
> +#define EXYNOS_CIIMGEFF_PAT_CBCR_MASK		((0xff << 13) | (0xff << 0))
>  

Oops. Picked it up.

Thanks,
Inki Dae

>  /* Real input DMA size register */
>  #define EXYNOS_CIREAL_ISIZE_AUTOLOAD_ENABLE	(1 << 31)
> 
