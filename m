Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43815 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726581AbeKHU2b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 15:28:31 -0500
Date: Thu, 8 Nov 2018 11:53:33 +0100
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: renesas: r8a7795: add SSIU support for sound
Message-ID: <20181108105327.mnktuhxdi6n6wucv@verge.net.au>
References: <877ehoe36e.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877ehoe36e.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 08, 2018 at 02:12:14AM +0000, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> rsnd sound driver will handle SSIU from v4.21 via DT.
> Of course it is keeping compatibility, thus, no SSIU settings
> is no problem.
> 
> SSIU handles BUSIFn, but rsnd driver had been assumed only BUSIF0 was used.
> Thus, SSIU / BUSIF0 was attached via SSI automatically,
> but it was not enough for TDM Split mode.
> 
> To enable TDM Split mode, we need to select BUSIFn via SSIU.
> This patch adds SSIU DT settings to r8a7795.
> 
> If we had SSIU DT settings, existing BUSIF0 settings via SSI
> is no longer needed. We want to remove it.
> To avoid git merge timing issue / git bisect issue,
> I will re-post "remove" patch later (= for v4.22).
> Please consider 1st patch and ignore 2nd patch so far.

Thanks. I have applied the 1st patch for v4.21. And marked the 2nd patch as
deferred. Please repost or ping me once v4.22-rc1 has been released.
