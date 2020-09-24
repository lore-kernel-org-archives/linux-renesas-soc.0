Return-Path: <SRS0=Oqd3=DB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD6EAC4346E
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Sep 2020 08:20:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78A542068D
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Sep 2020 08:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600935646;
	bh=+fWn0+OHAKXitUQTkJZGYf6AUKk95qkgPg+DyCN895w=;
	h=Subject:From:Date:To:List-ID:From;
	b=ZKyPXnPX3UYEAhvu/QvrzYXsAziPf8X15wOu9EEbZxDiPQY9qDageAPMoSr5RPUif
	 v2q4M4qgq0/D2L7dItqmTCFZ3KMuwDD6DKVHK9YfS+FU5LQoryDho2fs62R8OVmR+H
	 AfFvRhJzmfcHX3yEtw4y8ECJKADVH0+c6Om7F3qA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbgIXIUq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Sep 2020 04:20:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:33386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727089AbgIXIUp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Sep 2020 04:20:45 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600935645;
        bh=+fWn0+OHAKXitUQTkJZGYf6AUKk95qkgPg+DyCN895w=;
        h=Subject:From:Date:To:From;
        b=BDZEQn4amvK+Jt2VOAZ0xdwtv1CH8azQ7SynrM9oLlk87f3AWAIeEQAeSNR38sDQq
         +cbkH8Ic1y6QSN/L7ApBbpC++jJ4omWrmSnvh+pSjxpiXdmLdPN3fgPMJZaMjZd0sn
         SUgLCaSe+++28UM4zjhGKGwd+HpYByKlEjO2g/40=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160093564547.2642.13852499837741506052.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 24 Sep 2020 08:20:45 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v1] ARM: dts: iwg20d-q7-common: Fix touch controller probe failure (2020-09-24T08:05:35)
  Superseding: [v4] ARM: dts: iwg20d-q7-common: Fix touch controller probe failure (2020-08-11T11:53:14):
    [v4] ARM: dts: iwg20d-q7-common: Fix touch controller probe failure


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
