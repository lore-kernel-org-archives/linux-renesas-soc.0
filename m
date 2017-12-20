Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53550 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754673AbdLTKLk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 05:11:40 -0500
Date: Wed, 20 Dec 2017 11:11:36 +0100
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 5/5] ARM: dts: iwg20d-q7-common: Enable SGTL5000 audio
 codec
Message-ID: <20171220101136.kl4ffzw7fcf6ct55@verge.net.au>
References: <1513103111-45830-1-git-send-email-biju.das@bp.renesas.com>
 <1513103111-45830-6-git-send-email-biju.das@bp.renesas.com>
 <20171220095806.jqtkmximxybsq6tr@verge.net.au>
 <KL1PR06MB1702453058AFB66AA8110825B80C0@KL1PR06MB1702.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <KL1PR06MB1702453058AFB66AA8110825B80C0@KL1PR06MB1702.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Dec 20, 2017 at 10:02:54AM +0000, Biju Das wrote:
> Thanks Simon for this information.
> 
> Next time I will make sure that  compiler won't give any warning message with make dtbs W=1

Thanks, I've been on a bit of a mission to clean up such warnings of late.
