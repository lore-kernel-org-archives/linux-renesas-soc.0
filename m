Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43039 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbeISOob (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 10:44:31 -0400
Date: Wed, 19 Sep 2018 11:07:30 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC PATCH] arm64: dts: renesas: gen3: use 400kHz for I2C DVFS
 bus
Message-ID: <20180919090728.5hfbtqesriwgphq5@verge.net.au>
References: <20180918091433.13019-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWm=bFJKHoOaQqbczCWc0YLfvCROeOKXZCgL4iRmKR88A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWm=bFJKHoOaQqbczCWc0YLfvCROeOKXZCgL4iRmKR88A@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 18, 2018 at 11:24:49AM +0200, Geert Uytterhoeven wrote:
> On Tue, Sep 18, 2018 at 11:14 AM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > The PMIC and EEPROM can operate at 400kHz, so use this speed.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.20.
