Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:33787 "EHLO
	mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751175AbcFCBuO (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 2 Jun 2016 21:50:14 -0400
Date: Thu, 2 Jun 2016 20:50:12 -0500
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, pawel.moll@arm.com,
	mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 06/13] DT: clock: cpg-mstp-clocks:
 document-R8A7792-support
Message-ID: <20160603015012.GA16902@rob-hp-laptop>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <1627751.dcAYzyCZSM@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1627751.dcAYzyCZSM@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 01, 2016 at 01:21:26AM +0300, Sergei Shtylyov wrote:
> Renesas R8A7792 SoC also has the CPG MSTP clocks...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt |    1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
