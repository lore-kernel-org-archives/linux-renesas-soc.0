Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57334 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbeKGUmm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Nov 2018 15:42:42 -0500
Date: Wed, 7 Nov 2018 12:12:44 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77970: add QSPI pins, groups, and
 functions
Message-ID: <20181107111244.ij2lfllhnrdmkx42@verge.net.au>
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
 <38b17a18-59d6-3fbf-8413-915005b274f6@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38b17a18-59d6-3fbf-8413-915005b274f6@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 06, 2018 at 09:52:55PM +0300, Sergei Shtylyov wrote:
> From: Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>
> 
> Add the QSPI{0|1} pins/groups/functions to the R8A77970 PFC driver.
> 
> [Sergei: ported to the upstream driver, fixed up the swapped QSPI0 SPCLK/
> SSL pins, fixed up the comments, moved the QSPI pins/groups/functions to
> be in the alphanumeric order, removed unneeded empty lines, renamed the
> patch.]
> 
> Signed-off-by: Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
