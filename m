Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59441 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727552AbeKIT06 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Nov 2018 14:26:58 -0500
Date: Fri, 9 Nov 2018 10:47:07 +0100
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
        Jiada Wang <jiada_wang@mentor.com>
Subject: Re: [PATCH 0/4] arm64: renesas: enable ULCB HDMI / ULCB-KF sound
Message-ID: <20181109094706.vinpd6h27yurehsb@verge.net.au>
References: <87in18e3um.wl-kuninori.morimoto.gx@renesas.com>
 <20181108104856.4ghuq6tytu6qwli3@verge.net.au>
 <875zx7kty8.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875zx7kty8.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 09, 2018 at 12:02:01AM +0000, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> > > These patches adds sound support for KingFisher.
> > > We can enable it on top of v4.20-rc1, but, it is not stable.
> > > We need this patch (= from ASoC for-v4.21 branch) to be stable it.
> > > 
> > > 	223bc10b84970fd772c105b550beeef3ac3502be
> > > 	("ASoC: pcm3168a: remove read-only status register from snd_kcontrol_new")
> > 
> > Perhaps it is best to wait for that patch to hit an rc release.
> > Do you know when that will happen?
> 
> It will be v4.21, not for v4.20.

Are the dependencies present in v4.21-rc1?
If so perhaps we could apply this series as
my branches are currently based on v4.21-rc1.

Let me know what you think.
