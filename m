Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:61796 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752078AbcK3PvC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Nov 2016 10:51:02 -0500
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Simon Horman <horms+renesas@verge.net.au>, arm@kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Match Updates for v4.10
Date: Wed, 30 Nov 2016 16:50:20 +0100
Message-ID: <6791283.iMDbrK21lt@wuerfel>
In-Reply-To: <cover.1479928995.git.horms+renesas@verge.net.au>
References: <cover.1479928995.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wednesday, November 23, 2016 9:13:31 PM CET Simon Horman wrote:
> This pull request is based on the pull request "soc_device_match()
> interface for matching against soc_bus attributes" sent by Geert
> Uytterhoeven which corresponds to the soc-device-match-tag1 tag in his
> renesas-driver's tree. It provides infrastructure used by changes in this
> pull request.
> 
> This pull request is broken out of an earlier pull request,
> "Second Round of Renesas ARM Based SoC Drivers Updates for v4.10".
> The motivation for breaking up the pull request is to provide
> branches with minimal dependencies.
> 
> This pull request is targeted at the next/drivers branch of the arm-soc tree.
> 
> It introduces some minor merge conflicts in drivers/soc/renesas/Makefile.
> The resolution is to take both sides.  A sample merge resolution is
> provided in the renesas-next-20161123v2-v4.9-rc1 tag of the renesas tree.
> 

Pulled into next/drivers, thanks!

	Arnd
