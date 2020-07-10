Return-Path: <SRS0=RCqL=AV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEDCC433E1
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 10 Jul 2020 12:20:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A58CC20772
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 10 Jul 2020 12:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594383646;
	bh=TzohFeuVo2jGYmcm+Ex4Vhltc0BHeHYH+AcVUYCZGXE=;
	h=Subject:From:Date:To:List-ID:From;
	b=gYMAidCksVP2jL2634kNUu0tWgmns8UgNsGv1pFjAUqrImvKUlhi8AT+SUuukG5zj
	 ocm7Okmchl8IEDGDGRlczeqyElfBcpDh/5fcT76FDIBJ1TdCkCzL/jfj5etEMdIrBn
	 ve6LyLJXis0FO/hYQzbz7cW70E5rzpaFaxrTJS3c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgGJMUq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 10 Jul 2020 08:20:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:58398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726774AbgGJMUq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Jul 2020 08:20:46 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594383646;
        bh=TzohFeuVo2jGYmcm+Ex4Vhltc0BHeHYH+AcVUYCZGXE=;
        h=Subject:From:Date:To:From;
        b=he0Vu0fZnAD0BbCEDuCoML76ZTOsbepgIJV7n5AlCZ85kiQdQ4g55hg1MhgdyQT3w
         mKe1iWpf0NI33M/80N6MxVusC1eCtuZUQr/HwbkeFnGGCAnjW0ejAiOccRr+SwM/N7
         g0rs6CABKicLP1mbBKf1LsRgfJKgTPmyAcbfTz2I=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159438364602.22621.10048639800060464927.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 10 Jul 2020 12:20:46 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v1] ARM: dts: shmobile: Fix SD Card/eMMC interface device node names (2020-07-10T12:08:56)
  Superseding: [v1] ARM: dts: shmobile: Fix SD Card/eMMC interface device node names (2020-07-10T12:04:12):
    [/home/shimoda/make_patches/renesas/2020-07-10-fix-arm-mmc-name/] ARM: dts: shmobile: Fix SD Card/eMMC interface device node names


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
