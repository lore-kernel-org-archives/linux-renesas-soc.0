Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33375 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730086AbeGZOoE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jul 2018 10:44:04 -0400
Date: Thu, 26 Jul 2018 15:27:08 +0200
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 0/3] RZ/G2M SoC identification support
Message-ID: <20180726132707.aa7bm7macynuzeou@verge.net.au>
References: <1532447238-13486-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1532447238-13486-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 24, 2018 at 04:47:15PM +0100, Biju Das wrote:
> This patch series aims to add SoC identification support 
> for RZ/G2M SoC. RZ/G2M SoC is similar to R-Car Gen3 M3-W SoC.
> 
> 
> Biju Das (3):
>   dt-bindings: arm: Document RZ/G2M SoC DT bindings
>   arm64: Add Renesas R8A774A1 support
>   soc: renesas: Identify RZ/G2M

Thanks, applied for v4.20.
