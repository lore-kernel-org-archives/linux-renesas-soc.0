Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F9E1DFFD;
	Fri, 20 Mar 2026 12:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774008966; cv=none; b=NYIRdF6AAnKaAw4Xtx2d/XPeIvVc0BKhjTlhwpiu3B9McVu5Iy6PYysyLKd2KvPa/RJZMUMMWwb4epdMyp8s3a3+C6rEbRVy8LQxBG308v5STQRewWq4YXamIbrCfJfvO7LH6Xvvk0A3uWCOWe4bVTtRPX00HYN7zWPr/IgBj4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774008966; c=relaxed/simple;
	bh=uMrwWUP0E6wAbQRkPYaq9r7hVOvPtzcKje+XjFfFmNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ls1vTBbcteczLRc/bDsM9VYZUJ0By83HgK9kB6g2Hca+gHEWOg3pk8FDgyB9e45epd/XTrfFSdSCHi70Cs0XIrn3CaLRuULk1b2fHoyJopMZc2/ytQlfGPIP6cgG0iFIK02Yv4NWG2vsThosWVdniXWqSzvxuk2PL3RNYcsrLeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F509165C;
	Fri, 20 Mar 2026 05:15:57 -0700 (PDT)
Received: from [10.1.29.20] (e122027.cambridge.arm.com [10.1.29.20])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A63703F7BD;
	Fri, 20 Mar 2026 05:15:59 -0700 (PDT)
Message-ID: <d44daa8f-ded3-4118-abad-19113c5ffb0a@arm.com>
Date: Fri, 20 Mar 2026 12:15:57 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/panfrost: Drop redundant optional clock checks in
 runtime PM
To: Biju <biju.das.au@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, =?UTF-8?Q?Adri=C3=A1n_Larumbe?=
 <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org
References: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
 <20260304134845.267030-3-biju.das.jz@bp.renesas.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260304134845.267030-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/03/2026 13:48, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The clk_enable() and clk_disable() APIs already handle NULL clock pointers
> gracefully — clk_enable() returns 0 and clk_disable() returns immediately
> when passed a NULL or optional clock. The explicit if (pfdev->bus_clock)
> guards around these calls in the runtime suspend/resume paths are
> therefore unnecessary. Remove them to simplify the code.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index dedc13e56631..01e702a0b2f0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -429,11 +429,9 @@ static int panfrost_device_runtime_resume(struct device *dev)
>  		if (ret)
>  			goto err_clk;
>  
> -		if (pfdev->bus_clock) {
> -			ret = clk_enable(pfdev->bus_clock);
> -			if (ret)
> -				goto err_bus_clk;
> -		}
> +		ret = clk_enable(pfdev->bus_clock);
> +		if (ret)
> +			goto err_bus_clk;
>  	}
>  
>  	panfrost_device_reset(pfdev, true);
> @@ -464,9 +462,7 @@ static int panfrost_device_runtime_suspend(struct device *dev)
>  	panfrost_gpu_power_off(pfdev);
>  
>  	if (pfdev->comp->pm_features & BIT(GPU_PM_RT)) {
> -		if (pfdev->bus_clock)
> -			clk_disable(pfdev->bus_clock);
> -
> +		clk_disable(pfdev->bus_clock);
>  		clk_disable(pfdev->clock);
>  		reset_control_assert(pfdev->rstc);
>  	}

