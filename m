Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54120 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751242AbdH3Haz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 03:30:55 -0400
Date: Wed, 30 Aug 2017 09:30:51 +0200
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <chris.paterson2@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH ] ARM: dts: iwg22d-sodimm: Add pinctl support for scif4
Message-ID: <20170830073051.GK10398@verge.net.au>
References: <1502982549-19429-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502982549-19429-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 17, 2017 at 04:09:09PM +0100, Biju Das wrote:
> Adding pinctrl support for scif4 interface.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch depends upon the below patch series
> [PATCH  0/2] ARM: dts: Add iWave RZ/G1E board support
> http://www.spinics.net/lists/devicetree/msg190513.html
> 
> This patch is tested against renesas-dev tag 
> renesas-devel-20170815-v4.13-rc5 + above dependency patch.

Thanks for the dependency and testing details, it is very helpful.

I have applied this for v4.15.
