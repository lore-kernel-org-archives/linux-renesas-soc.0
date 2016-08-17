Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53842 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752700AbcHQHNm (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 17 Aug 2016 03:13:42 -0400
Date: Wed, 17 Aug 2016 09:13:36 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: salvator-x: Configure pins for the
 DU RGB output
Message-ID: <20160817071335.GG8673@verge.net.au>
References: <1470993535-11795-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1470993535-11795-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 12, 2016 at 12:18:55PM +0300, Laurent Pinchart wrote:
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> This patch depends on "[PATCH] pinctrl: sh-pfc: r8a7795: Add DU support"
> posted a few minutes ago to the linux-renesas-soc mailing list, as well as on
> the "[PATCH v2 0/4] R-Car Gen3 DU enablement on Salvator-X board" series
> posted yesterday to the same list.
> 
> As the boot loader configures the DU pins on Salvator-X we can safely delay
> this patch by one kernel version to let the pinctrl dependency hit mainling
> first.

I'm not entirely sure it is necessary to defer this patch by a kernel
release but if that is your wish then I'm happy to do so. If so
please repost at the appropriate time.
