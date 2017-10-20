Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 20 Oct 2017 13:07:35 -0400
From: Sean Paul <seanpaul@chromium.org>
To: Jeffy Chen <jeffy.chen@rock-chips.com>
Cc: linux-kernel@vger.kernel.org, briannorris@chromium.org,
        seanpaul@chromium.org, dianders@chromium.org, heiko@sntech.de,
        tfiga@chromium.org, Andrzej Hajda <a.hajda@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Romain Perier <romain.perier@collabora.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Kevin Hilman <khilman@baylibre.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        linux-rockchip@lists.infradead.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Carlo Caione <carlo@caione.org>,
        Will Deacon <will.deacon@arm.com>,
        linux-amlogic@lists.infradead.org,
        Caesar Wang <wxt@rock-chips.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        zain wang <wzz@rock-chips.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Archit Taneja <architt@codeaurora.org>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Mark Yao <mark.yao@rock-chips.com>,
        linux-renesas-soc@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v6 00/10] rockchip: kevin: Enable edp display
Message-ID: <20171020170735.yahyoshwsewttjvy@art_vandelay>
References: <20171019034812.13768-1-jeffy.chen@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171019034812.13768-1-jeffy.chen@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 19, 2017 at 11:48:02AM +0800, Jeffy Chen wrote:
> 
> Make edp display works on chromebook kevin(at least for boot animation).
> 
> Also solve some issues i meet during the bringup.
> 
> Changes in v6:
> Don't change order of rockchip_drm_psr_register().
> 
> Changes in v5:
> Call the destroy hook in the error handling path like in unbind().
> Call the destroy hook in the error handling path like in unbind().
> Update cleanup order in unbind().
> Add disable to unbind(), and inline clk_prepare_enable() with bind().
> 
> Jeffy Chen (10):
>   arm64: dts: rockchip: Enable edp disaplay on kevin
>   drm/rockchip: analogix_dp: Remove unnecessary init code
>   drm/bridge: analogix: Do not use device's drvdata
>   drm/bridge: analogix_dp: Fix connector and encoder cleanup
>   drm/rockchip: analogix_dp: Add a sanity check for
>     rockchip_drm_psr_register()
>   drm/rockchip: dw-mipi-dsi: Fix error handling path
>   drm/rockchip: inno_hdmi: Fix error handling path
>   drm/bridge/synopsys: dw-hdmi: Add missing bridge detach
>   drm/bridge/synopsys: dw-hdmi: Do not use device's drvdata
>   drm/rockchip: dw_hdmi: Fix error handling path

Hi Jeffy,
I've pushed 2/10. Once you fix 3/10, I can push 3-7. I'd like someone familiar
with synopsys to review 8-9 before pushing those. Since 10 depends on 9, it'll
be blocked on synopsys review.

Sean

> 
>  arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts  | 29 +++++++
>  arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       | 16 ++++
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 52 +++++-------
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 53 ++++++------
>  drivers/gpu/drm/exynos/exynos_dp.c                 | 29 ++++---
>  drivers/gpu/drm/imx/dw_hdmi-imx.c                  | 22 +++--
>  drivers/gpu/drm/meson/meson_dw_hdmi.c              | 20 +++--
>  drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c             | 14 +++-
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 95 +++++++++++-----------
>  drivers/gpu/drm/rockchip/dw-mipi-dsi.c             | 21 +++--
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 39 +++++----
>  drivers/gpu/drm/rockchip/inno_hdmi.c               | 22 +++--
>  include/drm/bridge/analogix_dp.h                   | 19 +++--
>  include/drm/bridge/dw_hdmi.h                       | 17 ++--
>  14 files changed, 265 insertions(+), 183 deletions(-)
> 
> -- 
> 2.11.0
> 
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
