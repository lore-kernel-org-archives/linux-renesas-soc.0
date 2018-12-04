Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42522 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbeLDOT7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 09:19:59 -0500
Date: Tue, 4 Dec 2018 06:19:55 -0800
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 0/5] Add more support to RZ/G1N
Message-ID: <20181204141955.6obhojd4ev6afotu@verge.net.au>
References: <1543423111-19745-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1543423111-19745-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 28, 2018 at 04:38:26PM +0000, Biju Das wrote:
> This patch series aims to add support for some more interfaces
> to RZ/G1N SoC (IPMMU, VSP, VIN, PWM and TPU).
> 
> This patch series tested against renesas-dev.
> it depends on the the below patch series.
> 
> https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=48065
> 
> Biju Das (5):
>   ARM: dts: r8a7744: add VIN dt support
>   ARM: dts: r8a7744: Add VSP support
>   ARM: dts: r8a7744: Add IPMMU DT nodes
>   ARM: dts: r8a7744: Add PWM SoC support
>   ARM: dts: r8a7744: Add TPU support

Thanks, applied for v4.21.
