Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40904 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751036AbeEVNUa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 May 2018 09:20:30 -0400
Date: Tue, 22 May 2018 15:20:26 +0200
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: don't use deprecated
 renesas,gpio-rcar
Message-ID: <20180522132026.flzd5jjh5chqotzm@verge.net.au>
References: <20180514143543.16590-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180514143543.16590-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 14, 2018 at 04:35:43PM +0200, Simon Horman wrote:
> The compat string renesas,gpio-rcar has been deprecated since v4.14,
> the same release that r8a77990 SoC support was added. Thus
> renesas,gpio-rcar can safely be removed without any risk of behaviour
> changes between old and new mainline kernels and DTBs.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Applied
