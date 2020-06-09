Return-Path: <SRS0=0/JR=7W=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2CCC433DF
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Jun 2020 12:00:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E93882078C
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Jun 2020 12:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591704043;
	bh=Ls2lqLPc/Ntuk9lTBA7gvUHDgidvo7i6M+aeTzylNdk=;
	h=Subject:From:Date:To:List-ID:From;
	b=VdRfrUimBbACyDYxzMuQHgLKLouJ8BPB0yykNwTtVyYAVXAVa5YqAPT+7QQ9Pmc42
	 Cv+3fC46ZxMzlO8BL5r190n7bgpKtX1YgWSu7homWMb2RHjJJcwSsFs6NR91TZena8
	 FHrGeNjeRV6l0QRWzrAvukT4ICMTRLL7GGEO/uUg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729089AbgFIMAn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Jun 2020 08:00:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:58646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727903AbgFIMAm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 08:00:42 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591704042;
        bh=Ls2lqLPc/Ntuk9lTBA7gvUHDgidvo7i6M+aeTzylNdk=;
        h=Subject:From:Date:To:From;
        b=xJazhuLx7XVg6rxSoMAbzUu3cZRG9/9SPt1Gm6oO4RuZLoaSudu/G89bfRVQzX2G/
         IHS/fvpEDAOXXf8dYIxH0fJIl7LNsWGzJS8MqiCrk1ZI/HFT/+XOurURbgOpJKI2Or
         17cQvfh2TJ+BPZNd4eAod0OZ44a6q9yfMtL6hA/s=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159170404220.2748.9125979069953206816.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 09 Jun 2020 12:00:42 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] thermal: rcar_gen3_thermal: Fix undefined temperature if negative (2020-06-09T11:45:10)
  Superseding: [v1] thermal: rcar_gen3_thermal: Fix undefined temperature if negative (2020-06-08T11:12:56):
    thermal: rcar_gen3_thermal: Fix undefined temperature if negative


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
