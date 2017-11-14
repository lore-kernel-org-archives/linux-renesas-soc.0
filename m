Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40269 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751887AbdKNJA0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2017 04:00:26 -0500
Date: Tue, 14 Nov 2017 10:00:06 +0100
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] iommu/ipmmu-vmsa: Add r8a779(6|70|95)
 DT bindings
Message-ID: <20171114090005.kyfrf5oqdv632oqw@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

please consider pulling IPMMU DT bindings for the
r8a7796 (R-Car M3-W), r8a77970 (R-Car V3M) and r8a77995 (R-Car D3) SoCs.

This is v5 of the bindings for the r8a7796, they are unchanged since v4.
The bindings for the r8a77970 and r8a77995 are new.

I will provide the corresponding driver and DTS updates for these SoCs
separately.

This pull request is based on the iommu/ipmmu-vmsa branch of the vfio tree
which now includes the IPMMU driver and bindings for the r8a7795 (R-Car H3)
SoC.


The following changes since commit 58b8e8bf409236cdea379b8a3ab5d7b85a003d22:

  iommu/ipmmu-vmsa: Hook up r8a7795 DT matching code (2017-11-06 10:29:39 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/ipmmu-bindings

for you to fetch changes up to 213f5b188beadbf3e8361eb0157e8a3e7f82f840:

  iommu/ipmmu-vmsa: Add r8a779(70|95) DT bindings (2017-11-10 11:52:16 +0100)

----------------------------------------------------------------
Magnus Damm (1):
      iommu/ipmmu-vmsa: Add r8a7796 DT binding

Simon Horman (1):
      iommu/ipmmu-vmsa: Add r8a779(70|95) DT bindings

 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt | 3 +++
 1 file changed, 3 insertions(+)
