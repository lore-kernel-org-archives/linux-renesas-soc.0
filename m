Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40422 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729385AbeH3Sut (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 14:50:49 -0400
Date: Thu, 30 Aug 2018 16:48:15 +0200
From: Simon Horman <horms@verge.net.au>
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: dts: r9a06g032: Use r9a06g032-sysctrl binding
 definitions
Message-ID: <20180830144815.fxx33vivj2uug6h4@verge.net.au>
References: <20180828151231.16177-1-geert+renesas@glider.be>
 <TY1PR01MB176981A54D0CC211218831DCF5080@TY1PR01MB1769.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB176981A54D0CC211218831DCF5080@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 30, 2018 at 09:44:23AM +0000, Phil Edworthy wrote:
> Hi Geert,
> 
> On 28 August 2018 16:13, Geert Uytterhoeven wrote:
> > Replace the hardcoded clock indices by R9A06G032_CLK_* symbols.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Phil Edworthy <phil.edworthy@renesas.com>

Thanks Geert, thanks Phil, applied for v4.20.
