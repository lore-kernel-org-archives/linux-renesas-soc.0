Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52192 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936399AbcKWO1e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2016 09:27:34 -0500
Date: Wed, 23 Nov 2016 15:19:44 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] ARM: dts: r8a7743/r8a7745: Add device nodes for PRR
Message-ID: <20161123141943.GC9057@verge.net.au>
References: <1479465463-19572-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479465463-19572-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 18, 2016 at 11:37:41AM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series adds the device nodes for the Product Register to the
> recently added RZ/G DTS files, which allow to provide SoC product
> and revision information.
> 
> This depends on "[PATCH 0/2] ARM: dts: r8a7743/r8a7745: Move RST nodes
> before SYSC nodes".

Thanks, I have queued these up for v4.11.
