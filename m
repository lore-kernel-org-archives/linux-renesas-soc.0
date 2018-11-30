Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52060 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726499AbeK3VhV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Nov 2018 16:37:21 -0500
Date: Fri, 30 Nov 2018 11:28:28 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: shmobile: R-Mobile: Clean up struct
 rmobile_pm_domain
Message-ID: <20181130102827.ps33kf7ywonpyitn@verge.net.au>
References: <20181129110931.11783-1-geert+renesas@glider.be>
 <20181129110931.11783-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181129110931.11783-2-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 29, 2018 at 12:09:30PM +0100, Geert Uytterhoeven wrote:
> Commit 59b89af1d5551c12 ("ARM: shmobile: sh7372: Remove Legacy C
> SoC code") removed the last user of the rmobile_pm_domain.resume()
> callback.
> 
> Commit 44d88c754e57a6d9 ("ARM: shmobile: Remove legacy SoC code
> for R-Mobile A1") removed the last user of the rmobile_pm_domain.no_debug
> flag and of the "pm-rmobile.h" header file (outside the actual driver).
> 
> Hence remove no longer used rmobile_pm_domain members, and absorb the
> header file into the driver.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.21.
