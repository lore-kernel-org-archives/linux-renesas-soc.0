Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0288837F72D;
	Thu, 26 Mar 2026 15:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539223; cv=pass; b=GMLfz0FKQSHYU9twKEVC+OLjrI8YF6pyIFdd1WdxzQ8C+t+bEUF38k5/n0Js99urofWMaZxU6RpkD+9S1jTzliPSx55hRskoI3zrJTzMtFgR3plU7mWHUlsGgXNi8kei5VUobODShYHloEw5IZghxVAKJFvUcKL5Lwev1gaoNto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539223; c=relaxed/simple;
	bh=nGfnLesYR13qNlB0iaoKy+rd620g5TRhdi6N0vUhs88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPnV4firM6qQi4zYnTL5+SbSelHhNjMAErmzKLHwJhZlw5L3zZgdxcVEV7UV+EnjHYaPUK3hrLUQH5Vg+OureWWslkeUVMl8CRgQZQgqwuG1k05HCkb8CwUS9dNV1mduUO5lHi7ESDzMSk1JCtRZTFrwetrCdcSrxZ2abGeU4Qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=NxfZOdQn; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="NxfZOdQn"
ARC-Seal: i=1; a=rsa-sha256; t=1774539210; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Eg6fdgt0y5fOGIHKS+UKsoY3samybAC7yIgVyJMM7Iw6zWvqTAGGBpw/l1ulgUrD8io5Z0ptou2M2vJoH5gy++APSOKraCvc4rMYxEyXxavOEVxdhj/2pHxCoAIioDLk9YqUPsf+h+8/0b2qCx+NznGamC1oxHLUaJJAPLGVpM0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774539210; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0wcdsbWkSrAnmgL9+6UpLjpTKxBc6Zr/xz6jnshfDGw=; 
	b=dQ2CeFIpBw9gNcNFi7FmUHRQE13xd+fVpYQqtereR01gkyW6yK35wQxBvuUZXE3LVGsDoY8zb4MrsLjqGJU2ezl96HXPtQ2uyB8AAVm0kfgS5lFRjYvDbQnUhhjrwd+R7n2PUw3LtZ2uKt8hxK1PSDBXN32oU6Pk8Iqo864ZmUk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774539210;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=0wcdsbWkSrAnmgL9+6UpLjpTKxBc6Zr/xz6jnshfDGw=;
	b=NxfZOdQngsUkjJaBH4BIeUkdlENKr30NdoOD6QLQ/Tn/ih0fX5VpT7NAH5Yn/2XE
	5nDn1Prhm4ZiVjnY3vmmCELHBKNYN3bZIYQZaMuSG9hZOgngqKRK3/tmQDZKARNuspE
	Rxum1Ry21MGTWbGgavkwNusm3N+t956qE11BKQGQ=
Received: by mx.zohomail.com with SMTPS id 1774539208197622.9571966303812;
	Thu, 26 Mar 2026 08:33:28 -0700 (PDT)
Date: Thu, 26 Mar 2026 15:33:23 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Biju <biju.das.au@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Biju Das <biju.das.jz@bp.renesas.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/panfrost: Add GPU_PM_RT support for RZ/G3L SoC
Message-ID: <acVRuisdluSGURcU@sobremesa>
References: <20260320164158.487406-1-biju.das.jz@bp.renesas.com>
 <20260320164158.487406-5-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320164158.487406-5-biju.das.jz@bp.renesas.com>

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

On 20.03.2026 16:41, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> RZ/G3L SoC is embedded with Mali-G31 GPU system. Add GPU_PM_RT support as
> it needs to be assert/deassert the reset during suspend/resume.
>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Collected tag
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
> --
> 2.43.0


Adrian Larumbe
