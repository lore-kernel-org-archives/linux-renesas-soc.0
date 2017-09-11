Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55204 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751153AbdIKHZW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2017 03:25:22 -0400
Date: Mon, 11 Sep 2017 09:25:02 +0200
From: Simon Horman <horms@verge.net.au>
To: Chris Paterson <chris.paterson2@renesas.com>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] ARM: dts: r8a7743: Add IIC cores to dtsi
Message-ID: <20170911072502.GA10251@verge.net.au>
References: <1502704398-28378-1-git-send-email-biju.das@bp.renesas.com>
 <1504705926-31625-1-git-send-email-chris.paterson2@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1504705926-31625-1-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 06, 2017 at 02:52:06PM +0100, Chris Paterson wrote:
> From: Biju Das <biju.das@bp.renesas.com>
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> ---
> v2->v3
> - Renamed lables to use iic instead of i2c.
> 
> v1->v2
> - Corrected the resets property for i2c6 device node.
> 
> This patch is based on renesas-devel tag renesas-devel-20170905-v4.13.
> 
> DT bindings has been accepted by Wolfram:
> https://patchwork.kernel.org/patch/9888119

Thanks, applied.
