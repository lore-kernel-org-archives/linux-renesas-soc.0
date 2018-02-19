Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56111 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751866AbeBSJCH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Feb 2018 04:02:07 -0500
Date: Mon, 19 Feb 2018 10:01:48 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] soc: renesas: r8a77970-sysc: fix power area parents
Message-ID: <20180219090147.shphjwtox5mywms3@verge.net.au>
References: <b133e895-8d5e-fbae-d15a-5cf759f09406@cogentembedded.com>
 <CAMuHMdXZY0cC1oV=_Tu5DFu8FJGhw7mZd=P+_4U4VAX629EqEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXZY0cC1oV=_Tu5DFu8FJGhw7mZd=P+_4U4VAX629EqEg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 19, 2018 at 09:38:15AM +0100, Geert Uytterhoeven wrote:
> On Fri, Feb 16, 2018 at 9:09 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > According to the figure 9.2(b) of the R-Car Series, 3rd Generation User’s
> > Manual: Hardware Rev. 0.80 the A2IRn and A2SCn power areas in R8A77970 have
> > the A3IR area as a parent, thus the SYSC driver has those parents wrong...
> >
> > Fixes: bab9b2a74fe9 ("soc: renesas: rcar-sysc: add R8A77970 support")
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Sorry for missing this in my original review.

Thanks, applied.
