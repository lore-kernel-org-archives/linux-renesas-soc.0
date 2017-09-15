Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53012 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751203AbdIOHyh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 03:54:37 -0400
Date: Fri, 15 Sep 2017 09:54:15 +0200
From: Simon Horman <horms@verge.net.au>
To: Chris Paterson <chris.paterson2@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/8] ARM: dts: r8a7745: Add SDHI controllers
Message-ID: <20170915075415.GG3924@verge.net.au>
References: <1505322341-9480-1-git-send-email-chris.paterson2@renesas.com>
 <1505322341-9480-3-git-send-email-chris.paterson2@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1505322341-9480-3-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 13, 2017 at 06:05:35PM +0100, Chris Paterson wrote:
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Add the SDHI controllers to the r8a7745 device tree.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>

Thanks, applied.

> ---
> This patch is based on renesas-devel-20170913-v4.13.
> 
> This patch is dependant on:
> - "dt-bindings: mmc: sh_mmcif: Document r8a7745 DT bindings"

I think that should be "[PATCH v3] mmc: renesas_sdhi: Add r8a7743/5 support"
