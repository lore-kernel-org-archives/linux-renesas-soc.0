Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50272 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405500AbeKWXWw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 18:22:52 -0500
Date: Fri, 23 Nov 2018 13:38:46 +0100
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77990: add thermal device
 support
Message-ID: <20181123123845.ak23g2wthryysfaz@verge.net.au>
References: <1539612746-9711-1-git-send-email-ykaneko0929@gmail.com>
 <20181017095828.lgp6e7q4ag4meybs@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181017095828.lgp6e7q4ag4meybs@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 17, 2018 at 11:58:29AM +0200, Simon Horman wrote:
> On Mon, Oct 15, 2018 at 11:12:26PM +0900, Yoshihiro Kaneko wrote:
> > This patch adds the thermal device node and the thermal-zone for
> > the R8A77990 SoC.
> > 
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Also tested on Ebisu/E3 in conjunction with "[PATCH/RFT 0/2] thermal: add
> suport for R8A77990"
> 
> # X=1000000; while [ "$X" -gt 0 ]; do X=$(($X -1 )); done; cat
> # /sys/devices/virtual/thermal/thermal_zone0/temp; sleep 1; cat
> # /sys/devices/virtual/thermal/thermal_zone0/temp
> 30000
> 25000
> 
> Tested-by: Simon Horman <horms+renesas@verge.net.au>
> 

I was waiting for the bindings to be reviewed, that has now happened
and I have applied this patch for v4.21.
