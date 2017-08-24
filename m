Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42975 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751114AbdHXKur (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 06:50:47 -0400
Date: Thu, 24 Aug 2017 06:50:36 -0400
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/2] ARM: dts: r8a7791: CPG/MSSR conversion fallout
Message-ID: <20170824105035.GC27788@verge.net.au>
References: <1503489566-9423-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1503489566-9423-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 23, 2017 at 01:59:24PM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> Here are the two remaining patches from the series "[PATCH v2 0/5] ARM:
> dts: rcar-gen2: Convert to new CPG/MSSR bindings" and "[PATCH v2 0/4] ARM:
> dts: rcar-gen2: Stop grouping clocks under a "clocks" subnode", rebased
> against renesas-devel-20170822-v4.13-rc6 (actually no changes at all!).
> 
> Thanks for applying!
> 
> Geert Uytterhoeven (2):
>   ARM: dts: r8a7791: Convert to new CPG/MSSR bindings
>   ARM: dts: r8a7791: Stop grouping clocks under a "clocks" subnode

Thanks, applied for v4.15
