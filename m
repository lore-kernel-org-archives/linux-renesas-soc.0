Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45959 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbeJQRsU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 13:48:20 -0400
Date: Wed, 17 Oct 2018 11:53:20 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-pm@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFT 0/2] thermal: add suport for R8A77990
Message-ID: <20181017095315.lqgcxjjrzr3qck2i@verge.net.au>
References: <1539612719-9650-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1539612719-9650-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 15, 2018 at 11:11:57PM +0900, Yoshihiro Kaneko wrote:
> This series adds thermal support for R-Car E3 (R8A77990).
> 
> This series is based on the next branch of Eduardo Valentin's linux-soc-thermal
> tree.
> 
> Yoshihiro Kaneko (2):
>   dt-bindings: thermal: rcar-thermal: add R8A77990 support
>   thermal: rcar_thermal: add R8A77990 support

Tested in conjunction with "[PATCH/RFT] arm64: dts: renesas: r8a77990: add
thermal device support".

# X=1000000; while [ "$X" -gt 0 ]; do X=$(($X -1 )); done; cat
# /sys/devices/virtual/thermal/thermal_zone0/temp; sleep 1; cat
# /sys/devices/virtual/thermal/thermal_zone0/temp
30000
25000


Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Tested-by: Simon Horman <horms+renesas@verge.net.au>

> 
>  Documentation/devicetree/bindings/thermal/rcar-thermal.txt | 5 +++--
>  drivers/thermal/rcar_thermal.c                             | 4 ++++
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> -- 
> 1.9.1
> 
