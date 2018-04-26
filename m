Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39037 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753487AbeDZIl7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 04:41:59 -0400
Date: Thu, 26 Apr 2018 10:41:52 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77990: Revise the psci node
Message-ID: <20180426084151.jrgckql4tjnzthpx@verge.net.au>
References: <1524644410-12465-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1524644410-12465-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVKJ8m4vvpRD41Z10+AvF7z8FUG9e_Nz=NDwnhO3xD8wQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVKJ8m4vvpRD41Z10+AvF7z8FUG9e_Nz=NDwnhO3xD8wQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Apr 25, 2018 at 11:13:39AM +0200, Geert Uytterhoeven wrote:
> On Wed, Apr 25, 2018 at 10:20 AM, Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > The basic support patch 2d2dbadba421 ("arm64: dts: renesas: Add Renesas
> > R8A77990 SoC support") lacks the compatible "arm,psci-1.0" in the psci
> > node. So, this patch revises it.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
