Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34497 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754585AbcFGOjt (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 7 Jun 2016 10:39:49 -0400
Received: by mail-wm0-f67.google.com with SMTP id n184so24782998wmn.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jun 2016 07:39:48 -0700 (PDT)
Date: Tue, 7 Jun 2016 16:39:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Daniel Vetter <daniel.vetter@intel.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Inki Dae <inki.dae@samsung.com>,
	Joonyoung Shim <jy0922.shim@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Stefan Agner <stefan@agner.ch>,
	Alison Wang <alison.wang@freescale.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mark Yao <mark.yao@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Benjamin Gaignard <benjamin.gaignard@linaro.org>,
	Vincent Abriou <vincent.abriou@st.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Alexandre Courbot <gnurou@gmail.com>,
	Eric Anholt <eric@anholt.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 01/20] drm/atomic: Fix remaining places where
 !funcs->best_encoder is valid
Message-ID: <20160607143934.GA3363@phenom.ffwll.local>
References: <1465300095-16971-1-git-send-email-boris.brezillon@free-electrons.com>
 <1465300095-16971-2-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465300095-16971-2-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jun 07, 2016 at 01:47:56PM +0200, Boris Brezillon wrote:
> Adapt drm_pick_crtcs() and update_connector_routing() to fallback to
> drm_atomic_helper_best_encoder() if funcs->best_encoder() is NULL so
> that DRM drivers can leave this hook unassigned if they know they want
> to use drm_atomic_helper_best_encoder().
> 
> Update the vtables documentation accordingly.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Applied to drm-misc, thanks. I think I'll wait with the driver patches
until next week or so.
-Daniel

> ---
>  drivers/gpu/drm/drm_atomic_helper.c      |  4 +++-
>  drivers/gpu/drm/drm_fb_helper.c          | 13 ++++++++++++-
>  include/drm/drm_modeset_helper_vtables.h | 10 ++++++++--
>  3 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index f6a3350..849d029 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -300,8 +300,10 @@ update_connector_routing(struct drm_atomic_state *state,
>  	if (funcs->atomic_best_encoder)
>  		new_encoder = funcs->atomic_best_encoder(connector,
>  							 connector_state);
> -	else
> +	else if (funcs->best_encoder)
>  		new_encoder = funcs->best_encoder(connector);
> +	else
> +		new_encoder = drm_atomic_helper_best_encoder(connector);
>  
>  	if (!new_encoder) {
>  		DRM_DEBUG_ATOMIC("No suitable encoder found for [CONNECTOR:%d:%s]\n",
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 7c2eb75..d44389a 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -2000,7 +2000,18 @@ static int drm_pick_crtcs(struct drm_fb_helper *fb_helper,
>  		my_score++;
>  
>  	connector_funcs = connector->helper_private;
> -	encoder = connector_funcs->best_encoder(connector);
> +
> +	/*
> +	 * If the DRM device implements atomic hooks and ->best_encoder() is
> +	 * NULL we fallback to the default drm_atomic_helper_best_encoder()
> +	 * helper.
> +	 */
> +	if (fb_helper->dev->mode_config.funcs->atomic_commit &&
> +	    !connector_funcs->best_encoder)
> +		encoder = drm_atomic_helper_best_encoder(connector);
> +	else
> +		encoder = connector_funcs->best_encoder(connector);
> +
>  	if (!encoder)
>  		goto out;
>  
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index d4619dc..4e7a53b 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -736,6 +736,11 @@ struct drm_connector_helper_funcs {
>  	 * inspect dynamic configuration state should instead use
>  	 * @atomic_best_encoder.
>  	 *
> +	 * You can leave this function to NULL if the connector is only
> +	 * attached to a single encoder and you are using the atomic helpers.
> +	 * In this case, the core will call drm_atomic_helper_best_encoder()
> +	 * for you.
> +	 *
>  	 * RETURNS:
>  	 *
>  	 * Encoder that should be used for the given connector and connector
> @@ -752,8 +757,9 @@ struct drm_connector_helper_funcs {
>  	 * need to select the best encoder depending upon the desired
>  	 * configuration and can't select it statically.
>  	 *
> -	 * This function is used by drm_atomic_helper_check_modeset() and either
> -	 * this or @best_encoder is required.
> +	 * This function is used by drm_atomic_helper_check_modeset().
> +	 * If it is not implemented, the core will fallback to @best_encoder
> +	 * (or drm_atomic_helper_best_encoder() if @best_encoder is NULL).
>  	 *
>  	 * NOTE:
>  	 *
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
