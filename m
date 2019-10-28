Return-Path: <SRS0=Uybg=YV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB14FCA9EC0
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Oct 2019 16:40:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8474E20717
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Oct 2019 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572280842;
	bh=j4BFZAa+lLyYyJQi9Ncs8S3bKr8Gdc5zBF++yf6bK44=;
	h=Subject:From:Date:To:List-ID:From;
	b=NaZT4MXm67l/SiGC+V2Oapm2RGr+VIxZfdj/EkxogKUik4AcMhDTdsdfb0GSV2WFD
	 zW+U/rRatvqN/h5gSlSm/bRzbwsKmBBlTJ5/lnY94YKFn7XT7EzGU4KElGxNMH1wHl
	 x9y4BayJ1ZmMqSfdTMQcrhKeybh7P5xaH72S92aI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733084AbfJ1Qkm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Oct 2019 12:40:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:49166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733000AbfJ1Qkm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Oct 2019 12:40:42 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572280841;
        bh=j4BFZAa+lLyYyJQi9Ncs8S3bKr8Gdc5zBF++yf6bK44=;
        h=Subject:From:Date:To:From;
        b=MZSiMEGFXiikUfPQGxjLD+nBiYSOI0msy6aHBIwqqR/DrhO7WlKXZYPqeAEjpSlgJ
         xsLOklAKNtcCIrYUJ39cL+TBOetTBLKXgj6M8OdWCyIDxj5/e88U2E7cP+o8SNPKRa
         d2lZ9hrH9ZQnWRWuKHkzo3Vd3AAF9rRJFkvXDKJU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157228084162.22528.6402942408996974285.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 28 Oct 2019 16:40:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] PCI host resource consolidation (2019-10-28T16:32:31)
  Superseding: [v2] PCI host resource consolidation (2019-10-16T20:06:22):
    [v2,01/25] resource: Add a resource_list_get_entry_of_type helper
    [v2,02/25] PCI: Export pci_parse_request_of_pci_ranges()
    [v2,03/25] PCI: aardvark: Use pci_parse_request_of_pci_ranges()
    [v2,04/25] PCI: altera: Use pci_parse_request_of_pci_ranges()
    [v2,05/25] PCI: dwc: Use pci_parse_request_of_pci_ranges()
    [v2,06/25] PCI: faraday: Use pci_parse_request_of_pci_ranges
    [v2,07/25] PCI: iproc: Use pci_parse_request_of_pci_ranges()
    [v2,08/25] PCI: mediatek: Use pci_parse_request_of_pci_ranges()
    [v2,09/25] PCI: mobiveil: Use pci_parse_request_of_pci_ranges()
    [v2,10/25] PCI: rockchip: Use pci_parse_request_of_pci_ranges()
    [v2,11/25] PCI: rockchip: Drop storing driver private outbound resource data
    [v2,12/25] PCI: v3-semi: Use pci_parse_request_of_pci_ranges()
    [v2,13/25] PCI: xgene: Use pci_parse_request_of_pci_ranges()
    [v2,14/25] PCI: xilinx: Use pci_parse_request_of_pci_ranges()
    [v2,15/25] PCI: xilinx-nwl: Use pci_parse_request_of_pci_ranges()
    [v2,16/25] PCI: versatile: Use pci_parse_request_of_pci_ranges()
    [v2,17/25] PCI: versatile: Remove usage of PHYS_OFFSET
    [v2,18/25] PCI: versatile: Enable COMPILE_TEST
    [v2,19/25] PCI: of: Add inbound resource parsing to helpers
    [v2,20/25] PCI: ftpci100: Use inbound resources for setup
    [v2,21/25] PCI: v3-semi: Use inbound resources for setup
    [v2,22/25] PCI: xgene: Use inbound resources for setup
    [v2,23/25] PCI: iproc: Use inbound resources for setup
    [v2,24/25] PCI: rcar: Use inbound resources for setup
    [v2,25/25] PCI: Make devm_of_pci_get_host_bridge_resources() static


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
