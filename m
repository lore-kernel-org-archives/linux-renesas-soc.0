Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50328 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750998AbcKGMcp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 07:32:45 -0500
Date: Mon, 7 Nov 2016 13:32:38 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 03/11] arm64: dts: r8a7795: salvator-x: Enable UHS-I
 SDR-104
Message-ID: <20161107123237.GC12319@verge.net.au>
References: <1473764228-24768-1-git-send-email-horms+renesas@verge.net.au>
 <1473764228-24768-4-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdW8WMFMWzjr+KnrifbOgvJV3dZWxC3zVYMfSvd=L6KAsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW8WMFMWzjr+KnrifbOgvJV3dZWxC3zVYMfSvd=L6KAsw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 25, 2016 at 12:48:40PM +0200, Geert Uytterhoeven wrote:
> On Tue, Sep 13, 2016 at 12:57 PM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Add the sd-uhs-sdr104 property to SDHI0 and SDHI1.
> 
> SDHI0 and SDHI3?

Thanks, I will fix that.
