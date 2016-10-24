Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59111 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757296AbcJXHED (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2016 03:04:03 -0400
Date: Mon, 24 Oct 2016 09:03:53 +0200
From: Simon Horman <horms@verge.net.au>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] ARM: dts: renesas: Remove skeleton.dtsi inclusion
Message-ID: <20161024070350.GA13933@verge.net.au>
References: <1477041370-22778-1-git-send-email-geert+renesas@glider.be>
 <20161021095319.GC15372@leverpostej>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161021095319.GC15372@leverpostej>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 21, 2016 at 10:53:19AM +0100, Mark Rutland wrote:
> On Fri, Oct 21, 2016 at 11:16:05AM +0200, Geert Uytterhoeven wrote:
> > 	Hi Simon, Magnus,
> > 
> > As of commit 9c0da3cc61f1233c ("ARM: dts: explicitly mark skeleton.dtsi
> > as deprecated"), including skeleton.dtsi is deprecated.
> > Hence this series removes its use for all Renesas 32-bit ARM SoCs.
> 
> Thanks for doing this! FWIW, for the series:
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>

Thanks, I have queued these up.
