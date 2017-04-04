Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57006 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753798AbdDDRRc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2017 13:17:32 -0400
Date: Tue, 4 Apr 2017 13:17:28 -0400
From: Simon Horman <horms@verge.net.au>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: chris.brandt@renesas.com, geert@linux-m68k.org, robh+dt@kernel.org,
        mark.rutland@arm.com, rtc-linux@googlegroups.com,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm: dts: genmai: Enable rtc and rtc_x1 clock
Message-ID: <20170404171728.GB14047@verge.net.au>
References: <1491235398-26549-1-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1491235398-26549-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 03, 2017 at 06:03:18PM +0200, Jacopo Mondi wrote:
> Enable the 32.768 kHz RTC_X1 clock by setting the frequency value to
> non-zero and enable the realtime clock.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> 
> This patch depends on Chris Brandt's series
> "rtc: Reuse rtc-sh driver to support RZ/A1"
> Please queue this on top of that.

Thanks, done.
