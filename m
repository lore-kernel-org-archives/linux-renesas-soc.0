Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:45512 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934375AbdCJLLa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2017 06:11:30 -0500
Subject: Re: [PATCH v5 00/10] drm: bridge: dw-hdmi: Refactor PHY support
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
References: <20170303172007.26541-1-laurent.pinchart+renesas@ideasonboard.com>
Cc: Andy Yan <andy.yan@rock-chips.com>,
        Fabio Estevam <fabio.estevam@freescale.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nickey Yang <nickey.yang@rock-chips.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        linux-renesas-soc@vger.kernel.org
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <c401e6b4-0139-66ae-5f28-48b5d90937eb@codeaurora.org>
Date: Fri, 10 Mar 2017 16:40:21 +0530
MIME-Version: 1.0
In-Reply-To: <20170303172007.26541-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On 3/3/2017 10:49 PM, Laurent Pinchart wrote:
> Hello,
>
> This patch series refactors all the PHY handling code in order to allow
> support of vendor PHYs and Synopsys DWC HDMI 2.0 TX PHYs.
>
> The series starts with a few cleanups and small fixes. Patch 01/10 just
> removes unused code, patch 02/10 moves the color converter code out of the PHY
> configure function as it isn't PHY-dependent, and patch 03/10 enables color
> conversion even for DVI as it is needed to output RGB when the input format is
> YUV.
>
> The next two patches fix the power down (04/10) and up (05/10) sequences to
> comply with the HDMI TX PHY specifications. They are the biggest functional
> changes in the whole set, and have been tested successfully (with the rest of
> the series) on i.MX6Q, RK3288 and R-Car H3. The PLL PHY lock delay has been
> measured to be between 300µs and 350µs on R-Car H3, between 400µs and 600µs on
> i.MX6Q and between 150µs and 450µs on RK3288. The PHY power down delay has
> been measured to be less than 50µs on all platforms, and was often close to
> instant with power down reported in the first poll iteration. We should thus
> be more than safe with a 5ms timeout.
>
> Patch 06/10 breaks the PHY operations out. Glue code is then allowed to pass a
> PHY operations structure to support vendor PHYs. The existing PHY support code
> is turned into a default Synopsys PHYs implementation for those PHY
> operations.
>
> Patch 07/10 further refactors the Synopsys PHY configuration function to make
> it modular, in order to support DWC HDMI 2.0 TX PHYs that have a very
> different register layout compared to the currently supported PHYs. Glue code
> is again allowed to provide a custom PHY configuration implementation, with
> the existing PHY support code turned into the default implementation for all
> currently supported Synopsys PHYs.
>
> Patch 08/10 is a small cleanup that removes the now unneeded device type for
> glue code platform data, and patch 09/10 follows by switching the driver to
> regmap in order to support vendor-specific register access more easily.
>
> Patch 10/10 is a v5 addition that moves the code to a new directory per Jose's
> request. v5 also picked up review tags from the mailing list, and is rebased
> on top of the latest drm-misc-next branch. The series is otherwise unchanged
> compared to v4.
>
> Archit, how would you like to proceed to get this merged ?

Queued to drm-misc-next. Picked up the v5.1s where applicable. Resolved
some minor Kconfig/Makefile conflicts that came up because the
Megachips driver got pulled in first.

Thanks,
Archit

>
> Kieran Bingham (2):
>   drm: bridge: dw-hdmi: Add support for custom PHY configuration
>   drm: bridge: dw-hdmi: Remove device type from platform data
>
> Laurent Pinchart (6):
>   drm: bridge: dw-hdmi: Remove unused functions
>   drm: bridge: dw-hdmi: Move CSC configuration out of PHY code
>   drm: bridge: dw-hdmi: Fix the PHY power down sequence
>   drm: bridge: dw-hdmi: Fix the PHY power up sequence
>   drm: bridge: dw-hdmi: Create PHY operations
>   drm: bridge: dw-hdmi: Move the driver to a separate directory.
>
> Neil Armstrong (2):
>   drm: bridge: dw-hdmi: Enable CSC even for DVI
>   drm: bridge: dw-hdmi: Switch to regmap for register access
>
>  drivers/gpu/drm/bridge/Kconfig                     |   2 +
>  drivers/gpu/drm/bridge/Makefile                    |   4 +-
>  drivers/gpu/drm/bridge/synopsys/Kconfig            |  23 +
>  drivers/gpu/drm/bridge/synopsys/Makefile           |   5 +
>  .../drm/bridge/{ => synopsys}/dw-hdmi-ahb-audio.c  |   0
>  .../gpu/drm/bridge/{ => synopsys}/dw-hdmi-audio.h  |   0
>  .../drm/bridge/{ => synopsys}/dw-hdmi-i2s-audio.c  |   0
>  drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi.c    | 467 ++++++++++++---------
>  drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi.h    |   0
>  drivers/gpu/drm/imx/dw_hdmi-imx.c                  |   2 -
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |   1 -
>  include/drm/bridge/dw_hdmi.h                       |  33 +-
>  12 files changed, 335 insertions(+), 202 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/synopsys/Kconfig
>  create mode 100644 drivers/gpu/drm/bridge/synopsys/Makefile
>  rename drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi-ahb-audio.c (100%)
>  rename drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi-audio.h (100%)
>  rename drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi-i2s-audio.c (100%)
>  rename drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi.c (88%)
>  rename drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi.h (100%)
>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
