Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43273 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726919AbeILP2z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Sep 2018 11:28:55 -0400
Date: Wed, 12 Sep 2018 12:24:59 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Nguyen An Hoan <na-hoan@jinso.co.jp>, broonie@kernel.org,
        linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        magnus.damm@gmail.com, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
Subject: Re: [PATCH 1/2] arm64: dts: r8a77965: add FDP1 device nodes
Message-ID: <20180912102457.jlzs2wn4mllwtvem@verge.net.au>
References: <1535086349-10657-1-git-send-email-na-hoan@jinso.co.jp>
 <8040588.1BRXcikCUd@avalon>
 <20180827125704.jg4zuj2pfjykbcga@verge.net.au>
 <23995298.iSy7kN2eB8@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23995298.iSy7kN2eB8@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 28, 2018 at 12:56:18PM +0300, Laurent Pinchart wrote:
> Hi Simon,
> 
> On Monday, 27 August 2018 15:57:05 EEST Simon Horman wrote:
> > On Fri, Aug 24, 2018 at 11:45:52AM +0300, Laurent Pinchart wrote:
> > > On Friday, 24 August 2018 07:52:28 EEST Nguyen An Hoan wrote:
> > > > From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> > > 
> > > You're missing a commit message. I agree that for simple patches like this
> > > one the subject line often contains enough information, but adding a
> > > commit message is still a good practice that we try to enforce through
> > > the kernel. For instance, looking at git history for r8a7796, you could
> > > use
> > > 
> > > "The r8a77965 has a single FDP1 instance."
> > > 
> > > > Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> > > 
> > > Apart from that,
> > > 
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > 
> > > Simon, could you update the commit message when taking this patch in your
> > > tree, to avoid the need for a v2 ?
> > 
> > Yes, can do.
> > 
> > Can I confirm that it is safe, from a regression point of view,
> > to apply this patch without patch 2/2?
> 
> As far as I know it is safe, yes.

Thanks, applied for v4.20.
