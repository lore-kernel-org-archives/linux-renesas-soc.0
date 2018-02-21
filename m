Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56061 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752648AbeBUR0M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Feb 2018 12:26:12 -0500
Date: Wed, 21 Feb 2018 18:26:08 +0100
From: Simon Horman <horms@verge.net.au>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert@linux-m68k.org, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 16/19] ARM64: dts: r8a77965: Add GPIO nodes
Message-ID: <20180221172608.73lw32zsnqtrnxcn@verge.net.au>
References: <1519139541-18783-1-git-send-email-jacopo+renesas@jmondi.org>
 <1519139541-18783-17-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519139541-18783-17-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 20, 2018 at 04:12:18PM +0100, Jacopo Mondi wrote:
> Add GPIO nodes to r8a77965 SoC device tree file.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> ---
> v1 -> v2:
> - Replace ALWAYS_ON power area define with numeric constant
> - Do not move gpio nodes

Thanks, applied with prefix updated to:

arm64: dts: renesas: r8a77965:
