Return-Path: <SRS0=pR6V=CY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7DFC43461
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Sep 2020 18:37:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0388920732
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Sep 2020 18:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600195062;
	bh=CMtiougGqM3CHJHt5rdqDqs94HBM06Vqs/Tj9zXDs40=;
	h=Subject:From:Date:To:List-ID:From;
	b=Xi0W9bJ4jyUF881xHDhvkk2AZenCyKmlvwQrwczxnQ9TxkhSadTc2wVHixR2I+IIO
	 wVr9aQhYvYYFyrZvssjI2zhfQtIeAleuMWruV9ZQe9NGJpk8Rj046Ms7YlwOISgFXl
	 VJDnW5GdmcX4rFsW/T5cmcIEQSTa4my11jgK7XY0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgIOShh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 15 Sep 2020 14:37:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:35568 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727998AbgIOSB0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 14:01:26 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600192847;
        bh=CMtiougGqM3CHJHt5rdqDqs94HBM06Vqs/Tj9zXDs40=;
        h=Subject:From:Date:To:From;
        b=iDVEyWYPHS3toPaJWdpKrteoWiR5kJMfrQU8A5eV3S1X5/zMfYuDlYaDVgF7yb6Xo
         Bc7Qp1200fMUAg4YciJskn59PpNMFd6g5KV7I1vBHtW5C5BSxhaOgdVgl9JWZno9OK
         xBNf9qBPmNVN97Gd7MEKkID0KufTkcKTz94mNCbM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160019284719.7519.1265805655712963040.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 15 Sep 2020 18:00:47 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] iommu: Kconfig: Update help description for IPMMU_VMSA config (2020-09-15T17:55:23)
  Superseding: [v1] iommu: Kconfig: Update help description for IPMMU_VMSA config (2020-09-11T10:19:12):
    iommu: Kconfig: Update help description for IPMMU_VMSA config


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
