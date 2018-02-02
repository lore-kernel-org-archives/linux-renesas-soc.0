Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41058 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751017AbeBBIvF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Feb 2018 03:51:05 -0500
Date: Fri, 2 Feb 2018 09:51:01 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] DT: arm: shmobile: document R8A77980 SoC bindings
Message-ID: <20180202085100.ptwsx7esrfjlmgpk@verge.net.au>
References: <fbdd08a3-1ab3-8e70-20f1-d9c41493b11c@cogentembedded.com>
 <d238e77a-e304-1fca-7ca6-bb99f6e55a68@cogentembedded.com>
 <CAMuHMdUJtCjkSGFTWKhCgCmfDsA7hQ+T=-dZwaeLEZ2L1qvGJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUJtCjkSGFTWKhCgCmfDsA7hQ+T=-dZwaeLEZ2L1qvGJw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 01, 2018 at 09:01:54PM +0100, Geert Uytterhoeven wrote:
> On Wed, Jan 31, 2018 at 8:56 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > Document the R-Car V3H (R8A77980) SoC device tree bindings.
> >
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Some people may complain about the subject prefix, though.

I'm a bit unsure about what to do about prefixes for that file.
I've gone with the following which seems sensible to me.

arm64: renesas: document R8A77980 SoC bindings 
