Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48411 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751307AbdJMILW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2017 04:11:22 -0400
Date: Fri, 13 Oct 2017 10:11:04 +0200
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: renesas: fixup audio_clkout
Message-ID: <20171013081103.glnbrmoasw3747lk@verge.net.au>
References: <87mv4vvbsh.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mv4vvbsh.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 13, 2017 at 05:56:02AM +0000, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> These are small bug on DT for audio_clkout, but it doesn't have
> real effect on real board.
> These are fixup patch for it. Not super serious

Thanks, applied for v4.15.
