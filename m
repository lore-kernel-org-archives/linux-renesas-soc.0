Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42091 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932726AbdJQH7M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2017 03:59:12 -0400
Date: Tue, 17 Oct 2017 09:59:07 +0200
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [PATCH 1/4] ARM: dts: iwg22d: Use /dev/ttySC3 as debug console
Message-ID: <20171017075907.p2yr3tjq6nqx6uhb@verge.net.au>
References: <1507899796-7941-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1507899796-7941-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <KL1PR06MB1702D289BE9642F285CF9ED1B84F0@KL1PR06MB1702.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <KL1PR06MB1702D289BE9642F285CF9ED1B84F0@KL1PR06MB1702.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 16, 2017 at 08:34:35AM +0000, Biju Das wrote:
> Hi,
> 
> Looks like the chosen node "stdout-path = "serial0:115200n8";" is not updated with this patch.
> 
> So either drop the patch or fix the chosen node.

Please repost this patch with the above resolved.
