Return-Path: <linux-arm-kernel-bounces+geert=linux-m68k.org@lists.infradead.org>
From: Jeffy Chen <jeffy.chen@rock-chips.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/9] rockchip: kevin: Enable edp display
Date: Wed, 18 Oct 2017 20:09:35 +0800
Message-Id: <20171018120944.7819-1-jeffy.chen@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Romain Perier <romain.perier@collabora.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Archit Taneja <architt@codeaurora.org>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, Jonathan Corbet <corbet@lwn.net>,
 Kevin Hilman <khilman@baylibre.com>, briannorris@chromium.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org,
 Matthias Kaehlcke <mka@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Caesar Wang <wxt@rock-chips.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Jeffy Chen <jeffy.chen@rock-chips.com>, Inki Dae <inki.dae@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 seanpaul@chromium.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Mark Yao <mark.yao@rock-chips.com>,
 zain wang <wzz@rock-chips.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 dianders@chromium.org, tfiga@chromium.org, linux-renesas-soc@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Kukjin Kim <kgene@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Carlo Caione <carlo@caione.org>, Shawn Guo <shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+geert=linux-m68k.org@lists.infradead.org
List-ID: <linux-renesas-soc.vger.kernel.org>


Make edp display works on chromebook kevin(at least for boot animation).

Also solve some issues i meet during the bringup.

Changes in v5:
Call the destroy hook in the error handling path like in unbind().
Call the destroy hook in the error handling path like in unbind().
Update cleanup order in unbind().
Add disable to unbind(), and inline clk_prepare_enable() with bind().

Jeffy Chen (9):
  arm64: dts: rockchip: Enable edp disaplay on kevin
  drm/rockchip: analogix_dp: Remove unnecessary init code
  drm/bridge: analogix: Do not use device's drvdata
  drm/bridge: analogix_dp: Fix connector & encoder cleanup
  drm/rockchip: dw-mipi-dsi: Fix error handling path
  drm/rockchip: inno_hdmi: Fix error handling path
  drm/bridge/synopsys: dw-hdmi: Add missing bridge detach
  drm/bridge/synopsys: dw-hdmi: Do not use device's drvdata
  drm/rockchip: dw_hdmi: Fix error handling path

 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts  | 29 ++++++++
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       | 16 ++++
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 52 +++++--------
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 53 ++++++-------
 drivers/gpu/drm/exynos/exynos_dp.c                 | 29 +++++---
 drivers/gpu/drm/imx/dw_hdmi-imx.c                  | 22 +++---
 drivers/gpu/drm/meson/meson_dw_hdmi.c              | 20 +++--
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c             | 14 +++-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 87 ++++++++++------------
 drivers/gpu/drm/rockchip/dw-mipi-dsi.c             | 21 ++++--
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 39 +++++-----
 drivers/gpu/drm/rockchip/inno_hdmi.c               | 22 ++++--
 include/drm/bridge/analogix_dp.h                   | 19 +++--
 include/drm/bridge/dw_hdmi.h                       | 17 +++--
 14 files changed, 257 insertions(+), 183 deletions(-)

-- 
2.11.0



_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
