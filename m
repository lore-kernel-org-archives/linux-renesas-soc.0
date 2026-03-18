Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7EA37754E;
	Wed, 18 Mar 2026 08:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773822269; cv=none; b=SRAQ5E/O1RlOWlDhuNn0Yj8bjNlyiffmqlPPFG6GeqEF6WKZgfWo1PaieUT0V+xGg8r3G03HpyLhICRqSENuin/VOCeAQRH3KzzwwMKTQuLp34LYt3OqG98eJNPsUipn3OnXxyStBkNsIkGPs3IPPAwDvb3Nt7nwOY9zsEXzu+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773822269; c=relaxed/simple;
	bh=TrfPgsd6cggOUD3bVAlUtptp+v1Fd2FWniQ9tH2teSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c7xc44lLvyX3fNvsnpVPMB64WiJZ7rDfPCshSu2i3hhIAF6cHhGFSOpTaocE4PW59cgtFiAPG//80/vjnrylD0zZF4u+cype3Z4k6Wlf7MSY6wOx52y8ssKACRvDw0GsmWtDhNHbms3+qL2DKPPIZLL2g12UOf2GNHn2GR+m10g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Hy9djTLA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Hy9djTLA"
Received: from [192.168.33.40] (185.182.214.153.nat.pool.zt.hu [185.182.214.153])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CE32379;
	Wed, 18 Mar 2026 09:23:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773822191;
	bh=TrfPgsd6cggOUD3bVAlUtptp+v1Fd2FWniQ9tH2teSA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hy9djTLA9CKCGlZ+qvuOjUIFRj8vmSjwp0Mpq8i9Adtu8GG8UaMF6ubtyCTpJYzeE
	 3DLr9GdthP73To/py3Rsn0gSOb5RixzuFvCUWYBqNfL60h9DZ0ppIMtB20mM4etAvU
	 qcrCugwoDC/JSuO0DnU3EXp4iMFiT8UxXUpS2g0w=
Message-ID: <3bafb4a0-e114-4a18-81d0-c3a86249e5f7@ideasonboard.com>
Date: Wed, 18 Mar 2026 09:24:19 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] media: rzv2h-ivc: Fix AXIRX_VBLANK register write
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
 =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?=
 <barnabas.pocze+renesas@ideasonboard.com>, stable@vger.kernel.org
References: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
 <20260313-mali-ivc-fixes-v7-0-v1-2-cb0714cd1279@ideasonboard.com>
From: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Content-Language: en-US, hu-HU
In-Reply-To: <20260313-mali-ivc-fixes-v7-0-v1-2-cb0714cd1279@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

2026. 03. 13. 12:13 keltezéssel, Jacopo Mondi írta:
> From: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
> 
> According to the documentation there are writable reserved bits in the
> register and those should not be set to 0. So use `rzv2h_ivc_update_bits()`
> with a proper bitmask.
> 
> Cc: stable@vger.kernel.org
> Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control block driver")
> Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>   drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c | 7 +++++--
>   drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h       | 2 +-
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> index 1e016b17dcee..bfe5b0c7045e 100644
> --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> @@ -7,6 +7,7 @@
>   
>   #include "rzv2h-ivc.h"
>   
> +#include <linux/bitfield.h>
>   #include <linux/cleanup.h>
>   #include <linux/iopoll.h>
>   #include <linux/lockdep.h>
> @@ -235,8 +236,10 @@ static void rzv2h_ivc_format_configure(struct rzv2h_ivc *ivc)
>   	hts = pix->width + RZV2H_IVC_FIXED_HBLANK;
>   	vblank = RZV2H_IVC_MIN_VBLANK(hts);
>   
> -	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_BLANK,
> -			RZV2H_IVC_VBLANK(vblank));
> +	rzv2h_ivc_update_bits(ivc, RZV2H_IVC_REG_AXIRX_BLANK,
> +			      RZV2H_IVC_AXIRX_BLANK_FIELD_VBLANK,
> +			      FIELD_PREP(RZV2H_IVC_AXIRX_BLANK_FIELD_VBLANK,
> +					 vblank));
>   }
>   
>   static void rzv2h_ivc_return_buffers(struct rzv2h_ivc *ivc,
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
> index 3bcaab990b0f..4ef44c8b4656 100644
> --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
> @@ -34,7 +34,7 @@
>   #define RZV2H_IVC_REG_AXIRX_HSIZE			0x0020
>   #define RZV2H_IVC_REG_AXIRX_VSIZE			0x0024
>   #define RZV2H_IVC_REG_AXIRX_BLANK			0x0028
> -#define RZV2H_IVC_VBLANK(x)				((x) << 16)
> +#define RZV2H_IVC_AXIRX_BLANK_FIELD_VBLANK		GENMASK(25, 16)

On second look, I have a small comment: I now greatly dislike how I have named this.
Especially that it is inconsistent with `RZV2H_IVC_REG_FM_STOP_FSTOP` in patch 4/7.
Possibly `RZV2H_IVC_REG_AXIRX_BLANK_VBLANK` or `RZV2H_IVC_REG_AXIRX_BLANK_FIELD_VBLANK`
would be better (although in the latter case I would rename the macro in patch 4/7 to
`RZV2H_IVC_REG_FM_STOP_FIELD_FSTOP`). The same applies to patch 3/7 as well, I'd now do
`RZV2H_IVC_REG_AXIRX_PXFMT_(FIELD_){CLFMT,DTYPE}` or similar. Sorry about that.


Regards,
Barnabás Pőcze


>   #define RZV2H_IVC_REG_AXIRX_STRD			0x0030
>   #define RZV2H_IVC_REG_AXIRX_ISSU			0x0040
>   #define RZV2H_IVC_REG_AXIRX_ERACT			0x0048
> 

