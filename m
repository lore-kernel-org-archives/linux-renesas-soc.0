Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE35378D70
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jul 2026 16:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785255793; cv=none; b=QDrlX4LkqfmiDcK1noDReIVADqvs9AWv3Bj/xLHKKPb3fLkzSzC9JV2vqGY7y6iGa4ZFUd9/tx2EWqxZ4Nhw3M60jc67DLsWoHd5CR3aqk+ViHif0Q1lQ67IHqU942IFX3Y03GB60sDDQFg55gHNj9iyIDxCLrxrSFHjdrOJjus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785255793; c=relaxed/simple;
	bh=MuoYv/trvB+apkFilFU7ge8EmIYL0Cz7Mp4H5bYBY04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaDX4vm4HDyPOrKJOoA66cM/4S7NSPElqYWiJLJdxrSUarkYipB3Mf048C1H5xs0mlIOYXZJP3y+pVw3PaQlDKXxHn/Q41pu/oE2+1nNUn3n6m/IrdGhBmyeX1RnHDNSmCwiDfcEDkWtJ6ZodBH8DnVizDb2tpSsja5r6gI+1/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Bdx3XlI0; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Bdx3XlI0"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEA8A169E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jul 2026 09:23:06 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AFC5B3F763
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jul 2026 09:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785255790; bh=MuoYv/trvB+apkFilFU7ge8EmIYL0Cz7Mp4H5bYBY04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bdx3XlI0i8xaEKp63r/Vx0Xv9RdmagLUmglyPy87En3WipYQkWiMvr+yHzCByTAqn
	 aIuRc4mjMH9nh2vwiQoZiemJfyhicx5fbXFekDQln1Xi1eoJHBW+0bCop2o/ktEjzs
	 FqNxKdqKktSABaOqbo36mkT2Ap7Q6R+JCp7nb8Qw=
Date: Tue, 28 Jul 2026 17:21:58 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Diogo Silva <diogompaissilva@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Michal Simek <michal.simek@amd.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
	Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Xinliang Liu <xinliang.liu@linaro.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 12/15] drm/arm/komeda: remove dependency on DRM simple
 helpers
Message-ID: <amjXJrbgka00CQX2@e142607>
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
 <20260719-drm_simple_encoder_init-v1-12-a78c509e3062@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260719-drm_simple_encoder_init-v1-12-a78c509e3062@gmail.com>

On Sun, Jul 19, 2026 at 01:35:43AM +0200, Diogo Silva wrote:
> The simple KMS helpers are deprecated because they only add an
> intermediate layer between drivers and atomic modesetting.
> 
> Open-code drm_simple_encoder_init() by calling drm_encoder_init()
> directly and providing driver-local drm_encoder_funcs.
> 
> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_crtc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> index e8cb782a6f8e..719568d9f7c2 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -11,9 +11,9 @@
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_encoder.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_vblank.h>
> -#include <drm/drm_simple_kms_helper.h>
>  #include <drm/drm_bridge.h>
>  
>  #include "komeda_dev.h"
> @@ -635,6 +635,10 @@ static int komeda_attach_bridge(struct device *dev,
>  	return err;
>  }
>  
> +static const struct drm_encoder_funcs komeda_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
>  static int komeda_crtc_add(struct komeda_kms_dev *kms,
>  			   struct komeda_crtc *kcrtc)
>  {
> @@ -658,7 +662,8 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
>  	 * bridge
>  	 */
>  	kcrtc->encoder.possible_crtcs = drm_crtc_mask(crtc);
> -	err = drm_simple_encoder_init(base, encoder, DRM_MODE_ENCODER_TMDS);
> +	err = drm_encoder_init(base, encoder, &komeda_encoder_funcs,
> +			       DRM_MODE_ENCODER_TMDS, NULL);
>  	if (err)
>  		return err;
>  
> 
> -- 
> 2.54.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
