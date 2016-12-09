Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51910 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932345AbcLIKNs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Dec 2016 05:13:48 -0500
Date: Fri, 9 Dec 2016 11:13:37 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH renesas/devel] arm64: dts: r8a7795: Use Gen 3 fallback
 compat string for PCIE
Message-ID: <20161209101337.GA6439@verge.net.au>
References: <1481210969-2574-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdV9uumxxwsU_7pL+8Eo+n7+-Os+h7n8tbNvtdVp4pH5hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV9uumxxwsU_7pL+8Eo+n7+-Os+h7n8tbNvtdVp4pH5hg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Dec 09, 2016 at 11:01:00AM +0100, Geert Uytterhoeven wrote:
> On Thu, Dec 8, 2016 at 4:29 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> > Use recently added en 3 fallback compat string for PCIE
> > in r8a7795 DT.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have queued this up for v4.11.
