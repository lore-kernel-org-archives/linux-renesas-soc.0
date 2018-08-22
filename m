Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50227 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728280AbeHVN7j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 09:59:39 -0400
Date: Wed, 22 Aug 2018 12:35:15 +0200
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm: dts: Include R-Car Gen1 product name in DTSI files
Message-ID: <20180822103515.j7aago6muxdsmxbi@verge.net.au>
References: <153477388406.17364.12188160262873747451.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <153477388406.17364.12188160262873747451.sendpatchset@octo>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Aug 20, 2018 at 11:04:44PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Browsing the DTS for all the R-Car SoCs with similar part numbers
> still makes my head hurt, so to improve the user friendliness of
> the 32-bit ARM DTS code base include R-Car Gen1 product names for
> each DTSI file.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thanks Magnus,

Thanks a lot for this.  Similar changes you already made have already
proved useful. I've applied this for v4.20.
