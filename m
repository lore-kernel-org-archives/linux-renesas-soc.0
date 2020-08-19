Return-Path: <SRS0=3qy3=B5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C5AC433DF
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Aug 2020 13:05:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A68A2065F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Aug 2020 13:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597842338;
	bh=XG8FOxg1uPedI+Y/mB0QTKSvn044L1zapKciWYjqlGw=;
	h=Subject:From:Date:To:List-ID:From;
	b=exau6yeFP4eqjglRRhjH5TUlHphsr4mXI6NOd8G4ZDujwOKHUuyt/LQ28+wsVxbrv
	 45TKSBjD7Gin7U00xwQvMOIqp/SBuGzRAfZ+qlqi59Aw3JjYdSJm/fS5E+EtUxTfje
	 2K9GM3Vp2nIoyjwCZkOkEF/kT7bWfZMu2G5m/AME=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728591AbgHSNFf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Aug 2020 09:05:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:49070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727854AbgHSNAm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Aug 2020 09:00:42 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597842041;
        bh=XG8FOxg1uPedI+Y/mB0QTKSvn044L1zapKciWYjqlGw=;
        h=Subject:From:Date:To:From;
        b=CgLmWNGGm97ffFza5dpwCeKce3yOtjOSELO4D5cV400A6Vd6X/A+ClYVsbBzRRtIg
         UyyCdMAgISB6GuKf3+gJqJntdV0iHoEdl2sCq62y6TmhEpHtzEkSPygvM3Ro/4YY/W
         AjWTfrU7xQsqsc0D7EUkc1UzscHHijmstXi5h/EA=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159784204167.22816.421402966713714332.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 19 Aug 2020 13:00:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] dt-bindings: thermal: rcar-thermal: Improve schema validation (2020-08-19T12:44:50)
  Superseding: [v1] dt-bindings: thermal: rcar-thermal: Improve schema validation (2020-06-19T15:15:41):
    dt-bindings: thermal: rcar-thermal: Improve schema validation

Latest series: [v4] dt-bindings: timer: renesas: tmu: Convert to json-schema (2020-08-19T12:43:02)
  Superseding: [v3] dt-bindings: timer: renesas: tmu: Convert to json-schema (2020-05-18T08:15:06):
    [v3] dt-bindings: timer: renesas: tmu: Convert to json-schema

Latest series: [v2] dt-bindings: net: renesas,ether: Improve schema validation (2020-08-19T12:45:39)
  Superseding: [v1] dt-bindings: net: renesas,ether: Improve schema validation (2020-06-19T15:14:29):
    dt-bindings: net: renesas,ether: Improve schema validation


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
