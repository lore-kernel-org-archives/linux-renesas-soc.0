Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46323 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161922AbdEZHDo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 May 2017 03:03:44 -0400
Date: Fri, 26 May 2017 09:03:41 +0200
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: renesas: add 12288000 for sound ADG
Message-ID: <20170526070340.GF2628@verge.net.au>
References: <87efvfovig.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87efvfovig.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 24, 2017 at 02:14:52AM +0000, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> These adds missing audio clock settings to salvator / ulcb
> 
> Kuninori Morimoto (2):
>   arm64: renesas: salvator-x: add 12288000 for sound ADG
>   arm64: renesas: ulcb: add 12288000 for sound ADG

Thanks, I have queued these up for v4.13.
If you'd like them considered for -stable then let me know
and we can try and work something out.
