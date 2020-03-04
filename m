Return-Path: <SRS0=lC7Z=4V=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64686C3F2D1
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  4 Mar 2020 16:00:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 38D2E2166E
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  4 Mar 2020 16:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583337639;
	bh=ldhwBdiJCf09VelMcCKiKLy47lhRfru38junmddRuNE=;
	h=Subject:From:Date:To:List-ID:From;
	b=XGmGaU9AU37FHN4l6CqJRQScfnBSmMj3d4dk2Ew/9yl3+VWJHHKvnlxC5ReQMDJs2
	 FLFG2n4qpxalAV23iBNk82eitu4xKgw6SzEtOJLtGIBtMxLJ3sREIOwnq+3O7sNPuw
	 +48z3le/gYCP7fGyXBNWp2UBtbRzD5/eoiHXQzF4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbgCDQAj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 4 Mar 2020 11:00:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:50016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726561AbgCDQAi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Mar 2020 11:00:38 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583337638;
        bh=ldhwBdiJCf09VelMcCKiKLy47lhRfru38junmddRuNE=;
        h=Subject:From:Date:To:From;
        b=y+KdnnM3FUE7m1IQcewwkF94Kr9lN4HuNlUp21MfdSf7LKQQaVJ4D9WJ6MWnAQ8S2
         ZuO/ewSAheR4KcrDgJHBo5cUfYGPNXEyzHC1wqr3DZ4a8xGB5FQgzXcQ86ATx5n0Pn
         YICbulgsJoTiXqe74SoQoTgLtpMiNe+j2bPtCTw8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158333763848.15324.11955992774023234427.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 04 Mar 2020 16:00:38 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] ARM: dts: iwg22d-sodimm: Enable touchscreen (2020-03-04T15:44:10)
  Superseding: [v1] ARM: dts: iwg22d-sodimm: Enable touchscreen (2020-02-04T09:22:54):
    ARM: dts: iwg22d-sodimm: Enable touchscreen


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
