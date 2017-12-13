Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45001 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750795AbdLMJCo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 04:02:44 -0500
Date: Wed, 13 Dec 2017 10:02:40 +0100
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] Add Sound support for iWave RZ/G1M board
Message-ID: <20171213090240.xqgihh4bqsfzeaip@verge.net.au>
References: <1513103111-45830-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1513103111-45830-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 12, 2017 at 06:25:06PM +0000, Biju Das wrote:
> This series aims to add sound support for iWave RZ/G1M board.
> 
> This patch series has documentation dependency on 
> https://patchwork.kernel.org/patch/10108014/
> 
> Biju Das (5):
>   ARM: shmobile: defconfig: Enable SGTL5000 audio codec
>   ARM: dts: r8a7743: Add audio clocks
>   ARM: dts: r8a7743: Add audio DMAC support
>   ARM: dts: r8a7743: Add sound support
>   ARM: dts: iwg20d-q7-common: Enable SGTL5000 audio codec
> 
>  arch/arm/boot/dts/iwg20d-q7-common.dtsi |  24 +++
>  arch/arm/boot/dts/r8a7743.dtsi          | 270 ++++++++++++++++++++++++++++++++
>  arch/arm/configs/shmobile_defconfig     |   1 +
>  3 files changed, 295 insertions(+)

These patches seem clean to me although I do not have sufficient
documentation to properly review the last patch.

I will leave these sit for a few days to allow others to review them.
