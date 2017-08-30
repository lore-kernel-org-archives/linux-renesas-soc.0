Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53217 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751039AbdH3Gox (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 02:44:53 -0400
Date: Wed, 30 Aug 2017 08:44:48 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: r8a77995: update PFC node name to
 pin-controller
Message-ID: <20170830064447.GC10398@verge.net.au>
References: <1503992159-16354-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVdZg4x6xEcP=h0anrXTMc=9eLN9vJAeaYSj2ci9t9TcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVdZg4x6xEcP=h0anrXTMc=9eLN9vJAeaYSj2ci9t9TcQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 29, 2017 at 09:47:51AM +0200, Geert Uytterhoeven wrote:
> On Tue, Aug 29, 2017 at 9:35 AM, Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > This patch changes the name from from e6060000.pfc and pfc@e6060000 to
> > e6060000.pin-controller and pin-controller@e6060000 like other Renesas
> > SoCs.
> >
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
