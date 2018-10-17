Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46085 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726904AbeJQRx3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 13:53:29 -0400
Date: Wed, 17 Oct 2018 11:58:29 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77990: add thermal device
 support
Message-ID: <20181017095828.lgp6e7q4ag4meybs@verge.net.au>
References: <1539612746-9711-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1539612746-9711-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 15, 2018 at 11:12:26PM +0900, Yoshihiro Kaneko wrote:
> This patch adds the thermal device node and the thermal-zone for
> the R8A77990 SoC.
> 
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Also tested on Ebisu/E3 in conjunction with "[PATCH/RFT 0/2] thermal: add
suport for R8A77990"

# X=1000000; while [ "$X" -gt 0 ]; do X=$(($X -1 )); done; cat
# /sys/devices/virtual/thermal/thermal_zone0/temp; sleep 1; cat
# /sys/devices/virtual/thermal/thermal_zone0/temp
30000
25000

Tested-by: Simon Horman <horms+renesas@verge.net.au>
