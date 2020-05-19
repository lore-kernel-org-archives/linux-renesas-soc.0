Return-Path: <SRS0=6Nvj=7B=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 721A0C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 May 2020 01:20:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49CA92072C
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 May 2020 01:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589851242;
	bh=CI3IVwLtSS5blDoEJwlzVz05CBDXoHttpFsGYwpxMyg=;
	h=Subject:From:Date:To:List-ID:From;
	b=yJQsPywLOPOv1NgWTYjlSH36t1DM0k1LA3y04zmmZx5I+erm9qnbYs24unlIE2Z1O
	 RdXlZ22zdvmCKDvCswN+NAx4s2xxgNTMPDp750sggI8d2V6ddQsVTgDc2u1KWkxlVT
	 EjInhT7zs0JOTyK20fGVHo1ad5HbUbsZcfzWEbuA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgESBUm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 May 2020 21:20:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:33230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726292AbgESBUl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 May 2020 21:20:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589851241;
        bh=CI3IVwLtSS5blDoEJwlzVz05CBDXoHttpFsGYwpxMyg=;
        h=Subject:From:Date:To:From;
        b=kssLiNFui6qa85hioZS26qLrwSXdkp//sOPGXluLOxedAPizlqm/bvwsKvD+9TZ41
         F4As4hVVpbaZWF2AVLj+M/DNJQKVSDCceTGpJC59YJj745TXK3uhLv2jLCng6j+ocp
         vJi64DuMmF4NGDlJrX1G68+LvY+iGfABkjyd11Ts=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158985124158.3062.12517251673943048463.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 19 May 2020 01:20:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] ov5647 driver improvement (2020-05-19T01:16:15)
  Superseding: [v1] ov5647 driver improvement (2020-04-13T09:17:43):
    [1/4] media: ov5647: Add set_fmt and get_fmt calls.
    [2/4] media: ov5647: Add support for PWDN GPIO.
    [3/4] media: ov5647: Add support for non-continuous clock mode
    [4/4] media: ov5647: Use gpiod_set_value_cansleep


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
