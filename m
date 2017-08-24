Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42523 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751281AbdHXKTI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 06:19:08 -0400
Date: Thu, 24 Aug 2017 06:18:43 -0400
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <chris.paterson2@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH ] ARM: dts: r8a7745: Add Ethernet AVB support
Message-ID: <20170824101843.GF17607@verge.net.au>
References: <1503388405-48325-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1503388405-48325-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 22, 2017 at 08:53:25AM +0100, Biju Das wrote:
> Add Ethernet AVB support for r8a7745 SoC.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch is depend upon the below patch
> [1/2] ARM: dts: r8a7745: Add MMC interface support
> https://patchwork.kernel.org/patch/9906803/
> 
> It is tested against renesas-devel branch tag
> renesas-devel-20170821-v4.13-rc5

This patch does not seem to apply cleanly (using git am)
on top of the tag above. Please resolve this problem and resubmit.
