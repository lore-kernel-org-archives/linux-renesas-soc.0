Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54751 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751769AbdG0Pbq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2017 11:31:46 -0400
Date: Thu, 27 Jul 2017 17:31:26 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: shmobile: Remove ARCH_SHMOBILE_MULTI
Message-ID: <20170727153125.GM16143@verge.net.au>
References: <1500297834-7387-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500297834-7387-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 17, 2017 at 03:23:54PM +0200, Geert Uytterhoeven wrote:
> The migration from ARCH_SHMOBILE_MULTI to ARCH_RENESAS has been
> completed in v4.12 by commit 9ed2d4bc5c0c244d ("ARM: dts: renesas:
> Switch from ARCH_SHMOBILE_MULTI to ARCH_RENESAS"), so the
> ARCH_SHMOBILE_MULTI symbol can be removed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.14.
