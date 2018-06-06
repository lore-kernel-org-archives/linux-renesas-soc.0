Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52899 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932268AbeFFIwX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 04:52:23 -0400
Date: Wed, 6 Jun 2018 10:52:20 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] soc: renesas: rcar-sysc: Make PM domain initialization
 more robust
Message-ID: <20180606085218.5ug5moky75pzlrim@verge.net.au>
References: <1528211115-12334-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1528211115-12334-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jun 05, 2018 at 05:05:15PM +0200, Geert Uytterhoeven wrote:
> The quirk for R-Car E3 ES1.0 added in commit 086b399965a7ee7e ("soc:
> renesas: r8a77990-sysc: Add workaround for 3DG-{A,B}") makes the 3DG-A
> PM domain a subdomain of the 3DG-B PM domain.  However, registering
> 3DG-A with its parent fails silently, as the 3DG-B PM domain hasn't been
> registered yet, and such failures are never reported.
> 
> Fix this by:
>   1. Splitting PM Domain initialization in two steps, so all PM domains
>      are registered before any child-parent links are established,
>   2. Reporting any failures in establishing child-parent relations.
> 
> Check for and report pm_genpd_init() failures, too, as that function
> gained a return value in commit 7eb231c337e00735 ("PM / Domains: Convert
> pm_genpd_init() to return an error code").
> 
> Fixes: 086b399965a7ee7e ("soc: renesas: r8a77990-sysc: Add workaround for 3DG-{A,B}")

That makes this a fix for v4.18, right?

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
