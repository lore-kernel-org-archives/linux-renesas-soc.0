Return-Path: <SRS0=PQ6+=A2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8004C433E2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 15 Jul 2020 13:00:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93076206D5
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 15 Jul 2020 13:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594818048;
	bh=9qu9pE7CzRKve8Yo+3cgQ2gK9LNdYRugHpRezJ54Q8Y=;
	h=Subject:From:Date:To:List-ID:From;
	b=qX78XN9Yi4GxJFG6NgUWndZm6U7OSpEsMCXpiM4aJCEqLQXa3/IQeUILVkFJ5M64q
	 L8hxWc+ui5qKdp3uHL/XpH9W5mUGSbccbpP7zNTy6PIWroSRYBJ+H30Ne4a5uyQSOH
	 Oz/UDVvuwAeW/xu9IksEShr5xccBBX9lH+/5iw/o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730054AbgGONAs (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 15 Jul 2020 09:00:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:55316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726335AbgGONAs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 09:00:48 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594818047;
        bh=9qu9pE7CzRKve8Yo+3cgQ2gK9LNdYRugHpRezJ54Q8Y=;
        h=Subject:From:Date:To:From;
        b=I93q9Ij37hkL6GNxFNgkGQ4meT/2Zzqn+K7QoS6M71LHSLFi0XqfEBOOTUeU0C5Xn
         gLU8Hhv8r2nar95n+gcLDwBecHmmK/scUBqJNU4iFwXnWsOobEpkNJ8MLn9VV9TbZs
         TVJFqn0znNminv2VCVXvs0RkK7muGwjfibkoDdtM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159481804793.25641.3485547793599886743.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 15 Jul 2020 13:00:47 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] dt-bidings: media: ov5647 bindings + small fix (2020-07-15T12:48:35)
  Superseding: [v2] dt-bidings: media: ov5647 bindings + small fix (2020-07-14T14:28:53):
    [v2,1/3] dt-bindings: media: ov5647: Convert to json-schema
    [v2,2/3] dt-bindings: media: i2c: Document 'remote-endpoint'
    [v2,3/3] media: MAINTAINERS: ov5647: Add myself as maintainer


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
