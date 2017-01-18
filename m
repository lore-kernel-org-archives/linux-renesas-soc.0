Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <architt@codeaurora.org>
Subject: Re: [PATCH v3 00/20] dw-hdmi: Cleanups, fixes and updates for v4.11
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20170117082910.27023-1-laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>,
 Fabio Estevam <fabio.estevam@freescale.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <1f271912-f83d-cf44-7f08-5dddb8ba47ac@codeaurora.org>
Date: Wed, 18 Jan 2017 10:22:13 +0530
MIME-Version: 1.0
In-Reply-To: <20170117082910.27023-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>



On 01/17/2017 01:58 PM, Laurent Pinchart wrote:
> Hello,
>
> This patch series contains the part of my pending dw-hdmi patches that have
> been successfully tested on all three supported platforms (i.MX6, RK3288 and
> R-Car H3) and have been reviewed without any problem being reported.
>
> All patches here have been previously posted as part of the "[PATCH v2 00/29]
> R-Car Gen3 HDMI output support" and "[PATCH 0/3] dw-hdmi: miscellaneous
> cleanups and fix" series. This series is a repost with all review tags
> collected.

queued to drm-misc-next

Archit

>
> Kieran Bingham (2):
>   drm: bridge: dw-hdmi: Remove unused function parameter
>   drm: bridge: dw-hdmi: Remove PHY configuration resolution parameter
>
> Laurent Pinchart (18):
>   drm: bridge: dw-hdmi: Merge __hdmi_phy_i2c_write and
>     hdmi_phy_i2c_write
>   drm: bridge: dw-hdmi: Remove unneeded arguments to bind/unbind
>     functions
>   drm: bridge: dw-hdmi: Embed drm_bridge in struct dw_hdmi
>   drm: bridge: dw-hdmi: Remove encoder field from struct dw_hdmi
>   drm: bridge: dw-hdmi: Don't forward HPD events to DRM core before
>     attach
>   drm: bridge: dw-hdmi: Move IRQ and IO resource allocation to common
>     code
>   drm: bridge: dw-hdmi: Reorder functions to prepare for next commit
>   drm: bridge: dw-hdmi: Create connector in the bridge attach operation
>   drm: bridge: dw-hdmi: Implement DRM bridge registration
>   drm: bridge: dw-hdmi: Rename CONF0 SPARECTRL bit to SVSRET
>   drm: bridge: dw-hdmi: Reject invalid product IDs
>   drm: bridge: dw-hdmi: Detect AHB audio DMA using correct register
>   drm: bridge: dw-hdmi: Handle overflow workaround based on device
>     version
>   drm: bridge: dw-hdmi: Detect PHY type at runtime
>   drm: bridge: dw-hdmi: Define and use macros for PHY register addresses
>   drm: bridge: dw-hdmi: Fix the name of the PHY reset macros
>   drm: bridge: dw-hdmi: Assert SVSRET before resetting the PHY
>   dt-bindings: display: dw-hdmi: Clean up DT bindings documentation
>
>  .../devicetree/bindings/display/bridge/dw_hdmi.txt |  85 ++--
>  .../devicetree/bindings/display/imx/hdmi.txt       |  51 +--
>  .../bindings/display/rockchip/dw_hdmi-rockchip.txt |  43 +-
>  drivers/gpu/drm/bridge/dw-hdmi.c                   | 438 +++++++++++++--------
>  drivers/gpu/drm/bridge/dw-hdmi.h                   |  85 +++-
>  drivers/gpu/drm/imx/dw_hdmi-imx.c                  |  14 +-
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |  14 +-
>  include/drm/bridge/dw_hdmi.h                       |  19 +-
>  8 files changed, 472 insertions(+), 277 deletions(-)
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
