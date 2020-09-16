Return-Path: <SRS0=hv6C=CZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD3DC433E2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Sep 2020 19:01:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37B6921D43
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Sep 2020 19:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600282861;
	bh=0DmDgspG2F1DbUW2FbA3VeWRZjSjDzj/7XZufLTuVVg=;
	h=Subject:From:Date:To:List-ID:From;
	b=BXDV8SdgXaKT/ykpYht6J8v+En7nwG/kWLLCBz4WFeR4Uxr1/B4Nt3Ju7NItZa+dN
	 QBC2h9O+5GxNg0L0ReQjqkNl+67Cjoi73um40vZ1kBNl0uL3lslBcosMd5idX62AMA
	 /KmEE/XC6L44ikTZQq3bmvkK/7RY27YcJva+59xo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727662AbgIPTAw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Sep 2020 15:00:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:54678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727915AbgIPTAs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 15:00:48 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600282848;
        bh=0DmDgspG2F1DbUW2FbA3VeWRZjSjDzj/7XZufLTuVVg=;
        h=Subject:From:Date:To:From;
        b=aOYuYTzfChbmeC5AzAYtDRY+7dW5fC2wOEZc2b4J5PwhKh4nc32wBFoLeElpJMNNO
         DoYexnTVGHHvOZcCq693LLeBWDK9EqEBUz0BYpxZ+UWRsuZN/BMsLs2aE9bWM3D+yw
         pi0N3wQeyomfq06OipLC7S4pzQ+L0OzRnhJLiVzA=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160028284838.7285.15145009135057680760.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 16 Sep 2020 19:00:48 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] tests: Provide {un,}bind testing (2020-09-16T14:18:15)
  Superseding: [v1] tests: Provide {un,}bind testing (2020-05-25T13:21:48):
    [VSP-Tests] tests: Provide {un,}bind testing


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
