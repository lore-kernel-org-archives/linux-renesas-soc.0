Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58994 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750959AbdJ2PYs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 29 Oct 2017 11:24:48 -0400
Date: Sun, 29 Oct 2017 16:24:45 +0100
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 00/11] arm64: dts: renesas: Use R-Car SDHI Gen[123]
 fallback compat strings
Message-ID: <20171029152444.32xci4jtwlqsqpck@verge.net.au>
References: <20171017060959.16702-1-horms+renesas@verge.net.au>
 <20171020091747.iep6diy3ymp47qip@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171020091747.iep6diy3ymp47qip@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 20, 2017 at 11:17:47AM +0200, Simon Horman wrote:
> On Tue, Oct 17, 2017 at 08:09:48AM +0200, Simon Horman wrote:
> > Use recently posted R-Car SDHI Gen 1, 2 and 3 fallback compat strings
> > in the DT of Renesas ARM and arm64 based SoCs.
> > 
> > Based on renesas-devel-20171016-v4.14-rc5
> > 
> > Has a binding documentation but no run-time dependency on
> > "[PATCH v3 0/3] mmc: renesas_sdhi: add R-Car Gen[123] fallback
> > compatibility strings"
> 
> I have marked these as deferred pending acceptance of the above dependency.

The dependency has subsequently been accepted and I have applied this
series.
