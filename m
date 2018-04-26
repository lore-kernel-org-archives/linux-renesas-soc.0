Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39050 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753232AbeDZInE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 04:43:04 -0400
Date: Thu, 26 Apr 2018 10:43:01 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77990: Revise the cache
 controller node
Message-ID: <20180426084300.b43pcz5cdaepzy57@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32b91531-20a4-4831-faaf-e03a35238db3@cogentembedded.com>
 <CAMuHMdUZ7p+9Qb9F37EdOz_C4HaMzVkW1ahHtaKUDAD4iw8nQQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Apr 25, 2018 at 11:13:23AM +0200, Geert Uytterhoeven wrote:
> On Wed, Apr 25, 2018 at 10:20 AM, Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > The cache controller node should not have unit-addresses and reg
> > properties. So, this patch revises them.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

On Wed, Apr 25, 2018 at 07:15:31PM +0300, Sergei Shtylyov wrote:
> On 04/25/2018 11:20 AM, Yoshihiro Shimoda wrote:
> 
> > The cache controller node should not have unit-addresses and reg
> > properties. So, this patch revises them.
> 
>    Removes?

Thanks, applied with Geert's tag and Sergei's suggestion.
