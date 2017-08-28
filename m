Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53928 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750797AbdH1IBC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2017 04:01:02 -0400
Date: Mon, 28 Aug 2017 10:00:43 +0200
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: r8a7745: Add Ethernet AVB support
Message-ID: <20170828080043.GD22421@verge.net.au>
References: <1503649913-9985-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1503649913-9985-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 25, 2017 at 09:31:53AM +0100, Biju Das wrote:
> Add Ethernet AVB support for r8a7745 SoC.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> v1-->v2
>     Position the avb node similar to r8a7794(R-Car E2) SoC.
> 
> It is tested against renesas-devel branch tag
> renesas-devel-20170824-v4.13-rc6.

Thanks, applied for v4.15.
