Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42872 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751333AbdHXKr1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 06:47:27 -0400
Date: Thu, 24 Aug 2017 06:47:01 -0400
From: Simon Horman <horms@verge.net.au>
To: Chris Paterson <chris.paterson2@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ARM: dts: iwg20d-q7: Add RTC support
Message-ID: <20170824104701.GA30281@verge.net.au>
References: <1502874990-12006-1-git-send-email-chris.paterson2@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502874990-12006-1-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 16, 2017 at 10:16:30AM +0100, Chris Paterson wrote:
> From: Biju Das <biju.das@bp.renesas.com>
> 
> Define the iWave RainboW-G20D-Qseven board dependent part of the
> RTC device node.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> [chris: corrected bq32000 compatible string]
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> ---
> v1 -> v2
> Added ti to bq32000 compatible string - Thanks Geert

Thanks, applied for v4.15.
