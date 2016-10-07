Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37867 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935171AbcJGDd4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Oct 2016 23:33:56 -0400
Date: Fri, 7 Oct 2016 12:33:52 +0900
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: r8a7794: Fix W=1 dtc warnings
Message-ID: <20161007033352.GP13721@verge.net.au>
References: <1475587908-22151-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475587908-22151-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 04, 2016 at 03:31:48PM +0200, Geert Uytterhoeven wrote:
> Warning (unit_address_vs_reg): Node /sound@ec500000/rcar_sound,dvc/dvc@0 has a unit name, but no reg property

...

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm/boot/dts/r8a7794.dtsi | 58 +++++++++++++++++++++---------------------
>  1 file changed, 29 insertions(+), 29 deletions(-)

Thanks, I have queued this up.
