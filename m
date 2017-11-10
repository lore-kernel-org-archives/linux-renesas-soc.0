Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54794 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752405AbdKJLg3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Nov 2017 06:36:29 -0500
Date: Fri, 10 Nov 2017 12:36:24 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>
Subject: Re: [PATCH 1/7] arm64: dts: renesas: r8a7796: Add IPMMU device nodes
Message-ID: <20171110113623.6jjl6jvnnzu4y5pi@verge.net.au>
References: <20171101103458.7582-1-horms+renesas@verge.net.au>
 <20171101103458.7582-2-horms+renesas@verge.net.au>
 <CAMuHMdWdPmU=16B8BbfTD316MWOGVVhb4-vcg7yr-JBLKDwjdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWdPmU=16B8BbfTD316MWOGVVhb4-vcg7yr-JBLKDwjdg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 07, 2017 at 10:54:17AM +0100, Geert Uytterhoeven wrote:
> On Wed, Nov 1, 2017 at 11:34 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> >
> > Add r8a7796 IPMMU nodes and keep all disabled by default.
> >
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> > [simon: update names]
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> My comments for r8a7795.dtsi about IPMMU-* comments and power-domains
> properties are applicable here, too.

Thanks, will fix.
