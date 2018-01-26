Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:36377 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751427AbeAZFXx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jan 2018 00:23:53 -0500
Received: by mail-pf0-f195.google.com with SMTP id 23so7542031pfp.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2018 21:23:52 -0800 (PST)
Subject: Re: [PATCH 5/5] drm: Don't pass clip to
 drm_atomic_helper_check_plane_state()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
        dri-devel@lists.freedesktop.org
Cc: Liviu Dudau <liviu.dudau@arm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Mali DP Maintainers <malidp@foss.arm.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Gustavo Padovan <gustavo@padovan.org>,
        Sean Paul <seanpaul@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        CK Hu <ck.hu@mediatek.com>, Rob Clark <robdclark@gmail.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Sinclair Yeh <syeh@vmware.com>,
        Thomas Hellstrom <thellstrom@vmware.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Archit Taneja <architt@codeaurora.org>,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Russell King <rmk+kernel@armlinux.org.uk>
References: <20180123170857.13818-1-ville.syrjala@linux.intel.com>
 <20180123170857.13818-5-ville.syrjala@linux.intel.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <f9c154e9-afa9-ae58-11fd-c8b5489caccb@baylibre.com>
Date: Fri, 26 Jan 2018 06:23:41 +0100
MIME-Version: 1.0
In-Reply-To: <20180123170857.13818-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 23/01/2018 18:08, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Move the plane clip rectangle handling into
> drm_atomic_helper_check_plane_state(). Drivers no longer
> have to worry about such mundane details.
> 
> v2: Convert armada, rcar, and sun4i as well
> 
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: Mali DP Maintainers <malidp@foss.arm.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Gustavo Padovan <gustavo@padovan.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: CK Hu <ck.hu@mediatek.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko Stübner" <heiko@sntech.de>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> Cc: Sinclair Yeh <syeh@vmware.com>
> Cc: Thomas Hellstrom <thellstrom@vmware.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Archit Taneja <architt@codeaurora.org>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Cc: Russell King <rmk+kernel@armlinux.org.uk>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Archit Taneja <architt@codeaurora.org> #msm
> ---
>  drivers/gpu/drm/arm/hdlcd_crtc.c            |  7 +------
>  drivers/gpu/drm/arm/malidp_planes.c         |  7 +------
>  drivers/gpu/drm/armada/armada_crtc.c        |  8 ++------
>  drivers/gpu/drm/armada/armada_overlay.c     |  8 ++------
>  drivers/gpu/drm/drm_atomic_helper.c         | 12 +++++++-----
>  drivers/gpu/drm/drm_plane_helper.c          | 11 +++--------
>  drivers/gpu/drm/drm_simple_kms_helper.c     |  6 ------
>  drivers/gpu/drm/i915/intel_display.c        | 12 ------------
>  drivers/gpu/drm/imx/ipuv3-plane.c           |  7 +------
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    |  7 +------
>  drivers/gpu/drm/meson/meson_plane.c         |  7 +------
>  drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c   | 14 ++------------
>  drivers/gpu/drm/nouveau/nv50_display.c      | 12 ------------
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c     |  7 +------
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c |  7 +------
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c      |  7 +------
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c      |  7 +------
>  drivers/gpu/drm/tegra/plane.c               |  7 +------
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c         |  7 +------
>  drivers/gpu/drm/zte/zx_plane.c              | 13 +------------
>  include/drm/drm_atomic_helper.h             |  1 -
>  include/drm/drm_plane_helper.h              |  1 -
>  22 files changed, 28 insertions(+), 147 deletions(-)
> 
[...]

> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> index 3801bee1f9e6..c78a3a59f58c 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -49,7 +49,6 @@ static int meson_plane_atomic_check(struct drm_plane *plane,
>  				    struct drm_plane_state *state)
>  {
>  	struct drm_crtc_state *crtc_state;
> -	struct drm_rect clip = { 0, };
>  
>  	if (!state->crtc)
>  		return 0;
> @@ -58,11 +57,7 @@ static int meson_plane_atomic_check(struct drm_plane *plane,
>  	if (IS_ERR(crtc_state))
>  		return PTR_ERR(crtc_state);
>  
> -	if (crtc_state->enable)
> -		drm_mode_get_hv_timing(&crtc_state->mode,
> -				       &clip.x2, &clip.y2);
> -
> -	return drm_atomic_helper_check_plane_state(state, crtc_state, &clip,
> +	return drm_atomic_helper_check_plane_state(state, crtc_state,
>  						   DRM_PLANE_HELPER_NO_SCALING,
>  						   DRM_PLANE_HELPER_NO_SCALING,
>  						   true, true);

[...]

> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 4842ee9485ce..26aaba58d6ce 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -40,7 +40,6 @@ int drm_atomic_helper_check_modeset(struct drm_device *dev,
>  				struct drm_atomic_state *state);
>  int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  					const struct drm_crtc_state *crtc_state,
> -					const struct drm_rect *clip,
>  					int min_scale,
>  					int max_scale,
>  					bool can_position,
> diff --git a/include/drm/drm_plane_helper.h b/include/drm/drm_plane_helper.h
> index 8aa49c0ecd4d..28d7ce620729 100644
> --- a/include/drm/drm_plane_helper.h
> +++ b/include/drm/drm_plane_helper.h
> @@ -43,7 +43,6 @@ int drm_plane_helper_check_update(struct drm_plane *plane,
>  				  struct drm_framebuffer *fb,
>  				  struct drm_rect *src,
>  				  struct drm_rect *dest,
> -				  const struct drm_rect *clip,
>  				  unsigned int rotation,
>  				  int min_scale,
>  				  int max_scale,
> 

For meson driver,

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
