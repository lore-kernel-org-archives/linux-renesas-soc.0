Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33045 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729506AbeGZOVb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jul 2018 10:21:31 -0400
Date: Thu, 26 Jul 2018 15:04:40 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 0/2] R-Car DU: Convert DT to new DU and LVDS bindings
Message-ID: <20180726130435.lwbpduipzbxnlhhk@verge.net.au>
References: <20180605095106.25586-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180605095106.25586-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jun 05, 2018 at 12:51:04PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This small patch series contains the last two remaining patches from
> "[PATCH v4 00/16] R-Car DU: Convert LVDS code to bridge driver". Apart from
> the individual SoC patches being squashed together as requested by the ARM-SoC
> maintainers there's nothing special here.
> 
> Laurent Pinchart (2):
>   ARM: dts: rcar-gen2: Convert to new DU DT bindings
>   arm64: dts: renesas: Convert to new LVDS DT bindings

Sorry, this slipped through the cracks.
Applied for v4.20.
