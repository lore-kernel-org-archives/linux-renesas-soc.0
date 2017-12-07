Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37179 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752628AbdLGKaU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Dec 2017 05:30:20 -0500
Date: Thu, 7 Dec 2017 11:29:59 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] PCI: rcar: Misc error path fixes
Message-ID: <20171207102958.l3csy4en2phpbzhp@verge.net.au>
References: <1512641720-4715-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512641720-4715-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Dec 07, 2017 at 11:15:18AM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Lorenzo, Bjorn,
> 
> This patch series fixes two issues in the error path for the R-Car PCIe
> host bridge driver.
> 
> The first issue is triggered easily by not having a PCIe card inserted,
> and may cause a crash.
> 
> Thanks!

Acked-by: Simon Horman <horms+renesas@verge.net.au>
