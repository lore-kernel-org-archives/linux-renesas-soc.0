Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:54397 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751149AbcGNPzH (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 14 Jul 2016 11:55:07 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL v2] Second Round of Renesas ARM64 Based SoC DT Updates for v4.8
Date: Thu, 14 Jul 2016 17:54:25 +0200
Message-ID: <8207439.0JmbbpvM5T@wuerfel>
In-Reply-To: <cover.1467900241.git.horms+renesas@verge.net.au>
References: <cover.1467900241.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thursday, July 7, 2016 4:39:45 PM CEST Simon Horman wrote:
>       arm64: dts: r8a7796: Add SYSC PM Domains
> 

While doing some sanity checks on our branch contents, I noticed
that this commit breaks running "make dtbs" on top of our next/dt64
branch, and I'd like to avoid that.

I found a couple more problems (tegra and meson), and I ended up
fixing them all up (by merging the dependencies into next/dt64),
so everything is sorted for 4.8, but it would be good to do a
'make dtbs' run on a branch that has dt changes before you send it,
and I'll try to do the same when pulling it to avoid the problem in
the future.

	Arnd
