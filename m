Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:59896 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752004AbcDZIQ4 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 26 Apr 2016 04:16:56 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms+renesas@verge.net.au>,
	"arm@kernel.org" <arm@kernel.org>,
	linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL v2] Renesas ARM Based SoC DT Updates for v4.7
Date: Tue, 26 Apr 2016 10:12:53 +0200
Message-ID: <7781705.p6jrBl2RnJ@wuerfel>
In-Reply-To: <CAMuHMdV_DN4YEzP1urC9LmKga6rkstGNDv20i96qnb=kS1+skw@mail.gmail.com>
References: <cover.1461558315.git.horms+renesas@verge.net.au> <4737327.YB9LJZXs32@wuerfel> <CAMuHMdV_DN4YEzP1urC9LmKga6rkstGNDv20i96qnb=kS1+skw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tuesday 26 April 2016 09:30:45 Geert Uytterhoeven wrote:
> 
> Commit 93fafa81cad3da9c ("Merge branches 'next/dt' and 'next/dt64' into
> for-next") accidentally re-added the line
> 
>         clock-output-names = "can_clk";
> 
> to arch/arm/boot/dts/r8a7791.dtsi, which was removed in commit
> f617604fe5d74b9c ("ARM: dts: r8a7791: Remove unnecessary
> clock-output-names properties") before.  It seems the same wrong
> conflict resolution was made before in commit ef3b08c6c0d85753 ("Merge
> branch 'fixes' into for-next").
> 
> While this won't cause failures, can you please remove the offending
> line?
> 

I've merged renesas-fixes-for-v4.6 into next/dt now to resolve
the conflict there, otherwise Linus would have to do the same resolution
during the merge window.

Thanks for letting us know. If you want to verify my new resolution,
please look at next/dt, which is the more important branch.

	Arnd
