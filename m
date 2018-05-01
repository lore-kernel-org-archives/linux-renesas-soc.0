Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55767 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750851AbeEAGAY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 May 2018 02:00:24 -0400
Date: Tue, 1 May 2018 08:00:05 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3] arm64: dts: renesas: v3msk: add DU/LVDS/HDMI support
Message-ID: <20180501060005.sgzgdfqt6t4smco2@verge.net.au>
References: <23a6ac28-134b-b5dd-69a7-910774c4b8c1@cogentembedded.com>
 <d18c4314-e6ad-1558-30fb-1a32397494b6@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d18c4314-e6ad-1558-30fb-1a32397494b6@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 23, 2018 at 11:45:49PM +0300, Sergei Shtylyov wrote:
> Define the V3M Starter Kit board dependent part of the DU and LVDS device
> nodes. Also add the device nodes for Thine THC63LVD1024 LVDS decoder and
> Analog Devices ADV7511W HDMI transmitter...
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'renesas-devel-20180423-v4.17-rc2' tag of Simon
> Horman's 'renesas.git' repo. It requires the Thine THC63LVD1024 driver in
> order to work (the same as the Eagle HDMI patch by Jacopo/Niklas).
> 
> Changes in version 3:
> - added  Thine THC63LVD1024 device node, updating the respected endpoints;
> - merged the I2C pins subnode to the main PFC device node;
> - renamed the regulators;

Thanks, applied.
