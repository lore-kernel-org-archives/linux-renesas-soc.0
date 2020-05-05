Return-Path: <SRS0=byYQ=6T=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59740C47254
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 May 2020 16:00:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30F4D206A4
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 May 2020 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588694443;
	bh=CRGUKGQ0xS6FkcthA9+YhDcrXs7xgmyqWmzMpqnNbxw=;
	h=Subject:From:Date:To:List-ID:From;
	b=V3zc+NPcoto9rysoZ+yz7QyhQCUDnyXGxNJr5Sz14WAhKbvALVHhkKAS6hkF/uj7u
	 UgQmWFLUbP3A3TuPssMDODFvM+KPjrMY7dkHEKQgu9haUVkTG4QK6uBkJ2rwlskSOW
	 wg4M9huKSdLEP79Kfd49n1R8bDMmxrWG62foRZ3Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729777AbgEEQAm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 May 2020 12:00:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:46840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729392AbgEEQAm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 May 2020 12:00:42 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588694442;
        bh=CRGUKGQ0xS6FkcthA9+YhDcrXs7xgmyqWmzMpqnNbxw=;
        h=Subject:From:Date:To:From;
        b=KBQzYvGmG5hmzVKApPuL2sCu2Pg88CrMyS4UN3v+2z70tqvf/dDLvrrYiEXCWiekH
         X/nQsoyayqXnNjfcsrq8sQKmJ/bM8IFT7ca8CvJ1ki2kVnrq2ggROM85DFBRfMPPoS
         5049/tc2zYtGcShHsfMx0JDNPhrvgT1gjkE3S/tU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158869444240.14071.8247033737800547514.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 05 May 2020 16:00:42 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] dt-bindings: timer: renesas: tmu: Convert to json-schema (2020-05-05T15:49:44)
  Superseding: [v1] dt-bindings: timer: renesas: tmu: Convert to json-schema (2020-04-08T09:14:51):
    dt-bindings: timer: renesas: tmu: Convert to json-schema

Latest series: [v2] dt-bindings: timer: renesas: cmt: Convert to json-schema (2020-05-05T15:51:27)
  Superseding: [v1] dt-bindings: timer: renesas: cmt: Convert to json-schema (2020-04-08T09:14:16):
    dt-bindings: timer: renesas: cmt: Convert to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
