Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE6F27EFEE;
	Fri, 20 Mar 2026 12:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774008980; cv=none; b=KrIsR0y3eFXu4kiJW+xUI5KKz5IcvVUA61NMOV+WGJukqNxZpRP9ddvwRrnIxoabs5LdCfXkCewnlaHjQ4rshGMJMX8U+NxXBhJf5TLDOxrd63yJrzDuDPjGtvoBZ9L9PPzgxPRW5vvWWjFhjyHjMiKhqtkiITvWHmYZSFID4h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774008980; c=relaxed/simple;
	bh=ra+wDGJQCKxYGnu/qigw+BoNrrNMoNgxCbr7ASzjsYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bXAcnq0OXOsttIqIpqf+idjO3OmuJUO7p6KYOqgIHyl3eiUalsr0K6IXqJFvzweYXxHXt5Hn0rXnef8RDsO19aX3/ANXu21IBA+wSRrSeYBMflTqRv/+GZUV4LuCc4x49/EFLouk/dwkpbIpqgK/DzOQOKoxBuJWTKxQXgTwzzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9919165C;
	Fri, 20 Mar 2026 05:16:10 -0700 (PDT)
Received: from [10.1.29.20] (e122027.cambridge.arm.com [10.1.29.20])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 353E93F7BD;
	Fri, 20 Mar 2026 05:16:07 -0700 (PDT)
Message-ID: <ece36cc7-74f9-474e-935c-4e43c1c26e4a@arm.com>
Date: Fri, 20 Mar 2026 12:16:01 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/panfrost: Add GPU_PM_RT support for RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, =?UTF-8?Q?Adri=C3=A1n_Larumbe?=
 <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
 <20260304134845.267030-5-biju.das.jz@bp.renesas.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260304134845.267030-5-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/03/2026 13:48, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> RZ/G3L SoC is embedded with Mali-G31 GPU system. Add GPU_PM_RT support as
> it needs to be assert/deassert the reset during suspend/resume.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 711f5101aa04..3d0bdba2a474 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -1156,6 +1156,7 @@ static const struct of_device_id dt_match[] = {
>  	  .data = &amlogic_data, },
>  	{ .compatible = "amlogic,meson-g12a-mali",
>  	  .data = &amlogic_data, },
> +	{ .compatible = "renesas,r9a08g046-mali", .data = &default_pm_rt_data },
>  	{ .compatible = "renesas,r9a09g047-mali", .data = &default_pm_rt_data },
>  	{ .compatible = "arm,mali-t604", .data = &default_data, },
>  	{ .compatible = "arm,mali-t624", .data = &default_data, },

