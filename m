Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41913 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753454AbeBGJoG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Feb 2018 04:44:06 -0500
Date: Wed, 7 Feb 2018 10:44:02 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] arm64: renesas_defconfig: enable R8A77980 SoC
Message-ID: <20180207094401.gxflheamr7l3jdih@verge.net.au>
References: <20180206132039.23437-1-horms+renesas@verge.net.au>
 <CAMuHMdUq92E8dcyBjkM0A_eoFhp_F6zA1pb5WvR2n_CSdUVFmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUq92E8dcyBjkM0A_eoFhp_F6zA1pb5WvR2n_CSdUVFmg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 06, 2018 at 03:44:13PM +0100, Geert Uytterhoeven wrote:
> On Tue, Feb 6, 2018 at 2:20 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> > Enable the Renesas R-Car V3H (R8A77980) SoC in the ARM64 renesas_defconfig.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>


I have applied this to the topic/renesas-defconfig branch which is included
in the devel branch and tags of the Renesas tree as a convenience to
developers.  The branch is not, however, included in the next branch or
tags nor is it targeted at upstream.
