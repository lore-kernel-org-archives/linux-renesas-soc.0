Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36755 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727185AbeIQNsD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 09:48:03 -0400
Date: Mon, 17 Sep 2018 10:21:40 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] clocksource: sh_cmt: add R-Car gen3 support
Message-ID: <20180917082139.lhno7joipugljhiu@verge.net.au>
References: <c94a4ad6-93ee-05e4-e2c1-e8d24d3bc75e@cogentembedded.com>
 <7d32fc9c-903d-1cb3-fdd7-d9165e0016ac@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d32fc9c-903d-1cb3-fdd7-d9165e0016ac@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 12, 2018 at 11:17:37PM +0300, Sergei Shtylyov wrote:
> Add support for the R-Car gen3 CMT types 0/1 -- they seem to be the same
> CMT types 0/1 as in R-Car gen2 SoCs.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
