Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55958 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751140AbdJLKP1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2017 06:15:27 -0400
Date: Thu, 12 Oct 2017 12:15:23 +0200
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH  0/5] Add USB2.0 Host support
Message-ID: <20171012101522.bbfst7qegni6vlvc@verge.net.au>
References: <1507557541-46560-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507557541-46560-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 09, 2017 at 02:58:56PM +0100, Biju Das wrote:
> Hello,
> 
> This series aims to add USB2.0 Host support on iWave RZ/G1E(r8a7745) based board.
> 
> This series has been tested against renesas-dev tag 20171009-v4.14-rc4
> 
> This patch has documentation dependency on below patch
>  * [RESEND] phy: rcar-gen2: Add r8a7743/5 support
> https://patchwork.kernel.org/patch/9992587/
> 
> Biju Das (5):
>   ARM: dts: r8a7745: Add internal PCI bridge nodes
>   ARM: dts: r8a7745: Add USB PHY DT support
>   ARM: dts: r8a7745: Link PCI USB devices to USB PHY
>   ARM: dts: iwg22d-sodimm: Enable internal PCI
>   ARM: dts: iwg22d-sodimm: Enable USB PHY

Thanks, applied with Geert's review tags.
