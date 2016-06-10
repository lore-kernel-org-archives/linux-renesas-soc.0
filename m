Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34871 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753131AbcFJPYS (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 10 Jun 2016 11:24:18 -0400
Received: by mail-wm0-f68.google.com with SMTP id k184so18677592wme.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jun 2016 08:24:17 -0700 (PDT)
Date: Fri, 10 Jun 2016 17:24:12 +0200
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
Subject: Re: [PATCH v2 06/20] drm: i915: Rely on the default ->best_encoder()
 behavior where appropriate
Message-ID: <20160610152412.GL3363@phenom.ffwll.local>
References: <1465300095-16971-1-git-send-email-boris.brezillon@free-electrons.com>
 <1465300095-16971-7-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465300095-16971-7-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jun 07, 2016 at 01:48:01PM +0200, Boris Brezillon wrote:
> For all outputs except dp_mst, we have a 1:1 relationship between
> connectors and encoders and the driver is relying on the atomic helpers:
> we can drop the custom ->best_encoder() implementation and let the core
> call drm_atomic_helper_best_encoder() for us.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

You can also drop the best_encoder from intel_dp_mst, we only need the
atomic_best_encoder. The best_encoder there was needed to help out the
fbdev emulation. Care to respin?
-Daniel

> ---
>  drivers/gpu/drm/i915/intel_crt.c     | 1 -
>  drivers/gpu/drm/i915/intel_display.c | 8 --------
>  drivers/gpu/drm/i915/intel_dp.c      | 1 -
>  drivers/gpu/drm/i915/intel_drv.h     | 1 -
>  drivers/gpu/drm/i915/intel_dsi.c     | 1 -
>  drivers/gpu/drm/i915/intel_dvo.c     | 1 -
>  drivers/gpu/drm/i915/intel_hdmi.c    | 1 -
>  drivers/gpu/drm/i915/intel_lvds.c    | 1 -
>  drivers/gpu/drm/i915/intel_sdvo.c    | 1 -
>  drivers/gpu/drm/i915/intel_tv.c      | 1 -
>  10 files changed, 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_crt.c b/drivers/gpu/drm/i915/intel_crt.c
> index 3fbb6fc..bd0cd68 100644
> --- a/drivers/gpu/drm/i915/intel_crt.c
> +++ b/drivers/gpu/drm/i915/intel_crt.c
> @@ -753,7 +753,6 @@ static const struct drm_connector_funcs intel_crt_connector_funcs = {
>  static const struct drm_connector_helper_funcs intel_crt_connector_helper_funcs = {
>  	.mode_valid = intel_crt_mode_valid,
>  	.get_modes = intel_crt_get_modes,
> -	.best_encoder = intel_best_encoder,
>  };
>  
>  static const struct drm_encoder_funcs intel_crt_enc_funcs = {
> diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
> index 2113f40..77026ce 100644
> --- a/drivers/gpu/drm/i915/intel_display.c
> +++ b/drivers/gpu/drm/i915/intel_display.c
> @@ -16113,14 +16113,6 @@ void intel_modeset_cleanup(struct drm_device *dev)
>  	intel_teardown_gmbus(dev);
>  }
>  
> -/*
> - * Return which encoder is currently attached for connector.
> - */
> -struct drm_encoder *intel_best_encoder(struct drm_connector *connector)
> -{
> -	return &intel_attached_encoder(connector)->base;
> -}
> -
>  void intel_connector_attach_encoder(struct intel_connector *connector,
>  				    struct intel_encoder *encoder)
>  {
> diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
> index f192f58..21b2833 100644
> --- a/drivers/gpu/drm/i915/intel_dp.c
> +++ b/drivers/gpu/drm/i915/intel_dp.c
> @@ -4935,7 +4935,6 @@ static const struct drm_connector_funcs intel_dp_connector_funcs = {
>  static const struct drm_connector_helper_funcs intel_dp_connector_helper_funcs = {
>  	.get_modes = intel_dp_get_modes,
>  	.mode_valid = intel_dp_mode_valid,
> -	.best_encoder = intel_best_encoder,
>  };
>  
>  static const struct drm_encoder_funcs intel_dp_enc_funcs = {
> diff --git a/drivers/gpu/drm/i915/intel_drv.h b/drivers/gpu/drm/i915/intel_drv.h
> index a28b4aa..79a4d6b 100644
> --- a/drivers/gpu/drm/i915/intel_drv.h
> +++ b/drivers/gpu/drm/i915/intel_drv.h
> @@ -1128,7 +1128,6 @@ struct intel_connector *intel_connector_alloc(void);
>  bool intel_connector_get_hw_state(struct intel_connector *connector);
>  void intel_connector_attach_encoder(struct intel_connector *connector,
>  				    struct intel_encoder *encoder);
> -struct drm_encoder *intel_best_encoder(struct drm_connector *connector);
>  struct drm_display_mode *intel_crtc_mode_get(struct drm_device *dev,
>  					     struct drm_crtc *crtc);
>  enum pipe intel_get_pipe_from_connector(struct intel_connector *connector);
> diff --git a/drivers/gpu/drm/i915/intel_dsi.c b/drivers/gpu/drm/i915/intel_dsi.c
> index 366ad6c..ec51952 100644
> --- a/drivers/gpu/drm/i915/intel_dsi.c
> +++ b/drivers/gpu/drm/i915/intel_dsi.c
> @@ -1378,7 +1378,6 @@ static const struct drm_encoder_funcs intel_dsi_funcs = {
>  static const struct drm_connector_helper_funcs intel_dsi_connector_helper_funcs = {
>  	.get_modes = intel_dsi_get_modes,
>  	.mode_valid = intel_dsi_mode_valid,
> -	.best_encoder = intel_best_encoder,
>  };
>  
>  static const struct drm_connector_funcs intel_dsi_connector_funcs = {
> diff --git a/drivers/gpu/drm/i915/intel_dvo.c b/drivers/gpu/drm/i915/intel_dvo.c
> index 286baec..34b7e3f 100644
> --- a/drivers/gpu/drm/i915/intel_dvo.c
> +++ b/drivers/gpu/drm/i915/intel_dvo.c
> @@ -351,7 +351,6 @@ static const struct drm_connector_funcs intel_dvo_connector_funcs = {
>  static const struct drm_connector_helper_funcs intel_dvo_connector_helper_funcs = {
>  	.mode_valid = intel_dvo_mode_valid,
>  	.get_modes = intel_dvo_get_modes,
> -	.best_encoder = intel_best_encoder,
>  };
>  
>  static void intel_dvo_enc_destroy(struct drm_encoder *encoder)
> diff --git a/drivers/gpu/drm/i915/intel_hdmi.c b/drivers/gpu/drm/i915/intel_hdmi.c
> index 2c3bd9c..aef4bc8 100644
> --- a/drivers/gpu/drm/i915/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/intel_hdmi.c
> @@ -2114,7 +2114,6 @@ static const struct drm_connector_funcs intel_hdmi_connector_funcs = {
>  static const struct drm_connector_helper_funcs intel_hdmi_connector_helper_funcs = {
>  	.get_modes = intel_hdmi_get_modes,
>  	.mode_valid = intel_hdmi_mode_valid,
> -	.best_encoder = intel_best_encoder,
>  };
>  
>  static const struct drm_encoder_funcs intel_hdmi_enc_funcs = {
> diff --git a/drivers/gpu/drm/i915/intel_lvds.c b/drivers/gpu/drm/i915/intel_lvds.c
> index bc53c0d..d4faa5a 100644
> --- a/drivers/gpu/drm/i915/intel_lvds.c
> +++ b/drivers/gpu/drm/i915/intel_lvds.c
> @@ -547,7 +547,6 @@ static int intel_lvds_set_property(struct drm_connector *connector,
>  static const struct drm_connector_helper_funcs intel_lvds_connector_helper_funcs = {
>  	.get_modes = intel_lvds_get_modes,
>  	.mode_valid = intel_lvds_mode_valid,
> -	.best_encoder = intel_best_encoder,
>  };
>  
>  static const struct drm_connector_funcs intel_lvds_connector_funcs = {
> diff --git a/drivers/gpu/drm/i915/intel_sdvo.c b/drivers/gpu/drm/i915/intel_sdvo.c
> index 2128fae..5cd48ff 100644
> --- a/drivers/gpu/drm/i915/intel_sdvo.c
> +++ b/drivers/gpu/drm/i915/intel_sdvo.c
> @@ -2191,7 +2191,6 @@ static const struct drm_connector_funcs intel_sdvo_connector_funcs = {
>  static const struct drm_connector_helper_funcs intel_sdvo_connector_helper_funcs = {
>  	.get_modes = intel_sdvo_get_modes,
>  	.mode_valid = intel_sdvo_mode_valid,
> -	.best_encoder = intel_best_encoder,
>  };
>  
>  static void intel_sdvo_enc_destroy(struct drm_encoder *encoder)
> diff --git a/drivers/gpu/drm/i915/intel_tv.c b/drivers/gpu/drm/i915/intel_tv.c
> index 223129d..47fe241 100644
> --- a/drivers/gpu/drm/i915/intel_tv.c
> +++ b/drivers/gpu/drm/i915/intel_tv.c
> @@ -1512,7 +1512,6 @@ static const struct drm_connector_funcs intel_tv_connector_funcs = {
>  static const struct drm_connector_helper_funcs intel_tv_connector_helper_funcs = {
>  	.mode_valid = intel_tv_mode_valid,
>  	.get_modes = intel_tv_get_modes,
> -	.best_encoder = intel_best_encoder,
>  };
>  
>  static const struct drm_encoder_funcs intel_tv_enc_funcs = {
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
