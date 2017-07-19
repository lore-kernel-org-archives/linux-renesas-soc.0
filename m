Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Javier Martinez Canillas <javier@osg.samsung.com>,
        Xinliang Liu <z.liuxinliang@hisilicon.com>,
        Rongrong Zou <zourongrong@gmail.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        CK Hu <ck.hu@mediatek.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Carlo Caione <carlo@caione.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mark Yao <mark.yao@rock-chips.com>,
        H eiko Stuebner <heiko@sntech.de>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>, Jyri Sarha <jsarha@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] gpu: Convert to using %pOF instead of full_name
Date: Wed, 19 Jul 2017 23:03:17 +0300
Message-ID: <1822320.HPtxg24hjI@avalon>
In-Reply-To: <20170718214339.7774-24-robh@kernel.org>
References: <20170718214339.7774-24-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Rob,

Thank you for the patch.

On Tuesday 18 Jul 2017 16:43:04 Rob Herring wrote:
> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Javier Martinez Canillas <javier@osg.samsung.com>
> Cc: Xinliang Liu <z.liuxinliang@hisilicon.com>
> Cc: Rongrong Zou <zourongrong@gmail.com>
> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Cc: Chen Feng <puck.chen@hisilicon.com>
> Cc: CK Hu <ck.hu@mediatek.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Carlo Caione <carlo@caione.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mark Yao <mark.yao@rock-chips.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> ---
[snip]
>  drivers/gpu/drm/drm_mipi_dsi.c                  |  6 +++---
>  drivers/gpu/drm/drm_modes.c                     |  4 ++--
>  drivers/gpu/drm/drm_of.c                        |  4 ++--
[snip]
>  drivers/gpu/drm/panel/panel-lvds.c              | 16 ++++++++--------
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c       |  4 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c           | 16 ++++++++--------

For all the above,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
