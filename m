Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Vincent ABRIOU <vincent.abriou@st.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Daniel Vetter <daniel.vetter@intel.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	"linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
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
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Alexandre Courbot <gnurou@gmail.com>,
	Eric Anholt <eric@anholt.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>
Date: Wed, 8 Jun 2016 11:35:40 +0200
Subject: Re: [PATCH v2 11/20] drm: sti: Rely on the default ->best_encoder()
 behavior
Message-ID: <5757E6EC.1050802@st.com>
References: <1465300095-16971-1-git-send-email-boris.brezillon@free-electrons.com>
 <1465300095-16971-12-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1465300095-16971-12-git-send-email-boris.brezillon@free-electrons.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Boris,

Thanks for the patch.

Acked-by: Vincent Abriou <vincent.abriou@st.com>

Vincent

On 06/07/2016 01:48 PM, Boris Brezillon wrote:
> All outputs have a 1:1 relationship between connectors and encoders
> and the driver is relying on the atomic helpers: we can drop the custom
> ->best_encoder() implementations and let the core call
> drm_atomic_helper_best_encoder() for us.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>   drivers/gpu/drm/sti/sti_dvo.c  | 10 ----------
>   drivers/gpu/drm/sti/sti_hda.c  | 10 ----------
>   drivers/gpu/drm/sti/sti_hdmi.c | 10 ----------
>   3 files changed, 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
> index 25f7663..d5627d1 100644
> --- a/drivers/gpu/drm/sti/sti_dvo.c
> +++ b/drivers/gpu/drm/sti/sti_dvo.c
> @@ -384,20 +384,10 @@ static int sti_dvo_connector_mode_valid(struct drm_connector *connector,
>   	return MODE_OK;
>   }
>
> -struct drm_encoder *sti_dvo_best_encoder(struct drm_connector *connector)
> -{
> -	struct sti_dvo_connector *dvo_connector
> -		= to_sti_dvo_connector(connector);
> -
> -	/* Best encoder is the one associated during connector creation */
> -	return dvo_connector->encoder;
> -}
> -
>   static const
>   struct drm_connector_helper_funcs sti_dvo_connector_helper_funcs = {
>   	.get_modes = sti_dvo_connector_get_modes,
>   	.mode_valid = sti_dvo_connector_mode_valid,
> -	.best_encoder = sti_dvo_best_encoder,
>   };
>
>   static enum drm_connector_status
> diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
> index f7d3464..c4649f5 100644
> --- a/drivers/gpu/drm/sti/sti_hda.c
> +++ b/drivers/gpu/drm/sti/sti_hda.c
> @@ -676,20 +676,10 @@ static int sti_hda_connector_mode_valid(struct drm_connector *connector,
>   	return MODE_OK;
>   }
>
> -struct drm_encoder *sti_hda_best_encoder(struct drm_connector *connector)
> -{
> -	struct sti_hda_connector *hda_connector
> -		= to_sti_hda_connector(connector);
> -
> -	/* Best encoder is the one associated during connector creation */
> -	return hda_connector->encoder;
> -}
> -
>   static const
>   struct drm_connector_helper_funcs sti_hda_connector_helper_funcs = {
>   	.get_modes = sti_hda_connector_get_modes,
>   	.mode_valid = sti_hda_connector_mode_valid,
> -	.best_encoder = sti_hda_best_encoder,
>   };
>
>   static enum drm_connector_status
> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> index 6ef0715..dc9ab6e 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> @@ -897,20 +897,10 @@ static int sti_hdmi_connector_mode_valid(struct drm_connector *connector,
>   	return MODE_OK;
>   }
>
> -struct drm_encoder *sti_hdmi_best_encoder(struct drm_connector *connector)
> -{
> -	struct sti_hdmi_connector *hdmi_connector
> -		= to_sti_hdmi_connector(connector);
> -
> -	/* Best encoder is the one associated during connector creation */
> -	return hdmi_connector->encoder;
> -}
> -
>   static const
>   struct drm_connector_helper_funcs sti_hdmi_connector_helper_funcs = {
>   	.get_modes = sti_hdmi_connector_get_modes,
>   	.mode_valid = sti_hdmi_connector_mode_valid,
> -	.best_encoder = sti_hdmi_best_encoder,
>   };
>
>   /* get detection status of display device */
>
