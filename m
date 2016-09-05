Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52469 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754802AbcIEMBK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Sep 2016 08:01:10 -0400
Date: Mon, 5 Sep 2016 14:01:04 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] Add R8A7792/Wheat QSPI support
Message-ID: <20160905120104.GB24256@verge.net.au>
References: <1648590.FPpmBRoQyh@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1648590.FPpmBRoQyh@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Sep 03, 2016 at 01:04:37AM +0300, Sergei Shtylyov wrote:
> Hello.
> 
>    Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20160902-v4.8-rc4' tag plus the Wheat board patches posted this
> week. We're adding the R8A7792/Wheat QSPI clocks and device nodes. The board
> patch depends on the PFC driver QSPI patch in order for the QSPI pins to be
> configured...
> 
> [1/3] ARM: dts: r8a7792: add QSPI clock
> [2/3] ARM: dts: r8a7792: add QSPI support
> [3/3] ARM: dts: wheat: add QSPI support

Thanks, I have queued these up.
