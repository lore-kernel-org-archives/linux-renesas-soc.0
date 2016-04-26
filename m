Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:61069 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751101AbcDZLNp (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 26 Apr 2016 07:13:45 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Simon Horman <horms+renesas@verge.net.au>, arm@kernel.org,
	Kevin Hilman <khilman@linaro.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Renesas ARM Based SoC PCI Defconfig Updates for v4.7
Date: Tue, 26 Apr 2016 13:13:04 +0200
Message-ID: <4949462.nM0EuO7OEc@wuerfel>
In-Reply-To: <cover.1461631445.git.horms+renesas@verge.net.au>
References: <cover.1461631445.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tuesday 26 April 2016 10:50:10 Simon Horman wrote:
> Please consider these Renesas ARM based SoC PCI defconfig updates for v4.7.
> 
> 
> This pull request includes a single patch with changes that I would
> ordinarily be inclined to split into different branches. However,
> are most easily done atomicly and as they are rather small I have
> kept them in one patch in its own branch. My hope is that you can find
> an appropriate home for it.
> 
> The patch updates renames PCI_RCAR_GEN2_PCIE Kconfig symbol
> as PCIE_RCAR. It includes PCI Makefile and Kconfig changes and
> accordingly the patch has an ack from Bjorn Helgaas. It also updates
> arm and arm64 defconfigs.
> 

I've merged it into next/defconfig and made sure we don't (yet) have
any conflicts against changes in the arm64 defconfig. Thanks,

	Arnd
