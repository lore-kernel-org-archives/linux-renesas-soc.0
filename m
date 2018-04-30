Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-he1eur01on0136.outbound.protection.outlook.com ([104.47.0.136]:21376
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751513AbeD3LOU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Apr 2018 07:14:20 -0400
Subject: Re: [PATCH 22/24] drm/bridge: remove the .of_node member
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, linux-kernel@vger.kernel.org,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Peter Senna Tschudin <peter.senna@collabora.com>,
        Martin Donnelly <martin.donnelly@ge.com>,
        Martyn Welch <martyn.welch@collabora.co.uk>,
        Gustavo Padovan <gustavo@padovan.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        CK Hu <ck.hu@mediatek.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Vincent Abriou <vincent.abriou@st.com>,
        Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20180426223139.16740-23-peda@axentia.se>
 <201804281608.Iji1Keed%fengguang.wu@intel.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <f5f99e99-1174-6ee0-c097-e1a9d4d5a62a@axentia.se>
Date: Mon, 30 Apr 2018 13:14:08 +0200
MIME-Version: 1.0
In-Reply-To: <201804281608.Iji1Keed%fengguang.wu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-04-28 10:09, kbuild test robot wrote:
> Hi Peter,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on v4.17-rc2]
> [also build test ERROR on next-20180426]
> [cannot apply to drm/drm-next robclark/msm-next drm-exynos/exynos-drm/for-next]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Peter-Rosin/device-link-bridge-supplier-drm-device/20180428-135229
> config: arm-allmodconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm 
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/gpu//drm/rockchip/rockchip_lvds.c: In function 'rockchip_lvds_bind':
>>> drivers/gpu//drm/rockchip/rockchip_lvds.c:381:24: error: 'struct drm_bridge' has no member named 'of_node'
>       remote = lvds->bridge->of_node;
>                            ^~
> 
> vim +381 drivers/gpu//drm/rockchip/rockchip_lvds.c

Ugh.

So, patch 1/24 needs to be amended with this

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index e67f4ea28c0e..3f33034b3f58 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -377,8 +377,10 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
        }
        if (lvds->panel)
                remote = lvds->panel->dev->of_node;
-       else
+       else if (lvds->bridge->of_node)
                remote = lvds->bridge->of_node;
+       else
+               remote = lvds->bridge->owner->of_node;
        if (of_property_read_string(dev->of_node, "rockchip,output", &name))
                /* default set it as output rgb */
                lvds->output = DISPLAY_OUTPUT_RGB;


and patch 22/24 with this

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 3f33034b3f58..8c82fa647536 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -377,8 +377,6 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
        }
        if (lvds->panel)
                remote = lvds->panel->dev->of_node;
-       else if (lvds->bridge->of_node)
-               remote = lvds->bridge->of_node;
        else
                remote = lvds->bridge->owner->of_node;
        if (of_property_read_string(dev->of_node, "rockchip,output", &name))


But that is of course just a stop-gap. The real fix is to adapt to the
"drm: bridge: Add support for static image formats​" series from Jacopo.
But that's orthogonal.

Cheers,
Peter
