Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44528 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752012AbdFLJHA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jun 2017 05:07:00 -0400
Date: Mon, 12 Jun 2017 11:06:56 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: r8a779x: Fix PCI bus dtc warnings
Message-ID: <20170612090655.GB15434@verge.net.au>
References: <1497023440-23845-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1497023440-23845-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jun 09, 2017 at 05:50:40PM +0200, Geert Uytterhoeven wrote:
> From: Rob Herring <robh@kernel.org>
> 
> The bogus 'device_type = "pci"' confuses dtc, causing lots of totally
> unrelated warnings.  After fixing that, real warnings like
> 
>     arch/arm/boot/dts/r8a7790-lager.dtb: Warning (pci_device_reg): Node /pci@ee090000/usb@0,1 PCI unit address format error, expected "1,0"
> 
> are left.  Correct the unit-addresses and reg properties of the subnodes
> to fix these.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> [geert: Improve description]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have queued this up for v4.13.
