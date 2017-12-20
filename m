Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53308 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754943AbdLTJzt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 04:55:49 -0500
Date: Wed, 20 Dec 2017 10:55:45 +0100
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Add sound support
Message-ID: <20171220095545.gboeqj24tjrdhrvi@verge.net.au>
References: <1513621361-10944-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1513621361-10944-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 18, 2017 at 06:22:36PM +0000, Biju Das wrote:
> This series aims to add sound support for iWave RZ/G1M board.
> 
> This patch series has below dependency
> 1)https://patchwork.kernel.org/patch/10108041/
> 
> Biju Das (5):
>   ARM: dts: iwg20d-q7-common: Sound PIO support
>   ARM: dts: iwg20d-q7-common: Sound DMA support on DTS
>   ARM: dts: iwg20d-q7-common: Sound DMA support via BUSIF on DTS
>   ARM: dts: iwg20d-q7-common: Sound DMA support via SRC on DTS
>   ARM: dts: iwg20d-q7-common: Sound DMA support via DVC on DTS

Thanks, series applied.
