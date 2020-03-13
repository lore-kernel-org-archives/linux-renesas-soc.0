Return-Path: <SRS0=s2bI=46=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A20C10DCE
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 13 Mar 2020 21:20:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B86A420752
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 13 Mar 2020 21:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584134437;
	bh=DsgiAeixQE9MzdnS0e+K5ZXmM1IUx5POsgFVtKtDAdU=;
	h=Subject:From:Date:To:List-ID:From;
	b=Us6dhUFvsxTrWzSPzuOQrDYtWXaCPsAsXoE7L+I3LrRWDfxv396Jv1M79xNamvLmu
	 3t20ISzBpn29kVoib/+59AyjK17MdoAMkWEvHOjCj/tuTBQhmdWje1cpy0/vtw1UhU
	 dmd2whpCMPR3nhSqOHnG65FHE2AoP76Unh2ErbvE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgCMVUh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 13 Mar 2020 17:20:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:42988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726480AbgCMVUh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Mar 2020 17:20:37 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584134437;
        bh=DsgiAeixQE9MzdnS0e+K5ZXmM1IUx5POsgFVtKtDAdU=;
        h=Subject:From:Date:To:From;
        b=mSBH/g8v1dLzknvzpAYaDqDnakjThjBdWBIc+poXHNzzunqgmxh4tZrzHGd4m4PB/
         kOCcX4qVDN9t7AY9cq/qZEUVSMxHVs3sFvu6/oddVotrYFDnoWiavS5weFKYxJ5XQa
         ewnO1/gc+N972wuvHAM0x8bL3mEzYkYqT6s0CD4w=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158413443699.25193.9455477085409768039.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 13 Mar 2020 21:20:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] ov5645: Switch to assigned-clock-rates (2020-03-13T21:12:31)
  Superseding: [v2] ov5645: Switch to assigned-clock-rates (2020-03-12T21:12:29):
    [v2,1/3] media: dt-bindings: media: i2c: Switch to assigned-clock-rates
    [v2,2/3] media: i2c: ov5645: Switch to assigned-clock-rates
    [v2,3/3] ARM: dts: imx6qdl-wandboard: Switch to assigned-clock-rates for ov5645 node


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
