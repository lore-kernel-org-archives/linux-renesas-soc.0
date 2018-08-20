Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:38300 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbeHTNE2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 09:04:28 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulrich Hecht <uli+renesas@fpond.eu>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PROTO][PATCH 00/10] R-Car D3 LVDS/HDMI support (with PLL)
Date: Mon, 20 Aug 2018 12:50:26 +0300
Message-ID: <6267174.iQv7XvWJ3u@avalon>
In-Reply-To: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu>
References: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

Thank you for the patches.

On Tuesday, 14 August 2018 16:49:54 EEST Ulrich Hecht wrote:
> Hi!
> 
> This is a prototype extension of the series "R-Car D3 LVDS/HDMI support"
> that includes an up-port of the LVDS PLL support in the BSP.
> 
> While this is prototype-quality code, there are in my judgment no serious
> hacks in it.  The most significant deviation in behavior between this and
> the BSP code is that the LVDS PLL setup is not done in two steps, but in one
> go as the LVDS device is enabled.  This was easier to implement, and works
> just as fine.
> 
> Instructions for testing this are found at
> https://elinux.org/User:Uli/D3_HDMI_Test, including links to git trees based
> on renesas-drivers and drm-next, as well as config files for each.

The instructions there end with

"4. Boot kernel and observe activity on HDMI display."

Does "activity" mean that I can expect a working HDMI output with a proper 
image on the display ? :-)

-- 
Regards,

Laurent Pinchart
