Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH 10/20] drm: rockchip: Rely on the default ->best_encoder()
 behavior
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Daniel Vetter <daniel.vetter@intel.com>
References: <1464877907-27723-1-git-send-email-boris.brezillon@free-electrons.com>
 <1464877907-27723-11-git-send-email-boris.brezillon@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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
From: Mark yao <mark.yao@rock-chips.com>
Message-ID: <57561AAA.5060500@rock-chips.com>
Date: Tue, 7 Jun 2016 08:51:54 +0800
MIME-Version: 1.0
In-Reply-To: <1464877907-27723-11-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2016年06月02日 22:31, Boris Brezillon wrote:
> All outputss have a 1:1 relationship between connectors and encoders
> and the driver is relying on the atomic helpers: we can drop the custom
> ->best_encoder() implementations  and let the core call
> drm_atomic_helper_best_encoder() for us.

Good, All connectors and encoders is 1:1 relationship on rockchip 
outputs, so

Acked-by: Mark Yao <mark.yao@rock-chips.com>

>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>   drivers/gpu/drm/rockchip/dw-mipi-dsi.c | 9 ---------
>   drivers/gpu/drm/rockchip/inno_hdmi.c   | 9 ---------
>   2 files changed, 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
> index dedc65b..ca22e5e 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
> @@ -964,18 +964,9 @@ static enum drm_mode_status dw_mipi_dsi_mode_valid(
>   	return mode_status;
>   }
>   
> -static struct drm_encoder *dw_mipi_dsi_connector_best_encoder(
> -					struct drm_connector *connector)
> -{
> -	struct dw_mipi_dsi *dsi = con_to_dsi(connector);
> -
> -	return &dsi->encoder;
> -}
> -
>   static struct drm_connector_helper_funcs dw_mipi_dsi_connector_helper_funcs = {
>   	.get_modes = dw_mipi_dsi_connector_get_modes,
>   	.mode_valid = dw_mipi_dsi_mode_valid,
> -	.best_encoder = dw_mipi_dsi_connector_best_encoder,
>   };
>   
>   static enum drm_connector_status
> diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
> index f8b4feb..006260d 100644
> --- a/drivers/gpu/drm/rockchip/inno_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
> @@ -579,14 +579,6 @@ inno_hdmi_connector_mode_valid(struct drm_connector *connector,
>   	return MODE_OK;
>   }
>   
> -static struct drm_encoder *
> -inno_hdmi_connector_best_encoder(struct drm_connector *connector)
> -{
> -	struct inno_hdmi *hdmi = to_inno_hdmi(connector);
> -
> -	return &hdmi->encoder;
> -}
> -
>   static int
>   inno_hdmi_probe_single_connector_modes(struct drm_connector *connector,
>   				       uint32_t maxX, uint32_t maxY)
> @@ -613,7 +605,6 @@ static struct drm_connector_funcs inno_hdmi_connector_funcs = {
>   static struct drm_connector_helper_funcs inno_hdmi_connector_helper_funcs = {
>   	.get_modes = inno_hdmi_connector_get_modes,
>   	.mode_valid = inno_hdmi_connector_mode_valid,
> -	.best_encoder = inno_hdmi_connector_best_encoder,
>   };
>   
>   static int inno_hdmi_register(struct drm_device *drm, struct inno_hdmi *hdmi)


-- 
Ｍark Yao
