Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.135]:60604 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752648AbcJJO3M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Oct 2016 10:29:12 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yangbo Lu <yangbo.lu@nxp.com>,
        Lee Jones <lee.jones@linaro.org>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] soc: renesas: Identify SoC and register with the SoC bus
Date: Mon, 10 Oct 2016 16:28:28 +0200
Message-ID: <6327808.hNezbnImkk@wuerfel>
In-Reply-To: <1475572167-29581-1-git-send-email-geert+renesas@glider.be>
References: <1475572167-29581-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tuesday, October 4, 2016 11:09:23 AM CEST Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Some Renesas SoCs may exist in different revisions, providing slightly
> different functionalities (e.g. R-Car H3 ES1.x and ES2.0). This needs to
> be catered for by drivers and/or platform code.  The recently proposed
> soc_device_match() API seems like a good fit to handle this.
> 
> This patch series implements the core infrastructure to provide SoC and
> revision information through the SoC bus for Renesas ARM SoCs. It
> consists of 4 patches:
>   - Patch 1 avoids a crash when SoC revision information is needed and
>     provided early,
>   - Patch 2 (from Arnd) introduces the soc_device_match() API.
>     I don't know if, when, and through which channel this patch is
>     planned to go upstream,
>   - Patch 3 fixes a bug in soc_device_match(), causing a crash when
>     trying to match on an SoC attribute that is not provided (seen on
>     EMEV2, RZ/A, and R-Car M1A, which lack revision information),
>   - Patch 4 identifies Renesas SoCs and registers them with the SoC bus.
> 
> Tested on (family, machine, soc_id, optional revision):
> 
>     Emma Mobile EV2, EMEV2 KZM9D Board, emev2
>     RZ/A, Genmai, r7s72100
>     R-Mobile, APE6EVM, r8a73a4, ES1.0
>     R-Mobile, armadillo 800 eva, r8a7740, ES2.0
>     R-Car Gen1, bockw, r8a7778
>     R-Car Gen1, marzen, r8a7779, ES1.0
>     R-Car Gen2, Lager, r8a7790, ES1.0
>     R-Car Gen2, Koelsch, r8a7791, ES1.0
>     R-Car Gen2, Gose, r8a7793, ES1.0
>     R-Car Gen2, Alt, r8a7794, ES1.0
>     R-Car Gen3, Renesas Salvator-X board based on r8a7795, r8a7795, ES1.0
>     R-Car Gen3, Renesas Salvator-X board based on r8a7796, r8a7796, ES1.0
>     SH-Mobile, KZM-A9-GT, sh73a0, ES2.0

As mentioned in the comment for the driver patch, I think this makes
a lot of sense for the machines that have a revision register, in
particular when the interpretation of that register is always done
the same way, but I'm a bit skeptical about doing it in the same driver
for machines that don't have the register.

Matching by a device rather than the SoC platform also has the advantage
that there is no need to maintain a list of compatible numbers in the
driver.

	Arnd
