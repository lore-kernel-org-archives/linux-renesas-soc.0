Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52136 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751574AbdHQIYT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2017 04:24:19 -0400
Date: Thu, 17 Aug 2017 10:24:17 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: r8a7795: Add USB3.0 host device node
Message-ID: <20170817082417.GB27693@verge.net.au>
References: <1501763324-26028-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1501763324-26028-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501763324-26028-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 03, 2017 at 09:28:44PM +0900, Yoshihiro Shimoda wrote:
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

I applied this as "arm64: dts: r8a7796: Add USB3.0 host device node"
Note the '6'.

Also, I know I am guilty of this too, but please consider including a
body in the changelog for future patches.
