Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp1.de.adit-jv.com ([62.225.105.245]:32795 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753101AbdHTQp7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Aug 2017 12:45:59 -0400
Date: Sun, 20 Aug 2017 18:37:23 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jose Abreu <joabreu@synopsys.com>
CC: <linux-renesas-soc@vger.kernel.org>, <erosca@de.adit-jv.com>
Subject: Re: [v3,15/20] drm: bridge: dw-hdmi: Handle overflow workaround
 based on device version
Message-ID: <20170820163723.GA13473@vmlxhi-102.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20170117082910.27023-16-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Laurent, Jose,

As you might know, Renesas uses the same Synopsis Designware HDMI
transmitter IP in the Rcar Gen3 SoCs. There are v4.9+ patches present
in [1] to enable support for this.

Why I reply in this specific thread is because I am having a trial
attempt to rebase the RCAR-specific v4.9+ dw-hdmi patches on top of
a more recent kernel, which already contains mainline commit [2],
being proposed as part of this patch series.

Based on [3], it looks like that the `dw_hdmi_clear_overflow()`
workaround, formerly implemented for IMX6, is still used on Rcar3.

Current patch (integrated in upstream as commit [2]) assumes that
the workaround is only needed for the older v1.30a and v1.31a IP
implementations. Given much newer HDMI controller contained in RCAR3
(kernel reports v2.01a) and given it's you who witnessed the
original issue, I wonder what is the easiest way to check if the
problem fixed by the workaround still occurs on the Renesas SoC?
I have plenty of Salvator-X and ULCB boards, so HW is not a problem.

Your feedback is much appreciated.

Best regards,
Eugeniu.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/
[2] mainline commit be41fc55f1aa ("drm: bridge: dw-hdmi: Handle overflow workaround based on device version")
[3] https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?h=8fdb115e6e1f
