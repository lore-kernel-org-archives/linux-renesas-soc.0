Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52875 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750841AbdIOHqL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 03:46:11 -0400
Date: Fri, 15 Sep 2017 09:45:51 +0200
From: Simon Horman <horms@verge.net.au>
To: Chris Paterson <chris.paterson2@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 1/8] ARM: dts: r8a7745: Add APMU node and second CPU core
Message-ID: <20170915074551.GF3924@verge.net.au>
References: <1505322341-9480-1-git-send-email-chris.paterson2@renesas.com>
 <1505322341-9480-2-git-send-email-chris.paterson2@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1505322341-9480-2-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

[Cc Geert]

On Wed, Sep 13, 2017 at 06:05:34PM +0100, Chris Paterson wrote:
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Add DT node for the Advanced Power Management Unit (APMU), add the
> second CPU core, and use "renesas,apmu" as "enable-method".
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> ---
> This patch is based on renesas-devel-20170913-v4.13.

Hi,

with reference to "[PATCH v3 0/3] ARM: renesas: Enable SMP on R-Car E2"
is the CNTVOFF initialised in the boot loader of boards (in upstream)
for this SoC? If not I expect you will have trouble with the arch timer
on secondary CPU cores.

The patch itself looks good to me.
