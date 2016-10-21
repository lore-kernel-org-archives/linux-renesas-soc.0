Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:39140 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751033AbcJUJxv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Oct 2016 05:53:51 -0400
Date: Fri, 21 Oct 2016 10:53:19 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] ARM: dts: renesas: Remove skeleton.dtsi inclusion
Message-ID: <20161021095319.GC15372@leverpostej>
References: <1477041370-22778-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1477041370-22778-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 21, 2016 at 11:16:05AM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> As of commit 9c0da3cc61f1233c ("ARM: dts: explicitly mark skeleton.dtsi
> as deprecated"), including skeleton.dtsi is deprecated.
> Hence this series removes its use for all Renesas 32-bit ARM SoCs.

Thanks for doing this! FWIW, for the series:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Thanks,
Mark.
