Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35045 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751696AbdGEKYf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2017 06:24:35 -0400
Date: Wed, 5 Jul 2017 11:24:32 +0100
From: Simon Horman <horms@verge.net.au>
To: Chris Paterson <chris.paterson2@renesas.com>
Cc: Russell King <linux@armlinux.org.uk>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] ARM: debug-ll: Add support for r8a7743
Message-ID: <20170705102432.GB24043@verge.net.au>
References: <1496908117-19368-1-git-send-email-chris.paterson2@renesas.com>
 <1496916494-19725-1-git-send-email-chris.paterson2@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496916494-19725-1-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 08, 2017 at 11:08:14AM +0100, Chris Paterson wrote:
> Enable low-level debugging support for RZ/G1M (r8a7743). RZ/G1M uses
> SCIF0 for the debug console, like most of the R-Car Gen2 SoCs.
> 
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.14.
